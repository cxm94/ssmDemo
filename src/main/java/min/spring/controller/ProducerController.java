package min.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import min.spring.activemq.jms.ProducerService;

@Controller
public class ProducerController {
	
//	@Autowired
//	private ProducerService producerService;
//	
//	@RequestMapping("/sendQueueMessage")
//	@ResponseBody
//	public String sendQueueMessage() {
//		for (int i = 0; i < 10; i++) {
//			producerService.sendQueueMessage("队列：明天会更好"+i);
//		}
//		return null;
//	}
//	
//	@RequestMapping("/sendTopicMessage")
//	@ResponseBody
//	public String sendTopicMessage() {
//		for (int i = 0; i < 10; i++) {
//			producerService.sendTopicMessage("订阅：明天会更好"+i);
//		}
//		return null;
//	}
	
}
