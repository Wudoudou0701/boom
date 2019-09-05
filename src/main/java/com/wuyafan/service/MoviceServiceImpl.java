package com.wuyafan.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wuyafan.bean.Movice;
import com.wuyafan.bean.Types;
import com.wuyafan.mapper.MoviceMapperDao;

@Service
public class MoviceServiceImpl implements MoviceService{

	@Resource
	private MoviceMapperDao moviceMapperDao;

	@Override
	public List<Map<String, Object>> getMoviceList(Map<String, Object> map) {
		return moviceMapperDao.getMoviceList(map);
	}

	@Override
	public List<Types> getTypesList(Types types) {
		return moviceMapperDao.getTypesList(types);
	}

	@Override
	public Movice getTypesListById(Movice movice) {
		return moviceMapperDao.getTypesListById(movice);
	}

	@Override
	public int deleteAll(String[] mids) {
		return moviceMapperDao.deleteAll(mids);
	}
	
	

	@Override
	public void add(Movice movice,int[]tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i : tid) {
			map.put("movie", movice);
			map.put("tid", i);
			moviceMapperDao.add(map);
		}
	}

	@Override
	public Map<String, Object> toupdate(int mid) {
		return moviceMapperDao.toupdate(mid);
	}

	@Override
	public void update(Movice movice, int[] tid) {
		Map<String, Object> map = new HashMap<String, Object>();
		moviceMapperDao.updateMo(movice);
		map.put("movie", movice);
		map.put("tid", tid);
		moviceMapperDao.addmiddle(map);
		
	}


	

	
}
