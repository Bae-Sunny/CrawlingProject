package kr.co.ictedu.mvc.dto;

public class BoardVO {
	private int num; // ��ȣ
	private String favteam; // ������
	private String title; // ����
	private String content; // ����
	private String writer; // �ۼ���
	private int hit; // ��ȸ��
	private String rdate; // �ۼ�����
	private int cnt; // ���
	
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
