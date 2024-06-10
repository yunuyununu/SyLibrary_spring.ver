package com.example.syLibrary2.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.syLibrary2.admin.model.dao.AdminDAO;
import com.example.syLibrary2.admin.model.dao.MemoDAO;
import com.example.syLibrary2.admin.model.dto.MemoDTO;
import com.example.syLibrary2.util.PageUtil2;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/memo/*")
public class MemoController {
	
	@Autowired
	MemoDAO memoDao;
	
	@Autowired
	AdminDAO adminDao;
	
	@GetMapping("list.do")
	public ModelAndView list(@RequestParam(name="curPage", defaultValue="1") int curPage) {
		int count = memoDao.count(); //레코드 개수
		PageUtil2 page = new PageUtil2(count, curPage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<MemoDTO> list =memoDao.list(start, end); //게시물 리스트
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main/memo_list");
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("page", page);
		mav.addObject("map", map);
		return mav;
	}
	
	@PostMapping("insert.do")
	public String insert(MemoDTO dto, HttpSession session) {
		String me_a_id = (String) session.getAttribute("a_id");
		dto.setMe_a_id(me_a_id);
		memoDao.insert(dto);
		return "admin/admin_main";
	}
	
	@RequestMapping("delete.do")
	public String delete(@RequestParam(name="me_rownum")int me_rownum) {
		int m_rownum = Integer.valueOf(me_rownum);
		memoDao.delete(m_rownum);
		return "admin/admin_main";
	}
	
	@PostMapping("update.do")
	public String update(MemoDTO dto){
		memoDao.update(dto);
		return "admin/admin_main";
	}
	

	//메모상세 (확인요망)
		@RequestMapping("search.do")
		@ResponseBody
		public HashMap<String, Object> detail(@RequestParam(name="me_rownum") String me_rownum) {
			int m_rownum = Integer.valueOf(me_rownum);
			MemoDTO memo = memoDao.search(m_rownum);
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> map = mapper.convertValue(memo, HashMap.class);
			return map;

		}
	
}
