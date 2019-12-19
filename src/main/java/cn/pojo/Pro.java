package cn.pojo;

import org.springframework.stereotype.Component;

@Component("pro")
public class Pro {

	private Integer id;
	private String  group_name;
	private String  ip; 
	private String warntime;
	private Integer lipower;//以下状态 1报错 0 正常
	private Integer templower;
	private Integer temphigher;
	private Integer indivhigher;
	private Integer indivlower;
	private Integer powervhigher;
	private Integer powervlower;
	
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getWarntime() {
		return warntime;
	}
	public void setWarntime(String warntime) {
		this.warntime = warntime;
	}
	public Integer getLipower() {
		return lipower;
	}
	public void setLipower(Integer lipower) {
		this.lipower = lipower;
	}
	public Integer getTemplower() {
		return templower;
	}
	public void setTemplower(Integer templower) {
		this.templower = templower;
	}
	public Integer getTemphigher() {
		return temphigher;
	}
	public void setTemphigher(Integer temphigher) {
		this.temphigher = temphigher;
	}
	public Integer getIndivhigher() {
		return indivhigher;
	}
	public void setIndivhigher(Integer indivhigher) {
		this.indivhigher = indivhigher;
	}
	public Integer getIndivlower() {
		return indivlower;
	}
	public void setIndivlower(Integer indivlower) {
		this.indivlower = indivlower;
	}
	public Integer getPowervhigher() {
		return powervhigher;
	}
	public void setPowervhigher(Integer powervhigher) {
		this.powervhigher = powervhigher;
	}
	public Integer getPowervlower() {
		return powervlower;
	}
	public void setPowervlower(Integer powervlower) {
		this.powervlower = powervlower;
	}
	
	@Override
	public String toString() {
		return "Pro [id=" + id + ", group_name=" + group_name + ", ip=" + ip + ", warntime=" + warntime + ", lipower="
				+ lipower + ", templower=" + templower + ", temphigher=" + temphigher + ", indivhigher=" + indivhigher
				+ ", indivlower=" + indivlower + ", powervhigher=" + powervhigher + ", powervlower=" + powervlower
				+ "]";
	}
	
}
