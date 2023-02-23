package KGV;

public class KGVDTO {
	private String Id;
	private String Account;
	private String kSeat;	// 좌석(안씀)
	private String date;	// 예매시간
	private int mcode;
	private int lcode;
	private int people;
	private int Balance;
	public int getMcode() {
		return mcode;
	}
	public void setMcode(int mcode) {
		this.mcode = mcode;
	}
	public int getLcode() {
		return lcode;
	}
	public void setLcode(int lcode) {
		this.lcode = lcode;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getAccount() {
		return Account;
	}
	public void setAccount(String Account) {
		this.Account = Account;
	}
	public String getkSeat() {
		return kSeat;
	}
	public int getBalance() {
		return Balance;
	}
	public void setBalance(int balance) {
		Balance = balance;
	}
	
	public void setkSeat(String kSeat) {
		this.kSeat = kSeat;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "KGVDTO [Id=" + Id + ", Account=" + Account + ", kSeat=" + kSeat + ", date=" + date + ", mcode=" + mcode
				+ ", lcode=" + lcode + ", people=" + people + ", Balance=" + Balance + "]";
	}
	
}
