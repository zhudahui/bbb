package com.chinasofti.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {
	@RequestMapping("welcome")
	public ModelAndView welcome() {
		//ModelAndView页面渲染
		return new ModelAndView("login");
	}
}
