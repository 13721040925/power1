package cn.socketServer;

import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketAddress;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ServerMain {
	// 线程池50--固定
	private static ExecutorService threadPool = Executors.newFixedThreadPool(50);
	private static ServerSocket server;
	private static Map<String, Socket> channels = new HashMap<String, Socket>();

	static {
		try {
			server = new ServerSocket(8888);
			System.out.println("服务器启动！");
			Accept ac = new Accept();
			Thread th1 = new Thread(ac);
			th1.start();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static Map<String, Socket> getChannels() {
		return channels;
	}

	static class Accept implements Runnable {
		@Override
		public void run() {
			System.out.println(server);
			try {
				Socket socket = null;
				while ((socket = server.accept()) != null) {
					// socket = server.accept();
					RunnableImple run = new RunnableImple(socket);
					threadPool.execute(run);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 接受Socket对象，处理该对象
	static class RunnableImple implements Runnable {
		public Socket socket;

		public RunnableImple(Socket socket) {
			this.socket = socket;
		}

		@Override
		public void run() {
			// 将获取的socket对象交给线程池
			SocketAddress address = socket.getRemoteSocketAddress();
			System.out.println(address);
			String ip = address.toString().split(":")[0].substring(1);
			channels.put(ip, socket);

		}
	}

}

