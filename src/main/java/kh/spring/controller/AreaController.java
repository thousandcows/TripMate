package kh.spring.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

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
import kh.spring.dto.AreaRcmdDTO;
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
	
	@RequestMapping(value="main", method=RequestMethod.GET, params= {"page","area","contentType"}) //기본 출력
	public String main(int page,int area,int contentType, Model model) throws Exception{
		List<AreaListDTO> list = aService.listBuild(page,contentType,area); //DTO 리스트
		int[] count = aService.pageCountBuild(page, contentType, area);
		List<Integer> pageView = aService.paging(count[0],count[1]); //페이지 숫자 출력
		model.addAttribute("list",list);
		model.addAttribute("pageNo",count[1]);
		model.addAttribute("pageView",pageView);
		model.addAttribute("areaCode",area);
		model.addAttribute("contentType",contentType);
		return "/area/tmp";
	}
	
	@RequestMapping(value="main", params= {"page","area","contentType","target"}) //검색 출력
	public String main(int page, int area,int contentType, String target, Model model) throws Exception{
		List<AreaListDTO> list = aService.searchBuild(page, contentType, area, target);
		int[] count = aService.searchCountBuild(page, contentType, area, target); //전체페이지,현재페이지
		List<Integer> pageView = aService.paging(count[0],count[1]); //페이지 숫자 출력
		model.addAttribute("list",list);
		model.addAttribute("pageNo",count[1]);
		model.addAttribute("pageView",pageView);
		model.addAttribute("areaCode",area);
		model.addAttribute("contentType",contentType);
		model.addAttribute("target",target);
		return "/area/tmp";		
	}
	
	@RequestMapping("detail") //상세페이지
	public String detail(int num,Model model) throws Exception{
		AreaDTO dto = aService.detailBuild(num); //조건 설
		int loginSeq = 0;
		if(session.getAttribute("loginSeq") != null) { //로그인 여부 확인, seq 주입
			loginSeq = (int)session.getAttribute("loginSeq");			
		}
		int rcmdCheck = aService.saveCheck(new SavedDTO(0,loginSeq,num)); //찜 여부 확인
		int replyCount = aService.replyCount(num); //댓글수 계산
		int printNum = 1;
		if(Statics.areaReviewNo<replyCount) {printNum = Statics.areaReviewNo;}
		else { printNum = replyCount;}
		List<AreaReplyDTO> reply = aService.replyPrint(1, printNum, num); //댓글 출력

		if(replyCount>0) {//댓글 1개이상 존재시, 평점 출력
			double rate = aService.countRate(num);
			model.addAttribute("rate",rate);			
		}
		
		List<AreaRcmdDTO> rcmd = aService.rcmdBuild(dto.getCategory(),dto.getCat2(),dto.getCat3());
		dto.setCategory(aService.categorySort(dto.getCategory())); //카테고리 한글변경
		model.addAttribute("rcmdCheck",rcmdCheck);
		model.addAttribute("dto",dto);
		model.addAttribute("rcmd",rcmd);
		model.addAttribute("reply",reply);
		model.addAttribute("printNum",printNum);
		model.addAttribute("replyCount",replyCount);
		model.addAttribute("area_seq",num);
		model.addAttribute("staticNo",Statics.areaReviewNo);
		return "/area/detail";
	}
	
	@ResponseBody
	@RequestMapping("moreReply")  //댓글 Ajax로 추가출력
	public String moreReply(int printNum,int area_seq,int replyCount,Model model) {
		List<AreaReplyDTO> reply = new ArrayList<>();
		if(printNum+Statics.areaReviewNo<replyCount) { //남은 댓글수에 따라 출력.
			reply = aService.replyPrint(printNum+1, printNum+Statics.areaReviewNo, area_seq);
		}else {
			reply = aService.replyPrint(printNum+1, replyCount, area_seq);
		}
		String result = aService.replyToJson(reply); //Json String처리
		return result;
	}
	
	@ResponseBody
	@RequestMapping("save")//찜 ajax로 확인
	public String save(int area_seq, Model model) throws Exception{
		int loginSeq = Integer.parseInt(session.getAttribute("loginSeq").toString());
		SavedDTO dto = new SavedDTO(0,loginSeq,area_seq); //DTO 생성
		int saveCheck = aService.saveCheck(dto); //기존 찜 여부 확인
		String result = "";
		if(saveCheck==0) {
			aService.saveInsert(dto); //찜 생성
			result = "saved";
		}else if(saveCheck==1) {
			aService.saveDelete(dto); //찜 삭제
			result = "removed";
		}
		return result;
	}
	
	@RequestMapping("replySubmit") //댓글 작성
	public String replySubmit(AreaReplyDTO dto, MultipartFile picture) throws Exception {
		String photo = aService.uploadPhoto(picture,session);
		int loginSeq = (int)(session.getAttribute("loginSeq"));
		String mem_nick = session.getAttribute("loginNick").toString();
		dto.setMem_nick(mem_nick);
		dto.setMem_seq(loginSeq);
		dto.setPhoto(photo);
		aService.replyInsert(dto);
		return "redirect:/area/detail?num="+dto.getArea_seq();
	}
	
	@RequestMapping("replyUpdate")
	public String replyUpdate(AreaReplyDTO dto, MultipartFile picture) throws Exception{
		String photo = aService.updatePhoto(picture, session, dto.getSeq());
		String mem_nick = session.getAttribute("loginNick").toString();
		dto.setMem_nick(mem_nick);
		dto.setPhoto(photo);
		aService.replyUpdate(dto);
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
