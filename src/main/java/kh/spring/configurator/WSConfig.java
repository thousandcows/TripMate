package kh.spring.configurator;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

import org.springframework.beans.factory.annotation.Autowired;

import kh.spring.dao.MemberDAO;

public class WSConfig extends Configurator{
	
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession session = (HttpSession)request.getHttpSession();
		sec.getUserProperties().put("hSession", session);
		super.modifyHandshake(sec, request, response);
	}
}
