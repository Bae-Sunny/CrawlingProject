package kr.co.ictedu.mvc.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ictedu.mvc.dao.BoardDaoInter;
import kr.co.ictedu.mvc.dto.BoardCommVO;
import kr.co.ictedu.mvc.dto.BoardVO;
import kr.co.ictedu.mvc.dto.PageVO;

@Controller
public class BoardController {
	@Autowired
	private BoardDaoInter boardDaoInter;

	@Autowired
	private PageVO pageVO;

	@GetMapping("/boardwrite")
	public String boardForm() {
		return "board/boardwrite";
	}

	@PostMapping("/addboard")
	public String addBoard(BoardVO vo) {
		boardDaoInter.addBoard(vo);
		return "redirect:boardlist";
	}

	@RequestMapping("/boardlist")
	public String listBoard(Model m, @RequestParam Map<String, String> paramMap) {
		System.out.println("파라미터 출력:");
		System.out.println("검색 시, 링크 시 넘어오는 파라미터 출력");
		String cPage = paramMap.get("cPage");
		System.out.println("cPage:" + cPage);
		System.out.println("searchType:" + paramMap.get("serachType"));
		System.out.println("searchValue:" + paramMap.get("serachValue"));
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

		// 1. totalRecord
		// pageVO : 전체 데이터의 수를 저장하시오.
		pageVO.setTotalRecord(boardDaoInter.getTotal(paramMap));
		int totalRecord = pageVO.getTotalRecord();
		System.out.println("1. TotalRecord : " + totalRecord);

		// 2. totalPage
		// totalRecord/numPerPage
		System.out.println("numperpage" + pageVO.getNumPerPage());
		System.out.println("2. TotalPage 검수1: " + (totalRecord / pageVO.getNumPerPage()));
		System.out.println("2. TotalPage 검수2: " + (totalRecord / (double) pageVO.getNumPerPage()));
		int totalPage = (int) Math.ceil(totalRecord / (double) pageVO.getNumPerPage());
		System.out.println("2. TotalPage 검수3: " + totalPage);
		// pageVO의 Total페이지에 저장하기
		pageVO.setTotalPage(totalPage);
		System.out.println("2. 최종 검수 totalPage: " + pageVO.getTotalPage());
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

		// 3. totalBlock
		// 전체 블록 구하기 => 전체 페이지(totalPage)/보여줄 블록 수(pagePerBlock)
		// totalBlock = 6/5;
		int totalBlock = (int) Math.ceil((double) totalPage / pageVO.getPagePerBlock());
		System.out.println("3. TotalBlock 검수1: " + totalBlock);
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

		// 현재 페이지를 요청할 때 파라미터로 현재 페이지 값을 받는다. 1 ~~~~~~ n
		if (cPage != null) {
			pageVO.setNowPage(Integer.parseInt(cPage));
		} else {
			pageVO.setNowPage(1); // cPage가 없으면 1페이지
		}
		System.out.println("4. nowPage : " + pageVO.getNowPage());
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

		// beginPerPage = endPerPage 값 구하기
//		beginPerPage = (nowPage - 1) * numPerPage + 1;
//		endPerPage = (beginPerPage - 1) + numPerPage;
//		System.out.println("5. beginPerPage = "+beginPerPage);
//		System.out.println("5. endPerPage = "+endPerPage);
		pageVO.setBeginPerPage((pageVO.getNowPage() - 1) * pageVO.getNumPerPage() + 1);
		pageVO.setEndPerPage((pageVO.getBeginPerPage() - 1) + pageVO.getNumPerPage());
		System.out.println("5. beginPerPage = " + pageVO.getBeginPerPage());
		System.out.println("5. endPerPage = " + pageVO.getEndPerPage());
		System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");

		// 게시판 목록 조회
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(pageVO.getBeginPerPage()));
		map.put("end", String.valueOf(pageVO.getEndPerPage()));

		// 기존 map에 paramMap과 함치기
		map.putAll(paramMap);
		System.out.println("================Map All================");
		for (Map.Entry<String, String> e : map.entrySet()) {
			System.out.println(e.getKey() + "," + e.getValue());
		}
		
		// 데이터베이스에서 게시물 목록 조회
		List<BoardVO> list = boardDaoInter.boardList(map);

		// 시작 값, 종료 값
		// int startPage = (int)((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		int startPage = (int) ((pageVO.getNowPage() - 1) / pageVO.getPagePerBlock()) * pageVO.getPagePerBlock() + 1;
		int endPage = startPage + pageVO.getPagePerBlock() - 1;
		if (endPage > pageVO.getTotalPage()) {
			endPage = pageVO.getTotalPage();
		}
		System.out.println("6. startPage = " + startPage);
		System.out.println("6. endPage = " + endPage);
		System.out.println("6. searchType = " + map.get("searchType"));
		System.out.println("6. searchValue = " + map.get("searchValue"));

		// 검색값을 view로 전달
		m.addAttribute("searchType", map.get("searchType"));
		m.addAttribute("searchValue", map.get("searchValue"));
		m.addAttribute("startPage", startPage); // 블록에 시작 페이지 값
		m.addAttribute("endPage", endPage); // 블록에 끝 페이지 값
		m.addAttribute("page", pageVO); // nowPage, pagePerBlock, totalPage
		m.addAttribute("list", list);
		return "board/boardlist";
	}

	@GetMapping("/boarddetail")
	public String boardDetail(Model model, @RequestParam(required = true) int num,
			@RequestParam(defaultValue = "detail") String type, @RequestParam Map<String, String> paramMap) {
		if (!type.equals("comm")) {
			boardDaoInter.updateHit(num);
		}

		BoardVO vo = boardDaoInter.detailBoard(num);
		model.addAttribute("vo", vo);
		// 댓글 값을 뷰로 전달하기
		List<BoardCommVO> listcomm = boardDaoInter.listCommBoard(num);
		model.addAttribute("listcomm", listcomm);
		return "board/boarddetail";
	}

	// 댓글 입력처리
	// form의 action, method를 확인해서 작성 *
	@PostMapping("/bcominsert")
	public String bcominsert(BoardCommVO cvo, Model model) {
		boardDaoInter.addBoardComm(cvo);
		return "redirect:boarddetail?num=" + cvo.getUcode() + "&type=comm#comm";
	}

	@GetMapping("/boarddelete")
	public String boardDelete(int num) {
		boardDaoInter.deleteBoard(num);
		return "redirect:boardlist";
	}

	@GetMapping("/boardupdate")
	public String boardUpdate(Model m, int num) {
		BoardVO vo = boardDaoInter.detailBoard(num);
		m.addAttribute("vo", vo);
		return "board/boardupdate";
	}

	@PostMapping("/boardUp")
	public String boardUpdate(BoardVO vo) { // 업데이트
		boardDaoInter.updateBoard(vo);
		return "redirect:boardlist";
	}
}
