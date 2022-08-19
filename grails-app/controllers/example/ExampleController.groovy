package example

import grails.converters.JSON
import org.springframework.http.HttpStatus
import org.springframework.messaging.handler.annotation.MessageMapping
import org.springframework.messaging.handler.annotation.SendTo

class ExampleController {

    ExampleService exampleService
    Example2Service example2Service

    def index() {}

    def server(){
    }

    @MessageMapping("/helloInController")
    @SendTo("/topic/hello")
    protected String hello(String world) {
        return "hello, ${world}!"
    }

    JSON sentFormService(){
        LinkedHashMap result = [:]
        exampleService.hello()

        render status: HttpStatus.OK,text: result as JSON, contentType: 'application/json'
    }

    JSON sentFormService2(){
        LinkedHashMap result = [:]
        example2Service.hello()

        render status: HttpStatus.OK,text: result as JSON, contentType: 'application/json'
    }



    JSON sentToHelloDiv2(){
        LinkedHashMap result = [:]
        example2Service.sentToHelloDiv2()

        render status: HttpStatus.OK,text: result as JSON, contentType: 'application/json'
    }
}
