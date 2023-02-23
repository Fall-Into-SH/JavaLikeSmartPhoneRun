package Bank;

public class BankDTO {
	private String account;
	private int balance;
	private String mId;
	private int count;
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "BankDTO [account=" + account + ", balance=" + balance + ", mId=" + mId + ", count=" + count + "]";
	}
	
	
}
