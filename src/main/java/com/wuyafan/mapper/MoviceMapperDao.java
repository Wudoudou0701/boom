package com.wuyafan.mapper;

import java.util.List;
import java.util.Map;

import com.wuyafan.bean.Movice;
import com.wuyafan.bean.Types;

public interface MoviceMapperDao {

	List<Map<String,Object>>  getMoviceList(Map<String,Object> map);

	void add(Map<String,Object> map);

	List<Types> getTypesList(Types types);

	Movice getTypesListById(Movice movice);

	int deleteAll(String[] mids);

	Map<String, Object> toupdate(int mid);

	void addmiddle(Map<String, Object> map);

	void updateMo(Movice movice);
	
	
}
