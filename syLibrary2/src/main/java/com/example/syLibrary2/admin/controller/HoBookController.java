package com.example.syLibrary2.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.syLibrary2.admin.model.dao.BookDAO;
import com.example.syLibrary2.admin.model.dao.HoBookDAO;
import com.example.syLibrary2.admin.model.dto.HoBookDTO;
import com.example.syLibrary2.util.PageUtil2;

@Controller
@RequestMapping("/admin/hope/*")
public class HoBookController {
	@Autowired
	HoBookDAO dao;
	
	@Autowired
	BookDAO bookDao;
	
	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(name = "cur_page", defaultValue = "1") int curPage,
			@RequestParam(name = "search_option", defaultValue = "none") String search_option,
			@RequestParam(name = "keyword", defaultValue = "") String keyword) {
		int count = dao.count(search_option, keyword);
		PageUtil2 page = new PageUtil2(count, curPage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<HoBookDTO> dto = dao.list(start, end, search_option, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/hope/hope_list");
		Map<String, Object> map = new HashMap<>();
		map.put("dto", dto);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("page", page);
		mav.addObject("map", map);
		return mav; 
	}
	
	@GetMapping("detail.do")
	public ModelAndView detail(@RequestParam(name = "h_idx") int h_idx) {
		ModelAndView mav = new ModelAndView();
		HoBookDTO dto = dao.detail(h_idx);
		dto.setH_idx(h_idx);
		mav.setViewName("admin/hope/hope_detail");
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	@GetMapping("change_status")
	public String change_status(HoBookDTO dto, @RequestParam(name="state")String h_state){
		int h_idx = dto.getH_idx();
		String result = "";
		String h_category = dto.getH_category();
		if (h_state.equals("이용가능")) {
			return "redirect:/admin/hope/ins_book?h_idx="+h_idx;
		} else {
			dao.state_update(h_idx, h_state);
			return "redirect:/admin/hope/detail.do?h_idx="+h_idx;
		}
	}
	
	@RequestMapping("cancel_reason")
	@ResponseBody
	public String cancel_reason(@RequestParam(name = "h_idx") int hidx,@RequestParam(name = "h_cancel") String h_cancel) {
		int h_idx = Integer.valueOf(hidx);
		dao.cancel_reason(h_idx,h_cancel);
		return "admin/hope/hope_detail";
	}
	
	@GetMapping("ins_book")
	public ModelAndView ins_book(@RequestParam(name = "h_idx") int h_idx) {
		HoBookDTO dto = dao.detail(h_idx);
		dto.setH_idx(h_idx);
		String result = "";
		String h_category = dto.getH_category();
		ModelAndView mav = new ModelAndView();
		int ctct = bookDao.ctct(h_category);
		if (ctct == 0) {
			result="a";
			Map<String, Object> map = new HashMap<>();
			map.put("rst", result);
			map.put("idx", h_idx);
			mav.setViewName("admin/hope/hope_detail");
			mav.addObject("map", map); 
		} else {
			String h_state = "이용가능";
			dao.state_update(h_idx, h_state);
			int ct_number = bookDao.ins_ct(h_category);
			result = dao.ins_book(dto, ct_number);
			Map<String, Object> map = new HashMap<>();
			map.put("result", result);
			map.put("idx", h_idx);
			mav.setViewName("admin/hope/hope_detail");
			mav.addObject("map", map); 
		}
		System.out.println(mav);
		return mav;
	}
}

