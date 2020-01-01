package min.spring.activemq.jms;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class ProducerServiceImpl implements ProducerService{
	
	@Autowired
	JmsTemplate jmsTemplate;
	
	@Resource(name="queueDestination")
	Destination queueDestination;
	
	@Override
	public void sendQueueMessage(String message) {
		jmsTemplate.send(queueDestination, new MessageCreator() {
			
			@Override
			public Message createMessage(Session session) throws JMSException {
				TextMessage textMessage = session.createTextMessage(message);
				return textMessage;
			}
		});
		System.out.println("发送的消息为："+message);
		
	}
	
	@Resource(name="topicDestination")
	Destination topicDestination;
	
	@Override
	public void sendTopicMessage(String message) {
		
		jmsTemplate.send(topicDestination, new MessageCreator() {
			
			@Override
			public Message createMessage(Session session) throws JMSException {
				TextMessage textMessage = session.createTextMessage(message);
				return textMessage;
			}
		});
		System.out.println("发送的消息为："+message);
		
	}

}
