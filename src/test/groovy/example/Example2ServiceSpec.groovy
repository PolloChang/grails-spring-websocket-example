package example

import grails.testing.services.ServiceUnitTest
import spock.lang.Specification

class Example2ServiceSpec extends Specification implements ServiceUnitTest<Example2Service>{

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
        expect:"fix me"
            true == false
    }
}
