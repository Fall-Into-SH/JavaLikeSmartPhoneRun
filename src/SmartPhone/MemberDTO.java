package SmartPhone;

public class MemberDTO {
	// SMARTPHONE DTO
	private String mId;
	private	String mPw ; 
	private String mName;
	private String mBirth;
	private String mAge;
	private String mPhone;
	private String Oname;	// 다른사람 이름
	private String Onumber;	// 다른사람 연락처
	
	public String getOname() {
		return Oname;
	}
	public void setOname(String oname) {
		Oname = oname;
	}
	public String getOnumber() {
		return Onumber;
	}
	public void setOnumber(String onumber) {
		Onumber = onumber;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmBirth() {
		return mBirth;
	}
	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}
	public String getmAge() {
		return mAge;
	}
	public void setmAge(String mAge) {
		this.mAge = mAge;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mBirth=" + mBirth + ", mAge=" + mAge
				+ ", mPhone=" + mPhone + ", Oname=" + Oname + ", Onumber=" + Onumber + "]";
	}

	// 생성자 : 생략(기본생성자 자동생성)
	
	// 메소드 : getter, satter, toString

	

}