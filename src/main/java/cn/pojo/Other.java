package cn.pojo;

import org.springframework.stereotype.Component;

@Component("other")
public class Other {

	private Integer id;
	private String group_name;
	private String warntime;
	private String ip;
	private Integer power; //一下是状态1报错 0 正常
	private Integer ahlower;
	private Integer outpower;
	private Integer inpower;
	private Integer middlev;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getWarntime() {
		return warntime;
	}
	public void setWarntime(String warntime) {
		this.warntime = warntime;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Integer getPower() {
		return power;
	}
	public void setPower(Integer power) {
		this.power = power;
	}
	public Integer getAhlower() {
		return ahlower;
	}
	public void setAhlower(Integer ahlower) {
		this.ahlower = ahlower;
	}
	public Integer getOutpower() {
		return outpower;
	}
	public void setOutpower(Integer outpower) {
		this.outpower = outpower;
	}
	public Integer getInpower() {
		return inpower;
	}
	public void setInpower(Integer inpower) {
		this.inpower = inpower;
	}
	public Integer getMiddlev() {
		return middlev;
	}
	public void setMiddlev(Integer middlev) {
		this.middlev = middlev;
	}
	
	@Override
	public String toString() {
		return "Other [id=" + id + ", group_name=" + group_name + ", warntime=" + warntime + ", ip=" + ip + ", power="
				+ power + ", ahlower=" + ahlower + ", outpower=" + outpower + ", inpower=" + inpower + ", middlev="
				+ middlev + "]";
	}

}
