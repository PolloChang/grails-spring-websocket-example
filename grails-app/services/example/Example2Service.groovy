package example

import grails.gorm.transactions.Transactional
import org.springframework.messaging.simp.SimpMessageSendingOperations

@Transactional
class Example2Service {

    SimpMessageSendingOperations brokerMessagingTemplate

    void hello() {
        brokerMessagingTemplate.convertAndSend "/topic/hello", "hello from service2!"
    }

    void sentToHelloDiv2() {
        brokerMessagingTemplate.convertAndSend "/topic/helloDiv2", "hello Div2!"
    }
}
