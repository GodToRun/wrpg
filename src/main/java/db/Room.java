package db;
import java.util.*;

import javax.websocket.Session;

public class Room {
	private String name;
	public Session session;
	public ArrayList<Player> players = new ArrayList<Player>();
	public Room(String name) {
		this.name = name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
}
