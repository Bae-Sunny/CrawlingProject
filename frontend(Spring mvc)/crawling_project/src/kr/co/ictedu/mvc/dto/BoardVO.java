package kr.co.ictedu.mvc.dto;

public class BoardVO {
	private int num; // 번호
	private String favteam; // 응원팀
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private int hit; // 조회수
	private String rdate; // 작성일자
	private int cnt; // 댓글
	
	private int row_num;

	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getFavteam() {
		return favteam;
	}

	public void setFavteam(String favteam) {
		this.favteam = favteam;
	}
}
