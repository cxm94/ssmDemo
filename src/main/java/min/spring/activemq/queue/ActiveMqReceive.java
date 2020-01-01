package min.spring.activemq.queue;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnectionFactory;

public class ActiveMqReceive {
	
//	private static  final String url = "tcp://192.168.1.137:61616";
	private static  final String url = "failover:(tcp://192.168.1.137:61617,tcp://192.168.1.137:61618,tcp://192.168.1.137:61619)?randomize=true";
	private static  final String queueName = "queue-test";
	
	
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
			//5、.创建目标
			Destination destination = session.createQueue(queueName);
			//6、创建消费者
			MessageConsumer  messageConsumer = session.createConsumer(destination);
			//7.创建一个监听器
			messageConsumer.setMessageListener(new MessageListener() {
				
				@Override
				public void onMessage(Message message) {
					try {
						TextMessage textMessage = (TextMessage)message;
						System.out.println("获取消息："+textMessage.getText());
					} catch (JMSException e) {
						e.printStackTrace();
					}
				}
			});
			
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
