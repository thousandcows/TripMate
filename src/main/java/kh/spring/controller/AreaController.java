package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.AreaDTO;
import kh.spring.dto.AreaListDTO;
import kh.spring.service.AreaService;


@Controller
@RequestMapping("/area/")
public class AreaController {

	@RequestMapping("main")
	public String test(Model model) throws Exception{
		List<AreaListDTO> list = aService.basicList(1);
		model.addAttribute("list",list);
		int totalCount = aService.totalCount(1);
		model.addAttribute("totalCount",totalCount);
		return "/area/tmp";
	}
	
	@Autowired
	public AreaService aService;

	@RequestMapping("detail")
	public String detail(int num,Model model) throws Exception{

		AreaDTO dto = aService.detail(num);
		model.addAttribute("dto",dto);
		return "/area/detail";
	}
	
}
