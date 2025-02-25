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
		System.out.println("�Ķ���� ���:");
		System.out.println("�˻� ��, ��ũ �� �Ѿ���� �Ķ���� ���");
		String cPage = paramMap.get("cPage");
		System.out.println("cPage:" + cPage);
		System.out.println("searchType:" + paramMap.get("serachType"));
		System.out.println("searchValue:" + paramMap.get("serachValue"));
		System.out.println("�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�");

		// 1. totalRecord
		// pageVO : ��ü �������� ���� �����Ͻÿ�.
		pageVO.setTotalRecord(boardDaoInter.getTotal(paramMap));
		int totalRecord = pageVO.getTotalRecord();
		System.out.println("1. TotalRecord : " + totalRecord);

		// 2. totalPage
		// totalRecord/numPerPage
		System.out.println("numperpage" + pageVO.getNumPerPage());
		System.out.println("2. TotalPage �˼�1: " + (totalRecord / pageVO.getNumPerPage()));
		System.out.println("2. TotalPage �˼�2: " + (totalRecord / (double) pageVO.getNumPerPage()));
		int totalPage = (int) Math.ceil(totalRecord / (double) pageVO.getNumPerPage());
		System.out.println("2. TotalPage �˼�3: " + totalPage);
		// pageVO�� Total�������� �����ϱ�
		pageVO.setTotalPage(totalPage);
		System.out.println("2. ���� �˼� totalPage: " + pageVO.getTotalPage());
		System.out.println("�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�");

		// 3. totalBlock
		// ��ü ��� ���ϱ� => ��ü ������(totalPage)/������ ��� ��(pagePerBlock)
		// totalBlock = 6/5;
		int totalBlock = (int) Math.ceil((double) totalPage / pageVO.getPagePerBlock());
		System.out.println("3. TotalBlock �˼�1: " + totalBlock);
		System.out.println("�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�");

		// ���� �������� ��û�� �� �Ķ���ͷ� ���� ������ ���� �޴´�. 1 ~~~~~~ n
		if (cPage != null) {
			pageVO.setNowPage(Integer.parseInt(cPage));
		} else {
			pageVO.setNowPage(1); // cPage�� ������ 1������
		}
		System.out.println("4. nowPage : " + pageVO.getNowPage());
		System.out.println("�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�");

		// beginPerPage = endPerPage �� ���ϱ�
//		beginPerPage = (nowPage - 1) * numPerPage + 1;
//		endPerPage = (beginPerPage - 1) + numPerPage;
//		System.out.println("5. beginPerPage = "+beginPerPage);
//		System.out.println("5. endPerPage = "+endPerPage);
		pageVO.setBeginPerPage((pageVO.getNowPage() - 1) * pageVO.getNumPerPage() + 1);
		pageVO.setEndPerPage((pageVO.getBeginPerPage() - 1) + pageVO.getNumPerPage());
		System.out.println("5. beginPerPage = " + pageVO.getBeginPerPage());
		System.out.println("5. endPerPage = " + pageVO.getEndPerPage());
		System.out.println("�ڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡڡ�");

		// �Խ��� ��� ��ȸ
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(pageVO.getBeginPerPage()));
		map.put("end", String.valueOf(pageVO.getEndPerPage()));

		// ���� map�� paramMap�� ��ġ��
		map.putAll(paramMap);
		System.out.println("================Map All================");
		for (Map.Entry<String, String> e : map.entrySet()) {
			System.out.println(e.getKey() + "," + e.getValue());
		}
		
		// �����ͺ��̽����� �Խù� ��� ��ȸ
		List<BoardVO> list = boardDaoInter.boardList(map);

		// ���� ��, ���� ��
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

		// �˻����� view�� ����
		m.addAttribute("searchType", map.get("searchType"));
		m.addAttribute("searchValue", map.get("searchValue"));
		m.addAttribute("startPage", startPage); // ��Ͽ� ���� ������ ��
		m.addAttribute("endPage", endPage); // ��Ͽ� �� ������ ��
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
		// ��� ���� ��� �����ϱ�
		List<BoardCommVO> listcomm = boardDaoInter.listCommBoard(num);
		model.addAttribute("listcomm", listcomm);
		return "board/boarddetail";
	}

	// ��� �Է�ó��
	// form�� action, method�� Ȯ���ؼ� �ۼ� *
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
	public String boardUpdate(BoardVO vo) { // ������Ʈ
		boardDaoInter.updateBoard(vo);
		return "redirect:boardlist";
	}
}
