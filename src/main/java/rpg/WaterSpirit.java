package rpg;

public class WaterSpirit extends Monster {
	public WaterSpirit() {
		super();
		hp = 230;
		damage = 7;
		exp = 8;
		coin = 7;
		maxhp = hp;
		dropElements.add(new ItemElement(0.0008f, "@00000"));
		dropElements.add(new ItemElement(0.0008f, "#00000"));
		imageURL = "https://i.imgur.com/UL2EEFd.png";
	}
}
