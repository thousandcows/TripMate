package kh.spring.endpoint;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kh.spring.configurator.AppContext;
import kh.spring.configurator.WSConfig;
import kh.spring.dao.MemberDAO;
import kh.spring.statics.Statics;

@ServerEndpoint(value = "/user", configurator = WSConfig.class)
public class UserEndpoint {

//	private Provider<MemberDAO> provider; DL의 좀 최신사용법
	
//	private MemberDAO dao = AppContext.getContext().getBean(MemberDAO.class);
													// getBean이 DL을 뜻함.
	@OnOpen
	public void onCon(Session session, EndpointConfig config) {
		Statics.TOTAL_CON += 1;
	}
	
	@OnClose
	public void onClose(Session session) {}
}
