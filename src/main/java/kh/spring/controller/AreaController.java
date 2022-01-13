package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.AreaListDTO;
import kh.spring.service.AreaService;


@Controller
@RequestMapping("/area/")
public class AreaController {

	@Autowired
	public AreaService aService;
	
	
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
		model.addAttribute("dto",dto);
		return "/area/detail";
	}
	
}
