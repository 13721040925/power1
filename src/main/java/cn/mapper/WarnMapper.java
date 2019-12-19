package cn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.pojo.Warn;

public interface WarnMapper {

////根据ip查看去重后的 电池组warn状态
	@Select("select * from (select * from warn where id in(select max(id) from warn GROUP BY group_name)) t where ip=#{ip}")
	List<Warn> selWarnListByIp(String ip);

	@Insert(" insert into warn (group_name,warntime,ip,powertemplower,powertemphigher,indivhighers,indivlowers,groupvhigher,groupvlower,powerahigher,bmu) values (#{group_name},#{warntime},#{ip},#{powertemplower},#{powertemphigher},#{indivhighers},#{indivlowers},#{groupvhigher},#{groupvlower},#{powerahigher},#{bmu}) ")
	Integer addWarn(Warn warn);
}
