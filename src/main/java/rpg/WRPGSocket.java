package rpg;

import javax.servlet.http.Cookie;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import db.MemberDAO;
import db.MemberServlet;
import db.Player;

@ServerEndpoint("/socket")
public class WRPGSocket {
	Player searchUserBySession(Session session) {
		for (Player p : MemberServlet.main_room.players) {
			if (p.getSession() == session) return p;
		}
		return null;
	}
	@OnOpen
	public void onOpen(Session session) {
		Player p = MemberServlet.main_room.players.get(MemberServlet.main_room.players.size()-1);
		p.setSession(session);
		
		System.out.println("Socket 연결: " + p);
	}
	@OnMessage
	public String onMessage(Session session, String msg) {
		Player p = searchUserBySession(session);
		Player player = p;
		if (player==null) {
			System.out.println("* cannot find player");
			return null;
		}
		if (player.memberVO == null) {
			System.out.println("* cannot find playerVO");
			return null;
		}
		if (player.memberVO.getExp() >= 13.4316f*Math.pow(Math.sqrt(player.memberVO.getLevel()), 2.718)) {
			   player.memberVO.setLevel(player.memberVO.getLevel()+1);
			   player.memberVO.setExp(0);
			   player.memberVO.setMaxHp(player.memberVO.getMaxHp()+2);
			   player.memberVO.setAP(player.memberVO.getAP()+1);
			   player.memberVO.setAD(player.memberVO.getAD()+1);
		   }
		float x = p.memberVO.getPosX();
		float y = p.memberVO.getPosY();
		String amount[] = msg.split(";");
		for (String a : amount) {
			String[] kv = a.split("=");
			if (kv[0].equals("x")) {
				if (kv[1].equals("?")) x = p.memberVO.getPosX();
				else x = Float.parseFloat(kv[1]);
			}
			else if (kv[0].equals("y")) {
				if (kv[1].equals("?")) y = p.memberVO.getPosY();
				else y = Float.parseFloat(kv[1]);
			}
			else if (kv[0].equals("hp")) {
				p.memberVO.setHp(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("ad")) {
				p.memberVO.setAD(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("ap")) {
				p.memberVO.setAP(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("maxhp")) {
				p.memberVO.setMaxHp(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("hp")) {
				p.memberVO.setHp(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("sword")) {
				p.memberVO.setSword(kv[1]);
			}
			else if (kv[0].equals("armor")) {
				p.memberVO.setArmor(kv[1]);
			}
			else if (kv[0].equals("career")) {
				p.memberVO.setCareer(kv[1]);
			}
			else if (kv[0].equals("exp")) {
				p.memberVO.setExp(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("coin")) {
				p.memberVO.setCoin(Integer.parseInt(kv[1]));
			}
			else if (kv[0].equals("inv")) {
				p.memberVO.setInv(kv[1]);
			}
			else if (kv[0].equals("expbuff")) {
				p.expbuff = Float.parseFloat(kv[1]);
			}
			else if (kv[0].equals("stealth")) {
				p.stealth = Boolean.parseBoolean(kv[1]);
			}
			else if (kv[0].startsWith("playertex")) {
				int index = Integer.parseInt(kv[0].substring(9));
				MemberServlet.main_room.players.get(index).image = kv[1];
			}
			else if (kv[0].startsWith("monsterhp")) {
				int num = (int)Integer.parseInt(kv[0].substring(9));
				int hp = Integer.parseInt(kv[1]);
				if (num < MonsterGenerator.monsters.size())
					MonsterGenerator.monsters.get(num).hp = hp;
			}
		}
		
		p.memberVO.setPos(x, y);
		MemberDAO dao = new MemberDAO();
		   dao.updateMember(p.memberVO);
		   MonsterGenerator.refresh();
		   String c = ";monstercount="+MonsterGenerator.monsters.size()+";";
		   int i = 0;
		   for (Monster mon : MonsterGenerator.monsters) {
			   c += "monster" + i + "=" + true + ";";
			   c += "monsterx" + i + "=" + mon.posx + ";";
			   c += "monstery" + i + "=" + mon.posy + ";";
			   c += "monsterhp" + i + "=" + mon.hp + ";";
			   c += "monstermaxhp" + i + "=" + mon.maxhp + ";";
			   c += "monstertex" + i + "=" + mon.imageURL + ";";
			   c += "monsterw" + i + "=" + mon.w + ";";
			   c += "monster!h" + i + "=" + mon.h + ";";
			   i++;
		   }
		   i = 0;
		   String ps = ";playercount="+MemberServlet.main_room.players.size()+";";
		   for (Player pl : MemberServlet.main_room.players) {
			   ps += "player" + i + "=" + true + ";";
			   ps += "playerx" + i + "=" + pl.memberVO.getPosX() + ";";
			   ps += "playery" + i + "=" + pl.memberVO.getPosY() + ";";
			   ps += "playertex" + i + "=" + pl.image + ";";
			   i++;
		   }
		   

		return "coin=" + p.memberVO.getCoin() + ";sex="+p.memberVO.getGender() + ";name="+p.memberVO.getName() + ";inv=" + p.memberVO.getInv() + ";pindex=" + MemberServlet.main_room.players.indexOf(p) + ";x=" + x + ";y=" + y + ";hp=" + p.memberVO.getHp() + ";maxhp=" + p.memberVO.getMaxHp()+c + "exp="+p.memberVO.getExp() + ";level=" + p.memberVO.getLevel() + ";ad="+p.memberVO.getAD() + ";ap="+p.memberVO.getAP() + ";career="+p.memberVO.getCareer() + ps + "sword="+p.memberVO.getSword() + ";armor="+p.memberVO.getArmor();
	}
	// WebSocket과 브라우저가 접속이 끊기면 요청되는 함수
	  @OnClose
	  public void handleClose(Session session) {
		  Player p = searchUserBySession(session);
		  p.leaveRoom();
	    // 콘솔에 접속 끊김 로그를 출력한다.
	    System.out.println("Lost connection: " + p);
	  }
	  // WebSocket과 브라우저 간에 통신 에러가 발생하면 요청되는 함수.
	  @OnError
	  public void handleError(Throwable t) {
	    // 콘솔에 에러를 표시한다.
	    t.printStackTrace();
	  }
}
