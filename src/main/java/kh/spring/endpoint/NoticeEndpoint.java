package kh.spring.endpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import kh.spring.configurator.WSConfig;
import kh.spring.dto.ReactionDTO;
import kh.spring.service.MemberService;

@ServerEndpoint(value = "/notice", configurator = WSConfig.class) // 우리가 만든 Config를 쓰게함
public class NoticeEndpoint {
	
	private HttpSession session;
	// static으로 해야 여러명이 접속해도 같은 List를 공유할 수 있다.(마찬가지로 동기화 처리해야함)
//	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private static Map<String, Session> map = Collections.synchronizedMap(new HashMap<>());

	@OnOpen
	public void onConnect(Session session, EndpointConfig config) { // 핸드쉐이크한 config 받아옴
//		clients.add(session);
		// Config에서 넣은 세션을 가져옴
		this.session = (HttpSession) config.getUserProperties().get("hSession");
		String loginNick = (String) this.session.getAttribute("loginNick");
		if (loginNick != null) {
			map.put(loginNick, session);
		}
	}

	@OnMessage
	public void onMessage(String message) {
		Gson gson = new Gson();
		ReactionDTO dto = gson.fromJson(message, ReactionDTO.class);
		String ReactionTarget = dto.getNick();
		String Reactioner = dto.getReactioner();
		synchronized (map) { // 동기화 (포문 도는 중간에 한명이 나가버리면 예외발생해서 그걸 막음)
			for (Map.Entry<String, Session> entry : map.entrySet()) {
				String nick = entry.getKey();
				if (nick.equals(ReactionTarget) && !ReactionTarget.equals(Reactioner)) {
					try {
						entry.getValue().getBasicRemote().sendText(gson.toJson(dto));
						break;
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
//		clients.remove(session);
		String loginNick = (String) this.session.getAttribute("loginNick");
		map.remove(loginNick, session);
	}
}
