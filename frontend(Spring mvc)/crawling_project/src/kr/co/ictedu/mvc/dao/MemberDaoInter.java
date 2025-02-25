package kr.co.ictedu.mvc.dao;

import java.util.List;

import kr.co.ictedu.mvc.dto.MemberDTO;
import kr.co.ictedu.mvc.dto.LoginLoggerVO;

public interface MemberDaoInter {

	public void addMember(MemberDTO vo);
	public List<MemberDTO> listMember();	
	public MemberDTO myPage(int num);
	public int chkId(String id);
	public boolean chkPwd(MemberDTO vo);
	public void deleteMember(int num);
	public void mypageupdate(MemberDTO vo);
	public MemberDTO loginCheck(MemberDTO vo);
	public MemberDTO getMemberDetail(String id);
	
	public void addLoginLogging(LoginLoggerVO vo);
	public List<LoginLoggerVO> myloglist(String idn);	
}
