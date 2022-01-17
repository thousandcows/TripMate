package kh.spring.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.AreaListDTO;
import kh.spring.dto.AreaReplyDTO;
import kh.spring.dto.SavedDTO;
import kh.spring.service.AreaService;
import kh.spring.statics.Statics;


@Controller
@RequestMapping("/area/")
public class AreaController {

	@Autowired
	public AreaService aService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="main", method=RequestMethod.GET, params= {"page","area","contentType"})
	public String main(int page,int area,int contentType, Model model) throws Exception{
		List<AreaListDTO> list = aService.list(page,contentType,area);
		int[] count = aService.pageCount(page,contentType,area);
		List<Integer> pageView = aService.paging(count[0],count[1]);

		model.addAttribute("list",list);
		model.addAttribute("pageNo",count[1]);
		model.addAttribute("pageView",pageView);
		model.addAttribute("areaCode",area);
		model.addAttribute("contentType",contentType);
		return "/area/tmp";
	}
	
	@RequestMapping(value="main", params= {"page","area","contentType","target"})
	public String main(int page, int area,int contentType, String target, Model model) throws Exception{
		List<AreaListDTO> list = aService.search(page,contentType,area,target);
		int[] count = aService.searchCount(page,contentType,area,target);
		List<Integer> pageView = aService.paging(count[0],count[1]);
		model.addAttribute("list",list);
		model.addAttribute("pageNo",count[1]);
		model.addAttribute("pageView",pageView);
		model.addAttribute("areaCode",area);
		model.addAttribute("contentType",contentType);
		model.addAttribute("target",target);
		return "/area/tmp";		
	}
	
	@RequestMapping("detail")
	public String detail(int num,Model model) throws Exception{
		AreaDTO dto = aService.detail(num);
		int loginSeq = 0;
		if(session.getAttribute("loginSeq") != null) {
			loginSeq = (int)session.getAttribute("loginSeq");			
		}
		int rcmdCheck = aService.saveCheck(new SavedDTO(0,loginSeq,num));
		int replyCount = aService.replyCount(num);
		int areaReviewNo = Statics.areaReviewNo;
		int printNum = 1;
		if(areaReviewNo<replyCount) {
			printNum = areaReviewNo;
		}else {
			printNum = replyCount;
		}
		List<AreaReplyDTO> reply = aService.replyPrint(1, printNum, num);
		if(replyCount>0) {
			double rate = aService.countRate(num);
			model.addAttribute("rate",rate);			
		}
		model.addAttribute("rcmdCheck",rcmdCheck);
		model.addAttribute("dto",dto);
		model.addAttribute("reply",reply);
		model.addAttribute("printNum",printNum);
		model.addAttribute("replyCount",replyCount);
		model.addAttribute("area_seq",num);
		model.addAttribute("staticNo",areaReviewNo);
		return "/area/detail";
	}
	
	@ResponseBody
	@RequestMapping("moreReply")
	public String moreReply(int printNum,int area_seq,int replyCount,Model model) {
		List<AreaReplyDTO> reply = new ArrayList<>();
		if(printNum+Statics.areaReviewNo<replyCount) {
			reply = aService.replyPrint(printNum+1, printNum+Statics.areaReviewNo, area_seq);
		}else {
			reply = aService.replyPrint(printNum+1, replyCount, area_seq);
		}
		String result = aService.replyToJson(reply);		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("save")
	public String save(int area_seq, Model model) throws Exception{
		int loginSeq = Integer.parseInt(session.getAttribute("loginSeq").toString());
		SavedDTO dto = new SavedDTO(0,loginSeq,area_seq);
		int saveCheck = aService.saveCheck(dto);
		System.out.println(saveCheck);
		String result = "";
		if(saveCheck==0) {
			aService.saveInsert(dto);
			result = "saved";
		}else if(saveCheck==1) {
			aService.saveDelete(dto);
			result = "removed";
		}
		
		return result;
	}
	
	@RequestMapping("replySubmit")
	public String replySubmit(AreaReplyDTO dto, MultipartFile picture) throws Exception {
		String photo = "";
		if(!picture.isEmpty()) {
			String realPath = session.getServletContext().getRealPath("upload");
			File realPathFile = new File(realPath);
			if(!realPathFile.exists()) {realPathFile.mkdir();}
			
			String oriName= picture.getOriginalFilename(); //사용자가 업로드한 파일의 원본 이름
			String sysName = UUID.randomUUID()+"_"+oriName; //서버쪽에 저장할파일 이름
			//서버에 업로드 되어 메모리에 적재된 파일의 내용을 어디에 저장할 지 결정하는 부분
			picture.transferTo(new File(realPath+"/"+sysName));	
			photo = sysName;
		}
		
		int loginSeq = (int)(session.getAttribute("loginSeq"));
		String mem_nick = session.getAttribute("loginNick").toString();
		dto.setMem_nick(mem_nick);
		dto.setMem_seq(loginSeq);
		dto.setPhoto(photo);
		aService.replyInsert(dto);
		return "redirect:/area/detail?num="+dto.getArea_seq();
	}
	
	@RequestMapping("replyDelete")
	public String replyDelete(int seq,int area_seq) {
		aService.replyDelete(seq);
		return "redirect:/area/detail?num="+area_seq;
	}
	
	@ExceptionHandler
	public String ExceptionHandler(Exception e) {
		e.printStackTrace();
		e.getMessage();
		return "redirect:/";
	}
}
