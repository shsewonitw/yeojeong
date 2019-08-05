package com.tje.yeojeong.websocket;

import java.util.Hashtable;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Controller
public class WebSocketAdmin extends TextWebSocketHandler {
	@Autowired
	ChatInfo chatInfo;
	
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 클라이언트가 연결되면 세션 아이디의 값을 출력
		System.out.printf("%s(관리자)가 연결됨\n", session.getId());
		chatInfo.getAdmin().put("admin", session);
	}
	

	
	// 웹 소켓 클라이언트가 서버측으로 데이터를 전송할 때
		// 실행되는 메소드
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			
			String adminMsg = message.getPayload();
			StringTokenizer st = new StringTokenizer(adminMsg,"|");
			String clientId = null;
			String realMsg = null;
			if(st.hasMoreTokens()) {
				clientId = st.nextToken();
				realMsg = st.nextToken();
			}

			
			for(WebSocketSession sess : chatInfo.getChatMap().keySet()) {
				if( sess.getId().equals(clientId) ) {
					sess.sendMessage(new TextMessage(realMsg));
					

					String beforeMsg = chatInfo.getChatMap().get(sess);
					String msg = beforeMsg + "<div class='alert alert-success' role='alert' style='clear:both;float:right;max-width:280px;word-break:break-all;text-align:right;'>"+realMsg+"</div>";
					chatInfo.getChatMap().put(sess,msg);
				}
			}
			
			
			
//			// 각 세션의 첫번째 메세지 전달 코드는 별칭 전달
//			String id = session.getId();
//			if( sessionMap.get(id).getAlias() == null ) {
//				StringBuffer idAndAliases = new StringBuffer("newClient:"); 
//				for( String key : sessionMap.keySet() ) {
//					System.out.printf("%s, %s\n", id, key);
//					if( key.equals(id) ) {
//						System.out.printf("%s, %s - continue\n", id, key);
//						continue;
//					}
//					
//					idAndAliases.append(String.format("%s (%s),", 
//							sessionMap.get(key).getAlias(), key));	
//				}		
//				
//				session.sendMessage(
//						new TextMessage(
//								idAndAliases.toString()));
//				
//				sessionMap.get(id).setAlias(message.getPayload());
//				
//				sendClientAliases(id);
//				return;
//			}
//			
//			// 클라이언트가 전송한 데이터를 출력
//			System.out.printf("%s로부터 [%s]를 받음\n", 
//					sessionMap.get(id).getAlias(), 
//					message.getPayload());
//			
//			StringTokenizer st = new StringTokenizer(message.getPayload(), ":@");
//			st.nextToken();	// to
//			String target = st.nextToken();	// target ID
//			String msg = st.nextToken();	// message
//			
//			if( !target.equals("all") ) {
//				sessionMap.get(target).getSession().sendMessage(
//					new TextMessage(
//						"(" + sessionMap.get(id).getAlias() + " 님으로부터 쪽지) : " + msg));
//			} else {		
//				// 메세지를 보낸 클라이언트를 제외한 모든 클라이언트들에게 메세지 전송		
//				for( String key : sessionMap.keySet() ) {
//					if( key.equals(id) )
//						continue;
//					
//					sessionMap.get(key).getSession().sendMessage(
//							new TextMessage(sessionMap.get(id).getAlias() + " : " + message.getPayload()));
//				}
//			}
		}
		
		@Override
		public void afterConnectionClosed(
				WebSocketSession session, CloseStatus status) throws Exception {
			System.out.printf("%s(관리자)가 연결종료됨\n",session.getId());
			chatInfo.getAdmin().remove("admin");
		}
		
}
