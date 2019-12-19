package cn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.pojo.Pro;

public interface ProMapper {

	//根据ip查看去重后的 电池组pro状态
	@Select("select * from (select * from pro where id in(select max(id) from pro GROUP BY group_name)) t where ip=#{ip}")
	List<Pro> selProByIp(String ip);

	@Insert(" insert into pro (group_name,ip,warntime,lipower,templower,temphigher,indivhigher,indivlower,powervhigher,powervlower) values (#{group_name},#{ip},#{warntime},#{lipower},#{templower},#{temphigher},#{indivhigher},#{indivlower},#{powervhigher},#{powervlower}) ")
	Integer addPro(Pro pro);
}
