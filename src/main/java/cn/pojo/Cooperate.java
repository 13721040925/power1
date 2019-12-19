package cn.pojo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("cooperate")
public class Cooperate {
	private Integer id;
	private String ip;
	private String cooperate_name;//控制器名称
	private Double fdtime;// 放电倒计时
	private Integer totaltime;// 放电总时长
	private Integer onlioncount;// 电池组在线数量
	private List<Cooperate> coopList; 
	private String state;
	private String logtime;
	//private Group[] groups = new Group[6];
//	private List<Group> grouplts;
//	private List<Warnlog> loglts;
//	private Warnlog warnlog;
//	private Group group;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCooperate_name() {
		return cooperate_name;
	}
	public void setCooperate_name(String cooperate_name) {
		this.cooperate_name = cooperate_name;
	}
	public Double getFdtime() {
		return fdtime;
	}
	public void setFdtime(Double fdtime) {
		this.fdtime = fdtime;
	}
	public Integer getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(Integer totaltime) {
		this.totaltime = totaltime;
	}
	public Integer getOnlioncount() {
		return onlioncount;
	}
	public void setOnlioncount(Integer onlioncount) {
		this.onlioncount = onlioncount;
	}
	public List<Cooperate> getCoopList() {
		return coopList;
	}
	public void setCoopList(List<Cooperate> coopList) {
		this.coopList = coopList;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getLogtime() {
		return logtime;
	}

	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	@Override
	public String toString() {
		return "Cooperate [id=" + id + ", ip=" + ip + ", cooperate_name=" + cooperate_name + ", fdtime=" + fdtime
				+ ", totaltime=" + totaltime + ", onlioncount=" + onlioncount + ", coopList=" + coopList + ", state="
				+ state + ", logtime=" + logtime + "]";
	}
	
}
