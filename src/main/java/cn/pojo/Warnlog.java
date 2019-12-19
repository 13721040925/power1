package cn.pojo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("warnlog")
public class Warnlog {

	private Integer id;
	private String warntime;
	private String ip;
	private double glqtemp;
	private Integer prostatus; //状态 1报错 0 正常
	private Integer warnstatus; 
	private Integer otherstatus;
//	private List<Pro> proList;
//	private List<Warn> warnList;
//	private List<Warnlog> warnlogList;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public double getGlqtemp() {
		return glqtemp;
	}
	public void setGlqtemp(double glqtemp) {
		this.glqtemp = glqtemp;
	}
	public Integer getProstatus() {
		return prostatus;
	}
	public void setProstatus(Integer prostatus) {
		this.prostatus = prostatus;
	}
	public Integer getWarnstatus() {
		return warnstatus;
	}
	public void setWarnstatus(Integer warnstatus) {
		this.warnstatus = warnstatus;
	}
	public Integer getOtherstatus() {
		return otherstatus;
	}
	public void setOtherstatus(Integer otherstatus) {
		this.otherstatus = otherstatus;
	}
	
	@Override
	public String toString() {  
		return "Warnlog [id=" + id + ", warntime=" + warntime + ", ip=" + ip + ", glqtemp=" + glqtemp + ", prostatus="
				+ prostatus + ", warnstatus=" + warnstatus + ", otherstatus=" + otherstatus + "]";
	}
	
	
}
