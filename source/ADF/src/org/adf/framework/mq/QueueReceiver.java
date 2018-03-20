package org.adf.framework.mq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

@SuppressWarnings("all")
public class QueueReceiver implements MessageListener {

	@Override
    public void onMessage(Message message) {
        try {
            System.out.println("QueueReceiver:" + ((TextMessage)message).getText());
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
	
}
