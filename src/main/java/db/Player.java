package db;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

public class Player {
	private Room room;
	public HttpServletRequest req;
	public HttpServletResponse res;
	public MemberVO memberVO;
	public float expbuff = 1;
	public String image;
	// need for check lost connection
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	private String name, id;
	public float speed = 1.5f;
	public boolean stealth = false;
	private Session session, chatSession;
	public void setSession(Session session) {
		this.session = session;
	}
	public Session getSession() {
		return session;
	}
	public void setChatSession(Session session) {
		this.chatSession = session;
	}
	public Session getChatSession() {
		return chatSession;
	}
	public void leaveRoom() {
		MemberServlet.main_room.players.remove(this);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void die() {
		memberVO.setExp(0);
		//memberVO.setHp(memberVO.getMaxHp());
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Player(Room room, String name, String id) {
		this.room = room;
		this.name = name;
		this.id = id;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public Room getRoom() {
		return room;
	}
}
