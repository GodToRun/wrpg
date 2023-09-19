package rpg;

public class IronGuard extends Monster {
	public IronGuard() {
		super();
		dropElements.add(new ItemElement(0.2f, "000000"));
		dropElements.add(new ItemElement(0.2f, "100000"));
		hp = 80;
		damage = 4;
		exp = 8;
		imageURL = "https://i.imgur.com/wR1kG66.png";
		maxhp = hp;
	}
}
