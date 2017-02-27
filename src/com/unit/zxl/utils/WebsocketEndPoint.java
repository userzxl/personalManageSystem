/**
 * 
 */
package com.unit.zxl.utils;


import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * @author 34848
 *
 */
public class WebsocketEndPoint extends TextWebSocketHandler {
	@Override
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		super.handleTextMessage(session, message);
		TextMessage returnMessage = new TextMessage(message.getPayload()+"received at servier");
		session.sendMessage(returnMessage);
		}

}
