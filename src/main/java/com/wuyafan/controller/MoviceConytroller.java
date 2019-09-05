package com.wuyafan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wuyafan.bean.Movice;
import com.wuyafan.bean.Types;
import com.wuyafan.service.MoviceService;

@Controller
public class MoviceConytroller {

	@Resource
	private MoviceService moviceService;
	
	
	@RequestMapping("list.do")
	public String list(Model model,@RequestParam(defaultValue="")String mname,@RequestParam(defaultValue="1")int cpage) {
		Map<String,Object> map=new HashMap<>();
		map.put("mname", mname);
		PageHelper.startPage(cpage, 2);
		List<Map<String,Object>> moviceList = moviceService.getMoviceList(map);
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<>(moviceList);
		model.addAttribute("moviceList",moviceList);
		model.addAttribute("map",map);
		model.addAttribute("mname",mname);
		model.addAttribute("page",pageInfo);
		return "list";
		
	}
	
	@RequestMapping("toAdd.do")
	public String toAdd() {
		return "add";
		
	}
	
	@RequestMapping("add.do")
	@ResponseBody
	public Object add(Movice movice,int[]tid) {
	 moviceService.add(movice,tid);
	  return true;
	}
	
	
	@RequestMapping("getTypesList.do")
	@ResponseBody
	public Object getTypesList(Types types) {
	List<Types>  typesList=moviceService.getTypesList(types);
		return typesList;	
	}
	
	@RequestMapping("getTypesListById.do")
	@ResponseBody
	public Object getTypesListById(Movice movice) {
	movice=moviceService.getTypesListById(movice);
		return movice;	
	}
	
	@RequestMapping("toUpdate.do")
	public String toupdate(int mid,Model model) {
		Map<String,Object>  toupdate=moviceService.toupdate(mid);
		model.addAttribute("toupdate", toupdate);
		return "update";
		
	}
	
	@RequestMapping("update.do")
	@ResponseBody
	public Object update(Movice movice,int []tid) {
		moviceService.update(movice,tid);
		return true;
	}
	
	@RequestMapping("deleteAll.do")
	@ResponseBody
	public int deleteAll(String[] mids) {
	int i=moviceService.deleteAll(mids);
		return i;	
	}
	
}
