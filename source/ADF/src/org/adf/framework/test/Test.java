package org.adf.framework.test;

import org.adf.framework.mq.QueueSender;
import org.adf.framework.mq.TopicSender;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SuppressWarnings("all")
public class Test {

	public static void main(String[] args) {
		System.out.println("ADF");
		
//		String[] springConfigFiles = new String[] {"/applicationContext.xml","/applicationContext-mybatis.xml","/applicationContext-mq.xml"};
//		
//		ApplicationContext context = new ClassPathXmlApplicationContext(springConfigFiles);
//		
//		QueueSender queueSender = (QueueSender)context.getBean("queueSender");
//		
//		TopicSender topicSender = (TopicSender)context.getBean("topicSender");
//		
//		for(int i=1; i<=10; i++) {
//			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
//			xml += "<persons>";
//			xml += "<person><id>" + i + "</id><name>" + i + "</name></person>";
//			xml += "</persons>";
//			
//			queueSender.send("adf.queue.test", xml);
//		}
//		
//		for(int i=1; i<=10; i++) {
//			String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
//			xml += "<persons>";
//			xml += "<person><id>" + i + "</id><name>" + i + "</name></person>";
//			xml += "</persons>";
//			
//			topicSender.send("adf.topic.test", xml);
//		}
	}

}
