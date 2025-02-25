package kr.co.ictedu.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.ictedu.mvc.dto.BoardCommVO;
import kr.co.ictedu.mvc.dto.BoardVO;

public interface BoardDaoInter {
	public void addBoard(BoardVO vo); // 글쓰기

	// 리스트 목록 조회
	public List<BoardVO> boardList(Map<String, String> map);

	// 댓글수
	public int getTotal(Map<String, String> paramMap);

//	public List<BoardVO> listBoard(); // 목록

	public void updateHit(int num); // 조회수 hit

	public BoardVO detailBoard(int num); // 상세보기

	public void deleteBoard(int num); // 삭제

	public void updateBoard(BoardVO vo); // 수정

	// 댓글
	public void addBoardComm(BoardCommVO vo);

	public List<BoardCommVO> listCommBoard(int num);

	public int getCommTotal(int num);

}
