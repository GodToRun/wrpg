package rpg;

import java.util.ArrayList;

import db.Player;

public abstract class Monster {
	public float posx, posy;
	public int hp = 5, damage = 1, exp = 1;
	public float dtick = 0f;
	public int coin = 1;
	public int maxhp;
	public int w = 45, h = 45;
	public boolean dodeal = false;
	public Player target;
	public ArrayList<ItemElement> dropElements = new ArrayList<ItemElement>();
	public String imageURL;
	public Monster() {
		MonsterGenerator.needUpdate = true;
		MonsterGenerator.monsters.add(this);
	}
}
