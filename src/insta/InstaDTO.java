package insta;

public class InstaDTO {
	private int pagesum;
	private String id;
	private String pageid;
	private String title;
	private int hits;
	private String post;
	
	
	public String getPageid() {
		return pageid;
	}
	public void setPageid(String pageid) {
		this.pageid = pageid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public int getPagesum() {
		return pagesum;
	}
	public void setPagesum(int pagesum) {
		this.pagesum = pagesum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "InstaDTO [pagesum=" + pagesum + ", id=" + id + ", pageid=" + pageid + ", title=" + title + ", hits="
				+ hits + ", post=" + post + "]";
	}
	
	
}
