package kr.co.ictedu.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.mvc.dto.MemberDTO;
import kr.co.ictedu.mvc.dto.LoginLoggerVO;

@Repository
public class MemberDao implements MemberDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addMember(MemberDTO vo) {
		ss.insert("member.add", vo);
	}

	@Override
	public List<MemberDTO> listMember() {
		return ss.selectList("member.list");
	}

	@Override
	public MemberDTO myPage(int num) {
		return ss.selectOne("member.detail", num);
	}

	@Override
	public boolean chkPwd(MemberDTO vo) {
		int num1 = ss.selectOne("member.chkPwd", vo);
		System.out.println("num1:" + num1);
		if (num1 > 0) {
			return true;
		}
		return false;
	}

	@Override
	public void deleteMember(int num) {
		ss.delete("member.del", num);
	}

	@Override
	public void mypageupdate(MemberDTO vo) {
		ss.update("member.upd", vo);
	}

	@Override
	public int chkId(String id) {
		return ss.selectOne("member.chkId", id);
	}

	@Override
	public MemberDTO loginCheck(MemberDTO vo) {
		return ss.selectOne("member.mypage", vo);
	}

	@Override
	public void addLoginLogging(LoginLoggerVO vo) {
		System.out.println(vo.getIdn());
		ss.insert("member.logger_in", vo);

	}

	@Override
	public List<LoginLoggerVO> myloglist(String idn) {
		return ss.selectList("member.mylogger_list", idn);
	}

	@Override
	public MemberDTO getMemberDetail(String id) {
		return ss.selectOne("member.memberDetail", id);
	}

}
