package rpg;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import db.MemberServlet;
import db.Player;

@ServerEndpoint("/chatsocket")
public class ChatSocket {
	public static String chat;
	Player searchUserBySession(Session session) {
		for (Player p : MemberServlet.main_room.players) {
			if (p.getChatSession() == session) return p;
		}
		return null;
	}
	@OnOpen
	public void onOpen(Session session) {
		Player p = MemberServlet.main_room.players.get(MemberServlet.main_room.players.size()-1);
		p.setChatSession(session);
		System.out.println("ChatSocket 연결: " + p);
	}
	@OnMessage
	public String onMessage(Session session, String msg) {
		Player p = searchUserBySession(session);
		if (msg.length() > 0)
			chat += p.memberVO.getName() + ": " + msg + "\n";
		if (chat == null) chat = "\n";
		return chat;
	}
}
