package kr.co.ictedu.mvc.controller.member;
// ȸ������ó�� �� ȸ�� ������ ���� Ŭ������ �����Ѵ�.

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

// ��û�� �ߺ� �Ǹ� �ȵǱ� ������ ������ �� ��û���� �Ű� �´�

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ictedu.mvc.dao.MemberDaoInter;
import kr.co.ictedu.mvc.dto.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private MemberDaoInter dao;

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	@GetMapping("/signup")
	public String signup() {
		return "member/signup";

	}

	@PostMapping("/memberIn")
	public String memberIn(Model m, MemberDTO vo, HttpServletRequest request) {
		System.out.println("id :" + vo.getId());
		System.out.println("reip :" + request.getRemoteAddr()); // ȸ�� �߰�
		dao.addMember(vo);
		m.addAttribute("name", vo.getName());
		m.addAttribute("id", vo.getId()); // ���õ� üũ �׸� �α� ���
		if (vo.getChk() != null) {
			for (String e : vo.getChk()) {
				System.out.println(e);
			}
		} else {
			System.out.println("üũ�� �׸��� �����ϴ�.");
		} // ȸ�� ���� ��ü�� �𵨿� �߰�
		m.addAttribute("vo", vo);
		return "member/success";
	}

	@GetMapping("/memberlist")
	public String tboardList(Model m) {
		List<MemberDTO> list = dao.listMember();
		m.addAttribute("list", list);
		return "member/memberlist";
	}

	/*
	 * @PostMapping("/memberUpdate") public String tboardUpdate(MemberDTO vo) {
	 * dao.updateMember(vo); return ("redirect:memberlist");
	 * 
	 * }
	 */

	@GetMapping("/memberDelete")
	public String tboardDelete(int num) {
		dao.deleteMember(num);
		return ("redirect:memberlist");
	}

	@GetMapping("/chkPwd")
	public String chkPwd(MemberDTO vo) {
		dao.chkPwd(vo);
		return ("redirect:memberDatail");
	}

	@GetMapping("/idcheck")
	@ResponseBody
	public String chkId(@RequestParam(required = true) String id) {
		int res = dao.chkId(id);
		System.out.println("res:::" + res);
		return String.valueOf(res);
	}

}