package eta;

public class ScdDTO {
	public String mId;
	public String dotw;
	public String period;
	public String subject;
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getDotw() {
		return dotw;
	}
	public void setDotw(String dotw) {
		this.dotw = dotw;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "ScdDTO [mId=" + mId + ", dotw=" + dotw + ", period=" + period + ", subject=" + subject + "]";
	}

}
