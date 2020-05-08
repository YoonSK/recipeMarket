package com.kh.recipeMarket.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.recipeMarket.board.model.service.BoardService;
import com.kh.recipeMarket.board.model.vo.Qna;
import com.kh.recipeMarket.member.model.vo.Member;

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{
    //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
    
    @Autowired
	private BoardService bService;

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	Map<String,Object> map = session.getAttributes();
    	Member loginUser = (Member)map.get("loginUser");
    	int memberNo = loginUser.getMemberNo();
    	
    	if(memberNo == 0) {
    		memberNo = 1;
    	}
    	
    	
    	
    	String chatList = "";
    	ArrayList<Qna> qlist = bService.selectQnaList(memberNo);
    	
    	for(Qna qna : qlist) {
    		chatList += qna.getNickName() + " : " + qna.getContent() + "\n";
    	}
    	session.sendMessage(new TextMessage(chatList));
        sessionList.add(session);
        logger.info("{} 연결됨", session.getId()); 
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	Map<String,Object> map = session.getAttributes();
    	Member loginUser = (Member)map.get("loginUser");
    	int memberNo = loginUser.getMemberNo();
    	String content = message.getPayload();
    	String userNick = loginUser.getNickName();
    	
    	
    	
    	
    	Qna q = new Qna();
    	q.setContent(message.getPayload());
    	q.setMemberNo(memberNo);
    	  
    	int result = bService.insertQna(q); 
    	    	
    	if(result > 0) {
    		
    	}

        logger.info("{}: {} ", userNick, message.getPayload());
        //모든 유저에게 메세지 출력
        for(WebSocketSession sess : sessionList){
            sess.sendMessage( new TextMessage(userNick+ ":" + message.getPayload()));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김.", session.getId());
    }
    
}

