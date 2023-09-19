package db; 
import java.sql.Connection; 
import java.sql.Date;
import java.sql.DriverManager; 
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.Statement;
import java.util.ArrayList; 
import java.util.List; 

import javax.servlet.http.HttpSession;

public class MemberDAO { 
public static final String driver = "oracle.jdbc.driver.OracleDriver"; 
public static final String url = "jdbc:oracle:thin:@localhost:1521:XE"; 
public static final String user = "system"; 
public static final String pwd = "manager"; 
private Connection con; 
//private Statement stmt; 
private PreparedStatement stmt;
private ResultSet rs; 

public String login(String id, String pwd, HttpSession session) {
	String strReturn="";
	try 
	{
		//DB 연결
	    connDB();
	    SHA256 sha = new SHA256();
	    //DATABASE SQL 쿼리 (세미콜론 X)
	    String query = "SELECT ID,PWD,NAME,CREATE_DATE,GENDER,WRPG_LEVEL FROM WRPG_USER_TABLE ";
	           query +=  " WHERE 1=1 ";
	           //query += " AND ID='"+id+"' AND PWD ='"+pwd+"'";
	           query += " AND ID=? AND PWD =?";
        stmt = con.prepareStatement(query);
        stmt.setString(1, id);
   		stmt.setString(2, sha.encrypt(pwd));

   		rs = stmt.executeQuery(); //실행시켜서 반환값으로 ResultSet을 얻음 
      	    
	    if (rs.next()) { //열 만큼 반복
	    	/*MemberVO memberVO = new MemberVO();
	    	memberVO.setName(rs.getString("name"));
	    	memberVO.setId(rs.getString("id"));
	    	memberVO.setPwd(rs.getString("pwd"));
	    	memberVO.setLevel(rs.getInt("wrpg_level"));
	    	memberVO.setExp(rs.getInt("wrpg_exp"));
	    	memberVO.setStr(rs.getInt("wrpg_str"));
	    	memberVO.setInt(rs.getInt("wrpg_int"));
	    	memberVO.setLuk(rs.getInt("wrpg_luk"));
	    	memberVO.setCareer(rs.getString("wrpg_career"));
	    	session.setAttribute("create_user", memberVO.getId());
	    	session.setAttribute("current_member", memberVO);*/
	    	strReturn ="Y";  
	    } else {
	    	strReturn ="N";
	    }
	    //결과, 스테티먼트, 콘넥션 닫음 (중요)
	    rs.close();
	    stmt.close();
	    con.close();
	} catch (Exception e) {
	    e.printStackTrace();
	}
	//리스트 리턴, ServerReturn.jsp로 점프
	return strReturn;
} 
public void updateMember(MemberVO vo) {
	try 
	{
		//DB 연결
	    connDB();
	    if (con==null) return;
	    if (vo.getInv() != null && vo.getInv().length() >= 500) vo.setInv(vo.getInv().substring(0, 500));
	    //DATABASE SQL 쿼리 (세미콜론 X)
	    String query = "UPDATE WRPG_USER_TABLE SET WRPG_HP = " + vo.getHp() + ", WRPG_MAXHP = " + vo.getMaxHp() + ", WRPG_CAREER = '" + vo.getCareer() + "', WRPG_LEVEL = " + vo.getLevel() + ", WRPG_EXP = " + vo.getExp() + ", WRPG_AD = " + vo.getAD() + ", WRPG_AP = " + vo.getAP() + ", WRPG_POSX = " + vo.getPosX() + ", WRPG_POSY = " + vo.getPosY() + ", WRPG_INV = '" + vo.getInv() + "', WRPG_SWORD = '" + vo.getSword() + "', WRPG_ARMOR = '" + vo.getArmor() + "', GENDER = '" + vo.getGender() + "', WRPG_COIN = " + vo.getCoin() + " WHERE ID = '" + vo.getId() + "'";
	    stmt = con.prepareStatement(query);
	    ResultSet rs = stmt.executeQuery(query); //실행시켜서 반환값으로 ResultSet을 얻음
	    //결과, 스테티먼트, 콘넥션 닫음 (중요)
	    rs.close();
	    stmt.close();
	    con.close();
	} catch (Exception e) {
		System.out.println("Error while update VO");
	    e.printStackTrace();
	}
}

public List<MemberVO> getMemberList() {
	List<MemberVO> list = new ArrayList<MemberVO>(); 
	
	try 
	{
		//DB 연결
	    connDB();

	    //DATABASE SQL 쿼리 (세미콜론 X)
	    String query = "SELECT ID,PWD,NAME,CREATE_DATE,WRPG_LEVEL,WRPG_EXP,WRPG_AD,WRPG_AP,WRPG_POSX,WRPG_POSY,WRPG_CAREER,WRPG_HP,WRPG_MAXHP,WRPG_INV,WRPG_ARMOR,WRPG_SWORD,GENDER,WRPG_COIN FROM WRPG_USER_TABLE";
	    stmt = con.prepareStatement(query);
	    ResultSet rs = stmt.executeQuery(query); //실행시켜서 반환값으로 ResultSet을 얻음 
	    while (rs.next()) { //열 만큼 반복
			String id = rs.getString("id");
			String pwd = rs.getString("pwd");
			String name = rs.getString("name");     
			String gender = rs.getString("gender");
			if (gender==null){System.out.println("warning: gender==null");}
			int level = rs.getInt("wrpg_level");
			int exp = rs.getInt("wrpg_exp");
			int ad = rs.getInt("wrpg_ad");
			int ap = rs.getInt("wrpg_ap");
			float posx = rs.getFloat("wrpg_posx");
			float posy = rs.getFloat("wrpg_posy");
			String career = rs.getString("wrpg_career");
			int hp = rs.getInt("wrpg_hp");
			int maxhp = rs.getInt("wrpg_maxhp");
			String inv = rs.getString("wrpg_inv");
			String sword = rs.getString("wrpg_sword");
			String armor = rs.getString("wrpg_armor");
			int coin = rs.getInt("wrpg_coin");
			MemberVO vo = new MemberVO(); //새 인스턴스 생성
	        //멤버 데이터 설정
	        vo.setId(id); 
	        vo.setPwd(pwd);
	        vo.setName(name);
	        vo.setGender(gender);
	        vo.setLevel(level);
	        vo.setExp(exp);
	        vo.setAD(ad);
	        vo.setAP(ap);
	        vo.setPos(posx, posy);
	        vo.setCareer(career);
	        vo.setHp(hp);
	        vo.setMaxHp(maxhp);
	        vo.setInv(inv);
	        vo.setSword(sword);
	        vo.setArmor(armor);
	        vo.setCoin(coin);
	        //리스트에 vo 추가
	        list.add(vo);
	    }
	    //결과, 스테티먼트, 콘넥션 닫음 (중요)
	    rs.close();
	    stmt.close();
	    con.close();
	} catch (Exception e) {
	    e.printStackTrace();
	}
	//리스트 리턴, ServerReturn.jsp로 점프
	return list;
} 

private void connDB() { 
	try {
	    Class.forName(driver);
	    con = DriverManager.getConnection(url, user, pwd);
	    //stmt = con.prepareStatement();    
	} catch (Exception e) {
	    e.printStackTrace();}} 
	} 

