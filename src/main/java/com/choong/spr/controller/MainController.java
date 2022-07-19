package com.choong.spr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.choong.spr.domain.BoardDto;
import com.choong.spr.domain.ReplyDto;
import com.choong.spr.service.BoardService;
import com.choong.spr.service.ReplyService;

@Controller
@RequestMapping("main")
public class MainController {

	@Autowired
	private BoardService service;

	@Autowired
	private ReplyService replyService;

	@RequestMapping("home")
	public void main(Model model) {

		List<BoardDto> list = service.getMainList();
		model.addAttribute("boardList", list);
	}

}
