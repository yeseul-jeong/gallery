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

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(NoticeVO vo, Model model) throws Exception {

		logger.info("write get ...........");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(NoticeVO vo, MultipartHttpServletRequest communityRequest,
			RedirectAttributes rttr) throws Exception {

		logger.info("write post ...........");
		logger.info(vo.toString());

		service.write(vo, communityRequest);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		logger.info("show all list......................");

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("nId") int nId, Model model) throws Exception {

		model.addAttribute("NoticeVO", service.read(nId));

		List<Map<String, Object>> fileList = service.selectFileList(nId);
		model.addAttribute("file", fileList);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("nId") int nId, RedirectAttributes rttr) throws Exception {

		service.delete(nId);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/community/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void modifyGET(int nId, Model model) throws Exception {

		model.addAttribute("NoticeVO", service.read(nId));

		List<Map<String, Object>> fileList = service.selectFileList(nId);
		model.addAttribute("file", fileList);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modifyPOST(NoticeVO vo, RedirectAttributes rttr,
			@RequestParam(value = "fileNoDel[]") String[] files,
			@RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest)
			throws Exception {

		logger.info("mod post............");

		service.update(vo, files, fileNames, mpRequest);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/community/list";
	}

	@RequestMapping(value = "/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception {
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");

		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils
				.readFileToByteArray(new File("C:\\Community\\file\\" + storedFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}

	@RequestMapping(value = "/adminBoard", method = RequestMethod.GET)
	public void adminlist(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		logger.info("show all list......................");

		model.addAttribute("adminList", service.adminList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.adminListCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}
	
}
