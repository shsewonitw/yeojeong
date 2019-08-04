package com.tje.yeojeong.websocket;


import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.xml.bind.JAXBElement.GlobalScope;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.tje.yeojeong.websocket.*;

@Controller
public class WebSocketClient extends TextWebSocketHandler{
	@Autowired
	ChatInfo chatInfo;
	// 웹 소켓 클라이언트가 서버로 연결될 때,
		// 각 클라이언트마다 한번만 실행되는 메소드
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			// 클라이언트가 연결되면 세션 아이디의 값을 출력
			System.out.printf("%s가 연결됨\n",session.getId());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Calendar time = Calendar.getInstance();
			String now = sdf.format(time.getTime());
			
			chatInfo.getChatMap().put(session, session.getId()+"님이 "+now+" 에 접속하였습니다.");
			
			
		}
		
		// 웹 소켓 클라이언트가 서버측으로 데이터를 전송할 때 실행되는 메소드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			System.out.printf("%s로부터 [%s]를 받음\n",session.getId(), message.getPayload());
			String msgByUser = message.getPayload();
			String beforeMsg = chatInfo.getChatMap().get(session);
			String msg = beforeMsg + "<br>" + msgByUser;
			chatInfo.getChatMap().put(session, msg);

			// 세션을 사용하여 클라이언트에게 텍스트 메세지를 전송
//			session.sendMessage(new TextMessage("echo : " + message.getPayload()));
			
		}
		
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

			System.out.printf("%s가 연결종료됨\n",session.getId());
			chatInfo.getChatMap().remove(session);
		}
		

		
}
