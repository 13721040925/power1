package cn.service;

import java.util.List;

import cn.pojo.Pro;

public interface ProService {

	//根据ip查看去重后的 电池组pro状态
	List<Pro> selProByIp(String ip);

	Integer addPro(Pro pro);
}
