package cn.client;

import cn.util.CommondName;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

public class ClientHandler extends SimpleChannelInboundHandler<String> {
	public static byte[] bt;
	public static Integer rtn;
	public static byte[] getBt() {
		return bt;
	}

	public static void setBt(byte[] bt) {
		ClientHandler.bt = bt;
	}

	public static Integer getRtn() {
		return rtn;
	}
	@Override
	protected void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
		System.out.println("server:"+msg);

		if (msg.trim().equals("~200147001000FDB1")) {
			this.rtn = msg.trim().substring(10, 12).equals("00") ? 0 : 1;
			ctx.close();
		}
		if (msg.trim().equals("~20014742E002FFFD09")) {
			byte[] bt = new CommondName().xyModel();
			ByteBuf seneMsg = Unpooled.buffer(bt.length);
			seneMsg.writeBytes(bt);
			ctx.writeAndFlush(seneMsg);
		}
		if (msg.trim().equals("~20014744E002FFFD07")) {
			byte[] bt = new CommondName().xyWarn();
			ByteBuf seneMsg = Unpooled.buffer(bt.length);
			seneMsg.writeBytes(bt);
			ctx.writeAndFlush(seneMsg);
		}
		
	}
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		byte[] bts = this.bt;
		ByteBuf seneMsg = Unpooled.buffer(bt.length);
		seneMsg.writeBytes(bt);
		ctx.writeAndFlush(seneMsg);
		// ctx.close();
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		cause.printStackTrace();
		ctx.close();
	}
	
}
