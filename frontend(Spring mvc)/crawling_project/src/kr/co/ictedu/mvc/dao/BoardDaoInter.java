package kr.co.ictedu.mvc.dao;

import java.util.List;
import java.util.Map;

import kr.co.ictedu.mvc.dto.BoardCommVO;
import kr.co.ictedu.mvc.dto.BoardVO;

public interface BoardDaoInter {
	public void addBoard(BoardVO vo); // �۾���

	// ����Ʈ ��� ��ȸ
	public List<BoardVO> boardList(Map<String, String> map);

	// ��ۼ�
	public int getTotal(Map<String, String> paramMap);

//	public List<BoardVO> listBoard(); // ���

	public void updateHit(int num); // ��ȸ�� hit

	public BoardVO detailBoard(int num); // �󼼺���

	public void deleteBoard(int num); // ����

	public void updateBoard(BoardVO vo); // ����

	// ���
	public void addBoardComm(BoardCommVO vo);

	public List<BoardCommVO> listCommBoard(int num);

	public int getCommTotal(int num);

}
