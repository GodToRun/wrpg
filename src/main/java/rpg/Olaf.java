package rpg;

import java.util.Random;

public class Olaf extends Monster {
	public Olaf() {
		super();
		hp = 28000;
		damage = 30;
		exp = 100;
		maxhp = hp;
		coin = 550;
		w = 130;
		h = 200;
		int am = new Random().nextInt(12);
		dropElements.add(new ItemElement(0.2f, "&H9H9" + am));
		imageURL = "https://i.imgur.com/55P2zrN.png";
	}
}
