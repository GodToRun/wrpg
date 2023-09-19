 
package db;
import rpg.MonsterGenerator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import rpg.MonsterGenerator;
import java.net.Socket;
import java.net.ServerSocket;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	MonsterGenerator generator;
	int pindex = -1;
	static Cookie listCookie = new Cookie("plist", "NOP");
	public static Room main_room = new Room("main_room"), gm_room = new Room("gm_room");
	public int joinRoom(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getAttribute("id"); 
	    String name = (String)request.getAttribute("name");
	    Player player = new Player(main_room, name, id);
	    
	    if (!main_room.players.contains(player)) {
	    	main_room.players.add(player);
	    	int index = main_room.players.indexOf(player);
	    	response.addCookie(new Cookie("pindex", ""+ index));
	    	return index;
	    }
	    return -1;
	}
	@Override
	public void init() throws ServletException {
		if (generator == null) {
			generator = new MonsterGenerator(this);
			generator.start();
		}
	}
	public static Cookie getCookieC(HttpServletRequest request, String name) {
		Cookie toret = null;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals(name)) {
				toret = cookie;
				break;
			}
		}
		return toret;
	}
	public static String getCookie(HttpServletRequest request, String name) {
		return getCookieC(request, name).getValue();
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
    throws ServletException, IOException {
	   HttpSession session = request.getSession();	
	   String name="", id="";
	   String gubun = request.getParameter("gubun");
	   if(gubun.equals("login")) { //회원여부
	       try {
	    	   
		       String loginYN = login(request,response);
		       MemberVO memberVO = null;
			   request.setAttribute("id", request.getParameter("id"));
			   MemberDAO dao = new MemberDAO();
			   List<MemberVO> memberVOs = dao.getMemberList();
			   for (MemberVO vo : memberVOs) {
				   if (vo.getId().equals(request.getAttribute("id"))) {
					   memberVO = vo;
					   request.setAttribute("name", vo.getName());
					   break;
				   }
			   }
			   
			   if (loginYN.equals("Y")) {
				   pindex = joinRoom(session, request, response);
				   Player p = main_room.players.get(pindex);
				   p.setMemberVO(memberVO);
				   RequestDispatcher requestDispatcher = request.getRequestDispatcher("screen.jsp");
		     	   requestDispatcher.forward(request, response);
			   }

		   } catch (Exception e) {
		       e.printStackTrace();
      	   }
	   }
	   else if (gubun.equals("pinfo")) {
		   RequestDispatcher requestDispatcher = request.getRequestDispatcher("/myinfo.jsp");
     	   requestDispatcher.forward(request, response);
	   }
	   else if(gubun.equals("join")) { //회원가입
	       try {
	           RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/join.jsp");
	     	   requestDispatcher.forward(request, response);
	    	   
		   } catch (Exception e) {
		       e.printStackTrace();
      	   }		   
	   }
    }
	

	public String login(HttpServletRequest request,HttpServletResponse response)
	throws Exception{
	    String id = request.getParameter("id"); 
	    String pwd = request.getParameter("pwd");

	    MemberDAO dao=new MemberDAO();
	    String loginYN=dao.login(id,pwd,request.getSession());

	    return loginYN;
	 }

}
    

