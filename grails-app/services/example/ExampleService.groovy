package example

import grails.gorm.transactions.Transactional
import grails.plugin.springwebsocket.WebSocket

@Transactional
class ExampleService implements WebSocket {

    void hello() {
        convertAndSend "/topic/hello", "hello from service!"
    }
}
