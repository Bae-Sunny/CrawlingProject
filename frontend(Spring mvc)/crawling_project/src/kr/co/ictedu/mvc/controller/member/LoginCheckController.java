package kr.co.ictedu.mvc.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.ictedu.mvc.dao.MemberDaoInter;
import kr.co.ictedu.mvc.dto.MemberDTO;

@Controller
public class LoginCheckController {
	@Autowired
	MemberDaoInter memberDaoInter;

	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/login";
	}

	@PostMapping("/loginProcess")
	public ModelAndView loginfProcess(HttpSession session, HttpServletRequest request, MemberDTO vo,
			@RequestHeader("User-Agent") String userAgent) {
		System.out.println("=============in  loginf  Process");
		ModelAndView mav = new ModelAndView("redirect:/main");
		System.out.println("id : " + vo.getId());
		System.out.println("pwd : " + vo.getPwd());
		System.out.println("userAgent : " + userAgent);

		MemberDTO dto = memberDaoInter.loginCheck(vo);
		if (dto == null) {
			mav.setViewName("error/paramException");
			mav.addObject("emsg", "로그인 실패 입니다.");
		} else { // 로그인 인증!
			session.setAttribute("sessionName", dto.getName());
			session.setAttribute("sessionID", dto.getId());
			System.out.println("로그인 실행! 및 세션 저장 => Proceeding Call");
		}
		return mav;
	}

	// logout 세션을 삭제
	@GetMapping("/logout")
	public ModelAndView loginfoutProcess(HttpSession session, HttpServletRequest request) {
		System.out.println("=============in  loginf outProcess");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("sessionName");
		session.removeAttribute("sessionID");
		mav.setViewName("redirect:/main");
		System.out.println("로그아웃 실행! 및 세션삭제 => Proceeding Call");

		return mav;
	}

	@GetMapping("/mypage")
	public String showMyPage(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionID");
		if (userId == null) {
			return "redirect:/loginForm";
		}
		MemberDTO dto = memberDaoInter.getMemberDetail(userId);
		model.addAttribute("dto", dto);
		return "member/mypage";
	}

	@GetMapping("/mypageUpdate")
	public String myPageUpdate(HttpSession session, Model model, @RequestParam("num") int num) {
		String userId = (String) session.getAttribute("sessionID");
		if (userId == null) {
			return "redirect:/loginForm";
		}
		MemberDTO dto = memberDaoInter.getMemberDetail(userId);
		model.addAttribute("dto", dto);
		return "member/mypageupdate";
	}

	@PostMapping("/updateProcess")
	public ModelAndView updateMember(MemberDTO dto) {
		memberDaoInter.mypageupdate(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mypage"); // 업데이트 후 사용자의 마이페이지로 리디렉션
		return mav;
	}

}