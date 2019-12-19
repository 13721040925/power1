package cn.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.mapper.WarnMapper;
import cn.pojo.Warn;

@Service("warnService") 
public class WarnServiceImpl implements WarnService{

	@Resource 
	private WarnMapper mapper;
	
	@Override
	public List<Warn> selWarnListByIp(String ip) {
		return mapper.selWarnListByIp(ip);
	}

	@Override
	public Integer addWarn(Warn warn) {
		// TODO Auto-generated method stub
		return mapper.addWarn(warn);
	}

}
