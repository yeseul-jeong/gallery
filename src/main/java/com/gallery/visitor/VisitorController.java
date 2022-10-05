package com.gallery.visitor;

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
@RequestMapping("/visitor")
public class VisitorController {

	private static final Logger logger = LoggerFactory.getLogger(VisitorController.class);

	@Inject
	private VisitorService service;

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(VisitorVO vo, Model model) throws Exception {

		logger.info("write get ...........");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(VisitorVO vo, MultipartHttpServletRequest mpRequest,
			RedirectAttributes rttr) throws Exception {

		logger.info("write post ...........");
		logger.info(vo.toString());

		service.write(vo, mpRequest);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/visitor/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("cri") Criteria cri) throws Exception {

		model.addAttribute("list", service.list(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);
		
		return "visitor/list";
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("vId") int vId, Model model) throws Exception {

		model.addAttribute("VisitorVO", service.read(vId));
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("vId") int vId, RedirectAttributes rttr) throws Exception {

		service.delete(vId);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/visitor/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void modifyGET(int vId, Model model) throws Exception {
		model.addAttribute("VisitorVO", service.read(vId));
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modifyPOST(VisitorVO vo, RedirectAttributes rttr, MultipartHttpServletRequest mpRequest)
			throws Exception {
		
		logger.info("mod post............");
		
		service.update(vo);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/visitor/list";
	}
}
