package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	@RequestMapping("/main/")
	public String main() {
		return "hi";
	}
}
