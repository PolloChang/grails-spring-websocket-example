package example

import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo

class ExampleWebSocket {
    @MessageMapping("/hello")
    @SendTo("/topic/hello")
    String hello(String world) {
        return "hello, ${world}!"
    }
}
