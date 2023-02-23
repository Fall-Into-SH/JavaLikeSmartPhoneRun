package Badal;

public class BadalDTO {
	
	private int bcode;	// 분류코드
	private String name;	// 가게이름
	private int rcode;	// 가게 코드
	private String menu; // 메뉴
	private int price;	// 가격
	private String Account;
	private int Balance;
	public int getBalance() {
		return Balance;
	}
	public void setBalance(int balance) {
		Balance = balance;
	}
	public String getAccount() {
		return Account;
	}
	public void setAccount(String account) {
		Account = account;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRcode() {
		return rcode;
	}
	public void setRcode(int rcode) {
		this.rcode = rcode;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "BadalDTO [bcode=" + bcode + ", name=" + name + ", rcode=" + rcode + ", menu=" + menu + ", price="
				+ price + ", Account=" + Account + ", Balance=" + Balance + "]";
	}
	
	

}
