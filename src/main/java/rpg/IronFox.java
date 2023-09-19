package rpg;

public class IronFox extends Monster {
	public IronFox() {
		super();
		hp = 680;
		damage = 9;
		exp = 13;
		maxhp = hp;
		coin = 13;
		dropElements.add(new ItemElement(0.0005f, "$00000"));
		dropElements.add(new ItemElement(0.0005f, "%00000"));
		imageURL = "https://i.imgur.com/fn0jAsm.png";
	}
}
