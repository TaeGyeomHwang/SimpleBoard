package mvc.model;

public class CommentDTO {
	private int cnum;
	private int bnum;
	private String id;
	private String name;
	private String content;

	public CommentDTO() {
		super();
	}

	public int getCNum() {
		return cnum;
	}

	public void setCNum(int cnum) {
		this.cnum = cnum;
	}

	public int getBNum() {
		return bnum;
	}

	public void setBNum(int bnum) {
		this.bnum = bnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
