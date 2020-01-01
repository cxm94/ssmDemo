package min.spring.activemq.jms;

public interface ProducerService {
	
	public void sendQueueMessage(String message);
	
	public void sendTopicMessage(String message);
}
