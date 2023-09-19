package rpg;

public class IronHorse extends Monster {
	public IronHorse() {
		super();
		hp = 1205;
		damage = 15;
		exp = 19;
		w = 110;
		h = 76;
		maxhp = hp;
		coin = 22;
		dropElements.add(new ItemElement(0.00015f, "^00000"));
		dropElements.add(new ItemElement(0.00015f, "*00000"));
		imageURL = "https://i.imgur.com/wpcQx70.png";
	}
}
