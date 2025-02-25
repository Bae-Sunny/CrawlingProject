package kr.co.ictedu.mvc.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ictedu.mvc.dto.BoardCommVO;
import kr.co.ictedu.mvc.dto.BoardVO;

@Repository
@RequestMapping("board")
public class BoardDao implements BoardDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addBoard(BoardVO vo) {
		ss.insert("board.addBoard", vo);
	}

	@Override
	public List<BoardVO> boardList(Map<String, String> map) {
		return ss.selectList("board.listboard", map);
	}
	/*
	 * @Override public List<BoardVO> listBoard() { return
	 * ss.selectList("board.listBoard"); }
	 */

	@Override
	public int getTotal(Map<String, String> paramMap) {
		return ss.selectOne("board.totalCount", paramMap);
	}

	@Override
	public void updateHit(int num) {
		ss.update("board.hit", num);

	}

	@Override
	public BoardVO detailBoard(int num) {
		return ss.selectOne("board.detail", num);
	}

	@Override
	public void deleteBoard(int num) {
		ss.delete("board.del", num);

	}

	@Override
	public void updateBoard(BoardVO vo) {
		ss.update("board.up", vo);

	}

	@Override
	public void addBoardComm(BoardCommVO vo) {
		ss.insert("board.addComm", vo);

	}

	@Override
	public List<BoardCommVO> listCommBoard(int num) {
		return ss.selectList("board.listComm", num);
	}

	@Override
	public int getCommTotal(int num) {
		return ss.selectOne("board.commCount", num);
	}

}
