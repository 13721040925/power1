package cn.service;

import java.util.List;

import cn.pojo.Warn;

public interface WarnService {

	////根据ip查看去重后的 电池组warn状态
	List<Warn> selWarnListByIp(String ip);

	Integer addWarn(Warn warn);
}
