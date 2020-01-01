package min.spring.activemq.topic;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

public class ActiveMqTopicSend {
	
	private static  final String url = "tcp://192.168.1.137:61616";
	private static  final String topicName = "topic-test";
	
	public static void main(String[] args) {
		//1.创建ConnectionFactory
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url);
		Connection connection = null;
		try {
			//2.创建连接
			connection =  connectionFactory.createConnection();
			//3.开启连接
			connection.start();
			//4、创建会话
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			//5、.创建主题
			Destination destination = session.createTopic(topicName);
			//6、.创建生产者
			MessageProducer messageProducer = session.createProducer(destination);
			//7.发送消息
			for (int i = 1; i <= 20; i++) {
				TextMessage message = session.createTextMessage("发送消息"+i);
				System.out.println("发送消息"+i);
				messageProducer.send(message);
			}
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//8、关闭连接
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (JMSException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
