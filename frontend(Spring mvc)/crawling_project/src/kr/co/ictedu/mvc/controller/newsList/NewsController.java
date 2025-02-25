package kr.co.ictedu.mvc.controller.newsList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.ictedu.mvc.dao.NewsDaoInter;
import kr.co.ictedu.mvc.dto.NewsVO;

@Controller
public class NewsController {

	@Autowired
	NewsDaoInter dao;

	@GetMapping("/newschart")
	public String newsVisual() {
		return ("news/newsVisual");
	}

	@GetMapping("/newsList")
	public String newspage() {
		return ("news/newsList");
	}

	@GetMapping("/newsDetail")
	public String newsDetail(Model m, int num) {
		NewsVO vo = dao.detail(num);
		m.addAttribute("vo", vo);
		return ("news/newsDetail");
	}

}
