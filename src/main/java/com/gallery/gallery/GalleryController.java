package com.gallery.gallery;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/gallery")
public class GalleryController {

	private static final Logger logger = LoggerFactory.getLogger(GalleryController.class);

	@Inject
	private GalleryService galleryService;
	

	/*
	 * @Inject private CommentMapper commentMapper;
	 */

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void galleryListPage(@ModelAttribute("cri") GalleryCriteria cri, Model model) throws Exception {
		logger.info("/gallery/list");
		logger.info(cri.toString());

		model.addAttribute("galleryList", galleryService.selectListWithPaging(cri));
		GalleryPageMaker pageMaker = new GalleryPageMaker();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(131);

		pageMaker.setTotalCount(galleryService.listCountCriteria(cri));

		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/listType")
	public void galleryListType(Model model, @RequestParam(value = "aId") int aId) throws Exception {
		logger.info("/gallery/listType" + aId);

		List<GalleryVO> galleryList = galleryService.selectByArtist(aId);

		//logger.info("// productList.toString()=" + productList.toString());
		model.addAttribute("galleryList", galleryList);
	}

	@RequestMapping(value = "/detail")
	public void galleryDetail(Model model, @RequestParam(value = "gId") int gId, HttpServletRequest request)
			throws Exception {
		logger.info("/gallery/detail ????????????: " + gId);

		GalleryVO galleryOne = galleryService.selectGalleryDetail(gId);

		//logger.info("// productOne.toString()=" + productOne.toString());
		model.addAttribute("galleryOne", galleryOne);

		/*
		 * HttpSession session = request.getSession(); session.removeAttribute("gId");
		 * session.setAttribute("gId", gId);
		 * System.out.println("productdetailCalled-castSession.attribute.mId:"+request.
		 * getSession().getAttribute("mId")); request.setAttribute("gId", gId);
		 * 
		 * List<CommentVO> commentList = commentService.readComment(gId);
		 * request.setAttribute("commentList", commentList);
		 */
		
		/*
		 * List<CommentVO> commentList =
		 * commentService.readComment(galleryOne.getgId());
		 * model.addAttribute("commentList", commentList);
		 */
	}
	

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(Model model, @RequestParam(value = "keyword") String keyword) throws Exception {
		logger.info("/gallery/search -> '" + keyword + "' ??????");

		List<GalleryVO> galleryList = galleryService.search(keyword);

		model.addAttribute("galleryList", galleryList);
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void registerGET(HttpServletRequest request, GalleryVO vo, Model model) throws Exception {
		logger.info("// /gallery/register get??????");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String registerPost(HttpServletRequest request, GalleryVO vo) throws Exception {
		logger.info("// /gallery/register post??????");

		galleryService.insert(vo);
		logger.info("// vo.toString()=" + vo.toString());

		request.setAttribute("msg", "?????? ????????????");
		request.setAttribute("url", "list");

		return "alert";

	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void updateGET(HttpServletRequest request, @RequestParam(value = "gId") int gId, Model model)
			throws Exception {
		logger.info("/gallery/update get ?????? gId=" + gId);

		GalleryVO galleryOne = galleryService.selectGalleryDetail(gId);
		model.addAttribute("galleryOne", galleryOne);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(HttpServletRequest request, GalleryVO vo, Model model) throws Exception {
		logger.info("/gallery/update post ??????");

		int gId = vo.getgId();

		galleryService.updateGallery(vo);

		GalleryVO galleryOne = galleryService.selectGalleryDetail(gId);
		logger.info("// galleryList.toString()=" + galleryOne.toString());

		request.setAttribute("msg", "?????? ???????????????.");
		request.setAttribute("url", "detail?gId=" + gId);

		return "alert";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, @RequestParam(value = "gId") int gId) throws Exception {
		logger.info("/gallery/delete gId=" + gId);

		request.setAttribute("msg", "?????? ???????????????.");
		request.setAttribute("url", "list");

		galleryService.delete(gId);

		return "alert";
	}

	/* ?????? ?????? ????????? */
	@RequestMapping(value = "/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(@RequestPart(value = "file") MultipartFile[] uploadFile) {

		logger.info("uploadAjaxActionPOST..........");
		
		/* ????????? ?????? ?????? */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
				
			}
		}
		
		String uploadFolder = "C:\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		/* ?????? ?????? */
		File uploadPath = new File(uploadFolder, datePath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* ????????? ?????? ?????? ?????? */
		List<AttachImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachImageVO vo = new AttachImageVO();
			
			/* ?????? ?????? */
			String uploadFileName = multipartFile.getOriginalFilename();	
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid ?????? ?????? ?????? */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* ?????? ??????, ?????? ????????? ?????? File ?????? */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* ?????? ?????? */
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		return result;
	}
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(String fileName){
		
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/* ????????? ?????? ?????? */
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* ????????? ?????? ?????? */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* ?????? ?????? ?????? */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
		
	}
}
