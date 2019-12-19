package cn.pojo;

import java.util.List;

import org.springframework.stereotype.Component;

@Component("wopList")
public class WopList {

	private List<Pro> proList;
	private List<Warn> warnList;
	private List<Warnlog> warnlogList;
	
	public List<Pro> getProList() {
		return proList;
	}
	public void setProList(List<Pro> proList) {
		this.proList = proList;
	}
	public List<Warn> getWarnList() {
		return warnList;
	}
	public void setWarnList(List<Warn> warnList) {
		this.warnList = warnList;
	}
	public List<Warnlog> getWarnlogList() {
		return warnlogList;
	}
	public void setWarnlogList(List<Warnlog> warnlogList) {
		this.warnlogList = warnlogList;
	}
	
	@Override
	public String toString() {
		return "WopList [proList=" + proList + ", warnList=" + warnList + ", warnlogList=" + warnlogList + "]";
	} 
	
}
