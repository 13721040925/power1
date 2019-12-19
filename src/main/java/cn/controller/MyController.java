package cn.controller;

import java.net.Socket;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.service.CooperateService;
import cn.service.GroupService;
import cn.service.OtherService;
import cn.service.ProService;
import cn.service.WarnService;
import cn.service.WarnlogService;
import cn.socketServer.DoWarn;
import cn.socketServer.ModuleDegtails;
import cn.socketServer.RemoteControl;
import cn.socketServer.ServerMain;
import cn.util.Translate;
@Controller
@RequestMapping("/pow") 
public class MyController {

	@Resource
	private CooperateService cooperateService;
	@Resource
	private GroupService groupService;
	@Resource
	private WarnlogService warnlogService;
	@Resource
	private ProService proService;
	@Resource
	private WarnService warnService;
	@Resource
	private OtherService otherService;

	private static ServerMain serverMain;

	public static final String PATH = "E:/FileUpload";

	static {
		serverMain = new ServerMain();
	}


	/**
	 * 发送遥控命令
	 * 
	 * @param ip
	 * @param group
	 * @param type
	 * @param datai
	 * @return
	 */
	@RequestMapping(value = "/remote1", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String remote1(String ip, String group, String type, String datai) {
		try {
			Socket so = null;
			for (Entry<String, Socket> entry : serverMain.getChannels().entrySet()) {
				if (entry.getKey().equals(ip)) {
					System.out.println(">>>>>>>>>>>>>>>");
					so = entry.getValue();
					break;
				}
			}
			if (so != null) {
				System.out.println(so);
				RemoteControl remoteControl = new RemoteControl(so, group, type, datai);
				Thread th = new Thread(remoteControl);
				th.start();
				th.join();
				String msg = null;
				while ((msg = remoteControl.getMsg()) != null) {
					System.out.println(msg);
					break;
				}
				if (msg != null) {
					return JSON.toJSONString("设置成功！");
				}
			} else {
				System.out.println(ip + "未连接服务器");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(ip + "已经与服务器断开!");
		}
		return JSON.toJSONString("设置失败！");
	}

	/**
	 * 发送模拟量化数据命令
	 * 
	 * @param
	 * @param
	 * @param
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/getModel", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getModel(String ip) {
		try {
			Socket so = null;
			for (Entry<String, Socket> entry : serverMain.getChannels().entrySet()) {
				if (entry.getKey().equals(ip)) {
					System.out.println(">>>>>>>>>>>>>>>");
					so = entry.getValue();
					break;
				}
			}
			if (so != null) {
				System.out.println(so);
				ModuleDegtails moduleDegtails = new ModuleDegtails(so);
				Thread th = new Thread(moduleDegtails);
				th.start();
				th.join();
				String msg = null;
				while ((msg = moduleDegtails.getMsg()) != null) {
					System.out.println(msg);
					break;
				}
				String flag = Translate.transLog(msg.trim(), ip);
				System.out.println(flag);
				if (flag.equals("11") || flag.equals("01")) {
					System.out.println("有报警！");
					if (sendWarnCommond(ip)) {
						return JSON.toJSONString("有报警信息，且报警数据添加成功！");
					} else {
						return JSON.toJSONString("有报警信息，但报警数据因异常添加失败！");
					}
				} else {
					return JSON.toJSONString("数据正常！");
				}
			} else {
				System.out.println(ip + "未连接服务器");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(ip + "已经与服务器断开!");
		}
		return JSON.toJSONString("客户端已断开连接，数据采集失败！");
	}

	public boolean sendWarnCommond(String ip) {
		boolean flag = false;
		try {
			Socket so = null;
			for (Entry<String, Socket> entry : serverMain.getChannels().entrySet()) {
				if (entry.getKey().equals(ip)) {
					System.out.println(">>>>>>>>>>>>>>>");
					so = entry.getValue();
					break;
				}
			}
			if (so != null) {
				System.out.println(so);
				DoWarn doWarn = new DoWarn(so);
				Thread th = new Thread(doWarn);
				th.start();
				th.join();
				String msg = null;
				while ((msg = doWarn.getMsg()) != null) {
					System.out.println(msg);
					flag = Translate.tranWarn(msg.trim(), ip);
					break;
				}
			} else {
				System.out.println(ip + "未连接服务器");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println(ip + "已经与服务器断开!");
		}
		return flag;
	}
}
