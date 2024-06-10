package com.example.syLibrary2.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.syLibrary2.user.model.dao.CheckoutDAO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("checkout/*")
public class CheckoutController {
	@Autowired
	CheckoutDAO checkoutDao;

	@GetMapping("{b_id}")
	public String checkMloan(@PathVariable(name = "b_id") int b_id, HttpSession session) {
		String m_id = (String) session.getAttribute("mId");
		Map<String, Object> param = new HashMap();
		param.put("userid", m_id);
		checkoutDao.checkMloan(param);

		String resultPage = "";
		switch (param.get("p_result").toString()) {
		case "1":
			Map<String, Object> map = new HashMap<>();
			map.put("m_id", m_id);
			map.put("b_id", b_id);
			int result = checkoutDao.duplicate(map) > 0 ? 0 : 1;
			if (checkoutDao.duplicate(map) > 0) {
				resultPage = "redirect:fail";
			} else {
				resultPage = "redirect:" + b_id + "/insert";
			}
			break;
		case "0":
			resultPage = "redirect:fail";
			break;
		}
		return resultPage;
	}

	@Transactional
	@ResponseBody
	@GetMapping("{b_id}/insert")
	public String insert(@PathVariable(name = "b_id") int b_id, HttpSession session) {
		String m_id = (String) session.getAttribute("mId");
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		map.put("b_id", b_id);
		checkoutDao.insert(map);
		String result = "신청완료";
		return result;
	}

	@ResponseBody
	@GetMapping("fail")
	public String fail() {
		String result = "Not possible";
		return result;
	}
}
