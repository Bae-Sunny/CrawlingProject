package kr.co.ictedu.mvc.dto;

import org.springframework.stereotype.Component;

//@Component Bean 일반적인 기능의 빈을 만들어 주는 어노테이션 *****
@Component
public class PageVO {
	// 페이징 처리를 위한 속성
	private int nowPage; // 현재 페이지 값 -> 메뉴페이지와 연동되는 변수
	private int nowBlock; // 현재 블럭 -> [][][][][] -> 1block
	private int totalRecord; // 총 게시물 수 .Dao로 부터 받음
	private int numPerPage; // 한 페이지당 보여질 게시물 수
	private int pagePerBlock; // 한 블럭당 보여질 페이지 수
	private int totalPage; // 전체 페이지 수 => totalRecord/numPerPage
	private int totalBlock; // 전체 블럭 수
	private int beginPerPage; // 각 페이지별 시작 게시물의 index값
	private int endPerPage; // 각 페이지별 마지막 게시물의 index값

	public PageVO() { // 기본 생성자에서 페이징 처리에 기본 값을 초기화
		this.nowPage = 1;
		this.nowBlock = 1;
		this.numPerPage = 10;
		this.pagePerBlock = 5;
		System.out.println("페이지 처리 객체가 생성되었습니다.");
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBeginPerPage() {
		return beginPerPage;
	}

	public void setBeginPerPage(int beginPerPage) {
		this.beginPerPage = beginPerPage;
	}

	public int getEndPerPage() {
		return endPerPage;
	}

	public void setEndPerPage(int endPerPage) {
		this.endPerPage = endPerPage;
	}

}
