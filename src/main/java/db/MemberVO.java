package db; 
import java.sql.Date; 
public class MemberVO 
{
	private String id; 
	private String pwd; 
	private String name; 
	private String gender;
	private int level;
	private int exp;
	private int hp, maxhp;
	private String career;
	private float posx, posy;
	private int ad, ap;
	private String inv;
	private String sword, armor;
	public int coin;
	public int getCoin() {
		return coin;
	}
	public void setCoin(int coin) {
		this.coin = coin;
	}
	public String getSword() {
		return sword;
	}
	public void setSword(String sword) {
		this.sword = sword;
	}
	public String getArmor() {
		return armor;
	}
	public void setArmor(String armor) {
		this.armor = armor;
	}
	public int getHp() {
		return hp;
	}
	public void setHp(int hp) {
		this.hp = hp;
	}
	public int getMaxHp() {
		return maxhp;
	}
	public void setMaxHp(int maxhp) {
		this.maxhp = maxhp;
	}
	public int getExp() {
		return exp;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public void setPos(float x, float y) {
		posx = x;
		posy = y;
	}
	public float getPosX() {
		return posx;
	}
	public float getPosY() {
		return posy;
	}
	public void setAD(int ad) {
		this.ad = ad;
	}
	public int getAD() {
		return this.ad;
	}
	public void setAP(int ap) {
		this.ap = ap;
	}
	public String getInv() {
		return inv;
	}
	public void setInv(String inv) {
		this.inv = inv;
		if (this.inv==null)this.inv=" ";
		this.inv = this.inv.replace("null", "");
	}
	public int getAP() {
		return this.ap;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void addInv(String item) {
		this.setInv(this.getInv() + "," + item);
		this.setInv(this.getInv().replace("null", ""));
	}
	
}
