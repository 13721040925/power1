package cn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.mapper.ProMapper;
import cn.pojo.Pro;

@Service("proService")
public class ProServiceImpl implements ProService{

	@Resource
	private ProMapper mapper;
	
	@Override
	public List<Pro> selProByIp(String ip) {
		return mapper.selProByIp(ip);
	}

	@Override
	public Integer addPro(Pro pro) {
		// TODO Auto-generated method stub
		return mapper.addPro(pro);
	}

}
