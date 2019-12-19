package cn.client;

import cn.util.CommondName;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;

public class Client {
	public static void main(String[] args) {
		try {
			System.out.println("rtn=" + SendCommond("遥控", "127.0.0.1", 8899, "FF", "A1", "1"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//commond_group 等于"FF"（commond_type只能选A1-A3） 
	//commond_group=01-06 commond_type A1-A5 
	//commond_group=07 commond_type只能是A6
	//commond_type=A1-A3 的commond_datai只能是0或1
	//commond_type=A4-A5的commond_datai只能是0-6;充放电顺序 越小越大
	//commond_type=A6 commond_datai只能是1-4;充放电模式 
	//A1遥控内容
	public static Integer SendCommond(String comName, String ip, int port, String commond_group, String commond_type,
			String commond_datai) throws Exception {
	
		EventLoopGroup eventLoopGroup = new NioEventLoopGroup();
		
		try {
			if (comName.equals("遥控")) {
				System.out.println(">>>>>>>>>>>>>>>>>");
				ClientHandler
						.setBt(new CommondName().getRemoteControl(new CommondName().getCommond_group(commond_group),
								new CommondName().getCommond_type(commond_type),
								new CommondName().getCommond_datai(commond_datai)));
			} 

			Bootstrap bootstrap = new Bootstrap();
			bootstrap.group(eventLoopGroup).channel(NioSocketChannel.class).
				handler(new ClinetInitializer());
			
			ChannelFuture channelFuture = bootstrap.connect(ip, port).sync();
			channelFuture.channel().closeFuture().sync();

			return ClientHandler.getRtn();
		}finally {
			eventLoopGroup.shutdownGracefully();
		}

		/*
		 * Test1 test1 = new Test1(); for(int i=0;i<500;i++) { new
		 * Thread(test1).start(); new Thread(test1).sleep(100);
		 * System.out.println("已有"+i+"个加入"); }
		 */
	
	}
}
	

