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
	
	//ajax�ݹ���÷�ʽ
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
	
	//ÿ�δ���һ��iframe
	@RequestMapping("/iframeLong")
	public String iframeLongIndex(){
		return "iframeLong";
	}
	
	//iframe �ݹ���÷�ʽ
	@RequestMapping("/iframeLongRecursion")
	public String iframeLongRecursionIndex(){
		return "iframeLongRecursion";
	}
	
	
	@RequestMapping("/conn/ajax")
	public void ajax(long timed, HttpServletResponse response) throws Exception {
	     PrintWriter writer = response.getWriter();
	     
	     Random rand = new Random();
	     // ��ѭ�� ��ѯ�������ݱ仯
	     while (true) {
	         Thread.sleep(300); // ����300���룬ģ�⴦��ҵ���
	         int i = rand.nextInt(100); // ����һ��0-100֮��������
	         if (i > 20 && i < 56) { // ����������20-56֮�����Ϊ��Ч���ݣ�ģ�����ݷ����仯
	             long responseTime = System.currentTimeMillis();
	             // ����������Ϣ������ʱ�䡢��������ʱ�䡢��ʱ
	             writer.print("result: " + i + ", response time: " + responseTime + ", request time: " + timed + ", use time: " + (responseTime - timed));
	             break; // ����ѭ������������
	         } else { // ģ��û�����ݱ仯�������� holdס����
	             Thread.sleep(1300);
	         }
	     }
	     
	}
}
