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

import kh.spring.configurator.WSConfig;

@ServerEndpoint(value="/notice", configurator = WSConfig.class) // 우리가 만든 Config를 쓰게함
public class NoticeEndpoint {
	
	private HttpSession session;
	// 클라이언트의 접속정보를 담을 세션이 있는데, 클라이언트는 한명만 접속하는게 아니기때문에 밖으로 꺼내서 List에 세션들을 담는다.
	// static으로 해야 여러명이 접속해도 같은 List를 공유할 수 있다.(마찬가지로 동기화 처리해야함)
//	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());
	private static Map<String, Session> map = Collections.synchronizedMap(new HashMap<>());
	
	@OnOpen // 엔드포인트로 클라이언트 접속시 실행되는 어노테이션
	public void onConnect(Session session, EndpointConfig config) { // 핸드쉐이크한 config 받아옴
//		clients.add(session);
		// Config에서 넣은 세션을 가져옴
		this.session = (HttpSession) config.getUserProperties().get("hSession");
		String nick = (String) this.session.getAttribute("loginNick");
		map.put(nick, session);
		System.out.println(nick + " 님 로그인");
	}
	// 해쉬맵으로 nick을 키로주고 세션을 밸류로 줘서 저장한 후, 이벤트 발생시 해당 키값의 세션으로 메세지를 뿌리면 실시간은 가능할거같은데 으엉ㄴㅁ어
	@OnMessage
	public void onMessage(String message) {
		System.out.println("웹소켓 들어온 메세지 : " + message);
		synchronized (map) { // 동기화 (포문 도는 중간에 한명이 나가버리면 예외발생해서 그걸 막음)
			System.out.println("맵 사이즈 : " + map.size());
			for (Map.Entry<String, Session> entry : map.entrySet()) {
				String nick = entry.getKey();
				System.out.println("포문도는 닉 : " + nick);
				if(nick.equals(message)) {
					System.out.println("닉일치");
					try {
						entry.getValue().getBasicRemote().sendText("하이바이마마아아낭늠아음나앚ㅂ더ㅏㄴ어나ㅓ아ㅓㄴ");
						System.out.println("보냄");
						break;
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
	}

	@OnClose
	public void onClose(Session session) {
//		clients.remove(session);
		String nick = (String) this.session.getAttribute("loginNick");
		map.remove(nick);
		System.out.println(nick + " 님 접속 끊김");
	}
}
