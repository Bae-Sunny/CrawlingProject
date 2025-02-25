package kr.co.ictedu.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController {

	@GetMapping(value = { "/", "/main" })
	public String main() {

		return "main/index";
	}

	@GetMapping(value = { "/matches", "" })
	public String matches() {

		return "matchesboard/matches";
	}

	@GetMapping(value = { "/record", "" })
	public String record() {

		return "record/teamrecord";
	}

	@GetMapping(value = { "/stock", "" })
	public String stockinfo() {

		return "info/stock";
	}
		
	@GetMapping(value = { "/newsrank", "" })
	public String newsrank() {

		return "news/news";
	}
}