package com.ibaixiong.merchant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index")
	String index( ModelMap modelMap) {
		return "redirect:/u/finance/list.html";
	}
}
