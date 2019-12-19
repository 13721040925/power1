package cn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.mapper.OtherMapper;
import cn.pojo.Other;

@Service("otherService")
public class OtherServiceImpl implements OtherService{

	@Resource
	private OtherMapper mapper;
	
	@Override
	public List<Other> selOtherListByIp(String ip) {
		return mapper.selOtherListByIp(ip);
	}

	@Override
	public Integer addOther(Other other) {
		// TODO Auto-generated method stub
		return mapper.addOther(other);
	}

}
