package cn.socketServer;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.Socket;

import cn.util.Changedegital;
import cn.util.CommondName;

public class ModuleDegtails implements Runnable {
	private DataOutputStream out;
	private DataInputStream in;
	private Socket socket;
	private String msg;

	public ModuleDegtails(Socket socket) {
		this.socket = socket;
	}

	public String getMsg() {
		return msg;
	}

	@Override
	public void run() {
		try {
			out = new DataOutputStream(socket.getOutputStream());
			in = new DataInputStream(socket.getInputStream());
			byte[] bt = CommondName.getXyModel();
			if (bt != null) {
				out.write(bt);// 输出信息
				out.flush();
			}
			byte[] bt1 = new byte[1024];
			while (in != null) {
				in.read(bt1);
				msg = Changedegital.bytesToString(bt1);
				break;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
