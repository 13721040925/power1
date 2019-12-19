package cn.service;

import java.util.List;

import cn.pojo.Other;

public interface OtherService {

	////去重后 通过ip来查电池组的最新报错信息
	List<Other> selOtherListByIp(String ip);

	Integer addOther(Other other);
}
