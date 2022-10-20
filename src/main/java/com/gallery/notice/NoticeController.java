package com.gallery.notice;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	@Inject
	private CommentService commentService;

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(NoticeVO vo, Model model) throws Exception {

	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(NoticeVO vo, MultipartHttpServletRequest mpRequest, RedirectAttributes rttr)
			throws Exception {

		service.write(vo, mpRequest);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);

		return "notice/list";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(NoticeVO vo, Model model) throws Exception {

		model.addAttribute("NoticeVO", service.read(vo.getnId()));
		List<CommentVO> commentList = commentService.list(vo.getnId());
		model.addAttribute("commentList", commentList);

		List<Map<String, Object>> fileList = service.selectFileList(vo.getnId());
		model.addAttribute("file", fileList);

		return "notice/read";
	}

	@RequestMapping(value = "/commentWrite", method = RequestMethod.POST)
	public String commentWrite(CommentVO cvo, CommentCriteria ccri, RedirectAttributes rttr) throws Exception {
		commentService.create(cvo);

		rttr.addAttribute("nId", cvo.getnId());
		rttr.addAttribute("page", ccri.getPage());
		rttr.addAttribute("perPageNum", ccri.getPerPageNum());

		return "redirect:/notice/read";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("nId") int nId, RedirectAttributes rttr) throws Exception {

		service.delete(nId);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void modifyGET(int nId, Model model) throws Exception {
		model.addAttribute("NoticeVO", service.read(nId));

		List<Map<String, Object>> fileList = service.selectFileList(nId);
		System.out.println("fileList Info + " + fileList);
		model.addAttribute("file", fileList);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modifyPOST(NoticeVO vo, RedirectAttributes rttr, @RequestParam(value = "fileNoDel[]") String[] files,
			@RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {

		service.update(vo, files, fileNames, mpRequest);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/notice/read?nId=" + vo.getnId();
	}

	@RequestMapping(value = "/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");

		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils
				.readFileToByteArray(new File("C:\\Notice\\file\\" + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/commentUpdate", method = RequestMethod.GET)
	public String commentUpdateGET(CommentVO cvo, Model model) throws Exception {
		model.addAttribute("commentUpdate", commentService.selectComment(cvo.getcId()));
		return "notice/commentUpdate";
	}

	// 댓글 수정 POST
	@RequestMapping(value = "/commentUpdate", method = RequestMethod.POST)
	public String commentUpdatePOST(CommentVO cvo, Model model) throws Exception {
		
		commentService.update(cvo);
		return "redirect:/notice/read?nId=" + cvo.getnId();
	}

	// 댓글 삭제 GET
	@RequestMapping(value = "/commentDelete", method = RequestMethod.GET)
	public String commentDeleteGET(CommentVO cvo, Model model) throws Exception {

		model.addAttribute("commentDelete", commentService.selectComment(cvo.getcId()));
		return "notice/commentDelete";
	}

	// 댓글 수정 POST
	@RequestMapping(value = "/commentDelete", method = RequestMethod.POST)
	public String commentDeletePOST(CommentVO cvo, Model model) throws Exception {
		
		commentService.delete(cvo);

		return "redirect:/notice/read?nId=" + cvo.getnId();
	}
}
