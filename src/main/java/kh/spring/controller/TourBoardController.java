package kh.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.spring.dao.TourBoardDAO;
import kh.spring.dao.TourReplyDAO;
import kh.spring.dto.TourBoardDTO;
import kh.spring.dto.TourReplyDTO;
import kh.spring.dto.TourReplyReplyDTO;
import kh.spring.service.TourBoardService;
import kh.spring.service.TourReplyService;
import kh.spring.statics.Statics;

@Controller
@RequestMapping("/tourboard/")
public class TourBoardController {
	
	@Autowired
	private TourBoardDAO bdao;
	
	@Autowired
	private TourReplyDAO rdao;
	
	@Autowired
	public TourBoardService bservice;
	
	@Autowired
	public TourReplyService rservice;
	
	@RequestMapping("list")
	public String list(Model model, HttpServletRequest request) throws Exception{
		
		String cpage = request.getParameter("cpage");
		if(cpage == null) {cpage = "1";}
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageTotalCount = bservice.getPageTotalCount();
		
		if(currentPage < 1) {
			currentPage = 1;
		}
		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		
		int start =  currentPage*Statics.RECORD_COUNT_PER_PAGE-(Statics.RECORD_COUNT_PER_PAGE-1);
		int end = currentPage*Statics.RECORD_COUNT_PER_PAGE;
		
		String navi = bservice.getPageNavi(currentPage);
		
		List<TourBoardDTO> list = bservice.selectAll(start, end);
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		
		return "tourboard/list";
	}
	
	@RequestMapping("write")
	public String write() {
		
		return "tourboard/write";
	}
	
	@RequestMapping("writeProc")
	public String writeProc(TourBoardDTO bdto, MultipartFile[] file) {
		
//		String writer = (String) session.getAttribute("loginID");
//		dto.setWriter(writer);	

//		String realPath = session.getServletContext().getRealPath("upload");	

//		tourb_seq.nextval, 1,	#{title}, #{contents}, 'trip', default, default, default, default
//		System.out.println("explanation : " + explanation);
//		String contents = explanation;
		
		bservice.writeProc(bdto);
		
		return "redirect:/tourboard/list?cpage=1";
	}
	
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        
		String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 
		
		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	@RequestMapping("detail")
	public String detail(int seq, Model model) {
        TourBoardDTO dto = bservice.selectBySeq(seq);
        
//        System.out.println("번호 : " +seq);
        
        bservice.addViewCount(seq);
        
        int replyCount = bservice.replyCount(seq);
//        System.out.println("replyCount : " + replyCount);
        int replyReplyCount = bservice.replyReplyCount(seq);
//        System.out.println("replyReplyCount : " + replyReplyCount);
        
        dto.setRep_count(replyCount+replyReplyCount);
        
        List<TourReplyDTO> rp_list = rservice.selectAll(seq);
        
        List<TourReplyReplyDTO> re_list = rservice.selectReAll();
        
//        for(int i=0; i<re_list.size(); i++) {
//        	System.out.println(re_list.get(i).getSeq() + " : " + re_list.get(i).getPar_seq() + " : " + re_list.get(i).getContents());
//        }
        
//		int parentSeq = bdto.getSeq();        
//		List<FilesDTO> files = fservice.selectByParentSeq(parentSeq);

        
        model.addAttribute("dto", dto);
        model.addAttribute("rp_list", rp_list); 
        model.addAttribute("re_list", re_list);
//        model.addAttribute("files", files);
        return "tourboard/detail";
    }

	@RequestMapping("modify")
	public String modify(int seq, String title, String category, String explanation) throws Exception{

		String contents = explanation;
		int result = bservice.modify(seq, title, contents, category);
		return "redirect:/tourboard/detail?seq="+seq;
	}

	@RequestMapping("delete")
	public String delete(int seq) throws Exception{

		int result = bservice.delete(seq);
		return "redirect:/tourboard/list?cpage=1";
	}
	
	
}
