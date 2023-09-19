package rpg;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.MemberServlet;
import db.Player;
public class MonsterGenerator extends Thread {
	public static ArrayList<Monster> monsters = new ArrayList<Monster>();
	float c = 0f, c2 = 0f, c3 = 0f, c4 = 0f, c5 = 0f, c6 = 0f, c7 = 999999f;
	long last_time;
	MemberServlet servlet;
	public static boolean needUpdate = false;
	public MonsterGenerator(MemberServlet servlet) {
		this.servlet = servlet;
		last_time = System.nanoTime();
	}
	public boolean canSpawn(Class<?> monsterType, int max) {
		int num = 0;
		for (Monster m : monsters) {
			if (m.getClass() == monsterType) {
				num++;
			}
		}
		return num < max;
	}
	@Override
	public void run() {
		while (true) {
			float delta = ((float)(System.nanoTime() - last_time))/900000000f;
			last_time = System.nanoTime();
			try {
			ml:
			for (int i = 0; i < monsters.size(); i++) {
				if (i >= monsters.size()) break ml;
				Monster m = monsters.get(i);
				if (m==null) continue;
				m.target = null;
				pl:
				for (int j = 0; j < servlet.main_room.players.size(); j++) {
					if (j >= servlet.main_room.players.size()) break pl;
					Player p = servlet.main_room.players.get(j);
					double dx = Math.abs(p.memberVO.getPosX()-m.posx);
					double dy = Math.abs(p.memberVO.getPosY()-m.posy);
					if (dx < 9 && dy < 9 && !p.stealth) {
						m.target = p;
						break pl;
					}
				}
				
				if (m.target != null) {
					double dx = Math.abs(m.target.memberVO.getPosX()-m.posx);
					double dy = Math.abs(m.target.memberVO.getPosY()-m.posy);
					if (dx < 1.4 && dy < 1.4) {
						m.dtick += delta;
						if (m.dtick >= 3f) {
							m.dtick = 0f;
							m.dodeal = true;
						}
					}
					float speed = delta/1.4f;
					m.posx += Math.signum(m.target.memberVO.getPosX()-m.posx) * speed;
					m.posy += Math.signum(m.target.memberVO.getPosY()-m.posy) * speed;
				}
			}
			if (canSpawn(Guard.class, 5))
				c += ((float)(System.nanoTime() - last_time))/200000f;
			if (canSpawn(IronGuard.class, 5))
				c2 += ((float)(System.nanoTime() - last_time))/200000f;
			if (canSpawn(Ghost.class, 4))
				c3 += ((float)(System.nanoTime() - last_time))/200000f;
			if (canSpawn(WaterSpirit.class, 6))
				c4 += ((float)(System.nanoTime() - last_time))/200000f;
			if (canSpawn(IronFox.class, 9))
				c5 += ((float)(System.nanoTime() - last_time))/200000f;
			if (canSpawn(IronHorse.class, 8))
				c6 += ((float)(System.nanoTime() - last_time))/200000f;
			if (canSpawn(Olaf.class, 1))
				c7 += ((float)(System.nanoTime() - last_time))/200000f;
		    //System.out.println(c);
		    if (c >= 7500) {
		    	spawn();
		    	c = 0;
		 
		    }
		    if (c2 >= 80000) {
		    	spawnIronGuard();
		    	c2 = 0;
		    }
		    if (c3 >= 7500) {
		    	spawnGhost();
		    	c3 = 0;
		 
		    }
		    if (c4 >= 7000) {
		    	spawnWaterSpirit();
		    	c4 = 0;
		    }
		    if (c5 >= 7000) {
		    	spawnIronFox();
		    	c5 = 0;
		    }
		    if (c6 >= 7500) {
		    	spawnIronHorse();
		    	c6 = 0;
		    }
		    if (c7 >= 300000) {
		    	spawnOlaf();
		    	c7 = 0;
		    }
			} catch (Exception e) {}
		}
	}
	public static void refresh() {
		// gave up fu1cking dick problem
		Random ran = new Random();
		ArrayList<Monster> removePool = new ArrayList<Monster>();
		try {
			for (int i = 0; i < monsters.size(); i++) {
				Monster m = monsters.get(i);
				if (m == null || m.target == null) continue;
				if (m.dodeal && m.target != null && m.target.memberVO != null && m.target.memberVO.getHp() > 0) {
					m.target.memberVO.setHp(m.target.memberVO.getHp()-m.damage);
					if (m.target.memberVO.getHp() <= 0) {
						m.hp = m.maxhp;
						m.target.die();
					}
					m.dodeal = false;
				}
				if (m.hp <= 0) {
					Player p = m.target;
					for (ItemElement dropE : monsters.get(i).dropElements) {
						if (ran.nextFloat() <= dropE.dropPer && p != null) {
							p.memberVO.addInv(dropE.dropItem);
							break;
						}
					}
					if (p != null) {
						p.memberVO.setExp(p.memberVO.getExp() + (int)(m.exp * p.expbuff));
						p.memberVO.setCoin(p.memberVO.getCoin() + (int)(m.coin * p.expbuff));
					}
					removePool.add(monsters.get(i));
				}
			}
			
		} catch (Exception e) {e.printStackTrace();}
		monsters.removeAll(removePool);
		return;
	}
	void spawnIronGuard() {
		Random ran = new Random();
		IronGuard g = new IronGuard();
		g.posx = ran.nextFloat() * 14;
		g.posy = ran.nextFloat() * 14;
	}
	void spawnWaterSpirit() {
		Random ran = new Random();
		WaterSpirit g = new WaterSpirit();
		g.posx = 33 + ran.nextFloat() * 13;
		g.posy = 33 + ran.nextFloat() * 13;
	}
	void spawnOlaf() {
		Random ran = new Random();
		Olaf g = new Olaf();
		g.posx = 5 + ran.nextFloat() * 3;
		g.posy = 25 + ran.nextFloat() * 3;
	}
	void spawnIronHorse() {
		Random ran = new Random();
		IronHorse g = new IronHorse();
		g.posx = 23 + ran.nextFloat() * 16;
		g.posy = 68 + ran.nextFloat() * 16;
	}
	void spawnIronFox() {
		Random ran = new Random();
		IronFox g = new IronFox();
		g.posx = 23 + ran.nextFloat() * 16;
		g.posy = 48 + ran.nextFloat() * 16;
	}
	void spawnGhost() {
		Random ran = new Random();
		Ghost g = new Ghost();
		g.posx = 40 + ran.nextFloat() * 13;
		g.posy = ran.nextFloat() * 13;
	}
	void spawn() {
		Random ran = new Random();
		Guard g = new Guard();
		g.posx = ran.nextFloat() * 13;
		g.posy = ran.nextFloat() * 13;
	}
}
