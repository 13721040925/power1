package cn.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.pojo.Other;

public interface OtherMapper {

////去重后 通过ip来查电池组的最新报错信息
	@Select("select * from (select * from other where id in(select max(id) from other GROUP BY group_name)) t where ip=#{ip}")
	List<Other> selOtherListByIp(String ip);

	@Insert(" insert into other (group_name,warntime,ip,power,ahlower,outpower,inpower,middlev) values (#{group_name},#{warntime},#{ip},#{power},#{ahlower},#{outpower},#{inpower},#{middlev}) ")
	Integer addOther(Other other);
}
