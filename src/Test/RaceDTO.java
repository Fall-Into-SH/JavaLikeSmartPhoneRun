package Test;

public class RaceDTO {
	private int Player;
	private int Win;
	public int getPlayer() {
		return Player;
	}
	public void setPlayer(int player) {
		Player = player;
	}
	public int getWin() {
		return Win;
	}
	public void setWin(int win) {
		Win = win;
	}
	@Override
	public String toString() {
		return "RaceDTO [Player=" + Player + ", Win=" + Win + "]";
	}
	
	
}
