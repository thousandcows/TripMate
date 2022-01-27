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

@ServerEndpoint(value = "/notice", configurator = WSConfig.class) // 우리가 만든 Config를 쓰게함
public class NoticeEndpoint {

	private HttpSession session;
	// static으로 해야 여러명이 접속해도 같은 List를 공유할 수 있다.(마찬가지로 동기화 처리해야함)
//	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private static Map<Integer, Session> map = Collections.synchronizedMap(new HashMap<>());
	int logSeq = 0; // 어차피 한명 들어오면 새로 생성되니까 이걸로 리셋시킴 이방법아니면 에러남
	@OnOpen
	public void onConnect(Session session, EndpointConfig config) { // 핸드쉐이크한 config 받아옴
//		clients.add(session);
		// Config에서 넣은 세션을 가져옴
		this.session = (HttpSession) config.getUserProperties().get("hSession");
		String loginNick = (String) this.session.getAttribute("loginNick");
		if (loginNick != null) {
			this.logSeq = (int) this.session.getAttribute("loginSeq");
			map.put(logSeq, session);
		}
	}

	@OnMessage
	public void onMessage(String message) {
		Gson gson = new Gson();
		ReactionDTO dto = gson.fromJson(message, ReactionDTO.class);
		int ReactionTarget = dto.getMem_seq();
		int Reactioner = dto.getLoginSeq();
		System.out.println("현재 로그인중인 사용자 수 : " + this.map.size());
		synchronized (map) { // 동기화 (포문 도는 중간에 한명이 나가버리면 예외발생해서 그걸 막음)
			for (Map.Entry<Integer, Session> entry : map.entrySet()) {
				Integer loginSeq = entry.getKey();
				if (ReactionTarget == loginSeq && ReactionTarget != Reactioner) {
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
		map.remove(this.logSeq, session);
	}
}
