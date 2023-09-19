package db;

public class Vector2 {
	private float x, y;
	public float getX() {
		return x;
	}
	public void setX(float x) {
		this.x = x;
	}
	public float getY() {
		return y;
	}
	public void setY(float y) {
		this.y = y;
	}
	public Vector2(float x, float y) {
		this.x = x;
		this.y = y;
	}
	public Vector2 add(Vector2 vec) {
		return new Vector2(x + vec.x, y + vec.y);
	}
	public Vector2 sub(Vector2 vec) {
		return new Vector2(x - vec.x, y - vec.y);
	}
	public Vector2 normalized() {
		float len = (float)Math.sqrt(x*x + y*y);
		Vector2 vec = new Vector2(x / len, y / len);
		return vec;
	}
	public Vector2 mul(float amount) {
		return new Vector2(x * amount, y * amount);
	}
	public Vector2 div(float amount) {
		return new Vector2(x / amount, y / amount);
	}
}
