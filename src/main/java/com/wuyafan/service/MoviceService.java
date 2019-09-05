package com.wuyafan.service;

import java.util.List;
import java.util.Map;

import com.wuyafan.bean.Movice;
import com.wuyafan.bean.Types;

public interface MoviceService {

	List<Map<String,Object>>  getMoviceList(Map<String,Object> map);

	List<Types> getTypesList(Types types);

	Movice getTypesListById(Movice movice);

	int deleteAll(String[] mids);

	void add(Movice movice, int[] tid);

	Map<String, Object> toupdate(int mid);

	void update(Movice movice, int[] tid);
}
