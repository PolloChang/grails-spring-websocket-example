<%--
  Created by IntelliJ IDEA.
  User: jameschang
  Date: 8/18/22
  Time: 5:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

    <asset:javascript src="application" />
    <asset:javascript src="spring-websocket" />

    <script type="text/javascript">
        jQuery(function() {
            let socket = new SockJS("${createLink(uri: '/stomp')}");
            let client = webstomp.over(socket);

            jQuery("#helloWebSocket").click(function() {
                client.send("/app/helloWebSocket", JSON.stringify("WebSocket"));
            });
            jQuery("#helloInController").click(function() {
                client.send("/app/helloInController", JSON.stringify("Controller"));
            });

            jQuery("#helloInServer").click(function() {
                sentMessageFromService('${createLink(controller: 'example',action: 'sentFormService')}');
            });

            jQuery("#helloInServer2").click(function() {
                sentMessageFromService('${createLink(controller: 'example',action: 'sentFormService2')}');
            });

            jQuery("#helloDiv2").click(function() {
                sentMessageFromService('${createLink(controller: 'example',action: 'sentToHelloDiv2')}');
            });
        });


        function sentMessageFromService(url){

            jQuery.ajax({
                url: url,
                type: 'POST',
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function (json) {
                    console.log(json)
                }
            });
        }


    </script>
</head>
<body>
<button id="helloWebSocket">helloInWebSocket</button>
<button id="helloInController">helloInController</button>
<button id="helloInServer">helloInServer</button>
<button id="helloInServer2">helloInServer2</button>
<button id="helloDiv2">傳送訊息給 hello Div2 </button>
</body>
</html>