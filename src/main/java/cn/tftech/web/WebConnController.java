package cn.tftech.web;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebConnController {
	
	@RequestMapping(value="/index")
	public String index(){
		System.out.println("index++++++++");
		return "index";
	}
	
	@RequestMapping("/ajax")
	public String ajaxIndex(){
		return "ajax";
	}
	
	//ajax递归调用方式
	@RequestMapping("/ajaxLong")
	public String ajaxLongIndex(){
		return "ajaxLong";
	}
	
	/*
	 * 
	 */
	@RequestMapping("/iframe")
	public String iframeIndex(){
		return "iframe";
	}
	
	//每次创建一个iframe
	@RequestMapping("/iframeLong")
	public String iframeLongIndex(){
		return "iframeLong";
	}
	
	//iframe 递归调用方式
	@RequestMapping("/iframeLongRecursion")
	public String iframeLongRecursionIndex(){
		return "iframeLongRecursion";
	}
	
	
	@RequestMapping("/conn/ajax")
	public void ajax(long timed, HttpServletResponse response) throws Exception {
	     PrintWriter writer = response.getWriter();
	     
	     Random rand = new Random();
	     // 死循环 查询有无数据变化
	     while (true) {
	         Thread.sleep(300); // 休眠300毫秒，模拟处理业务等
	         int i = rand.nextInt(100); // 产生一个0-100之间的随机数
	         if (i > 20 && i < 56) { // 如果随机数在20-56之间就视为有效数据，模拟数据发生变化
	             long responseTime = System.currentTimeMillis();
	             // 返回数据信息，请求时间、返回数据时间、耗时
	             writer.print("result: " + i + ", response time: " + responseTime + ", request time: " + timed + ", use time: " + (responseTime - timed));
	             break; // 跳出循环，返回数据
	         } else { // 模拟没有数据变化，将休眠 hold住连接
	             Thread.sleep(1300);
	         }
	     }
	     
	}
}
