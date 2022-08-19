<%--
  Created by IntelliJ IDEA.
  User: jameschang
  Date: 8/18/22
  Time: 4:45 PM
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

            client.connect({}, function() {
                client.subscribe("/topic/hello", function(message) {
                    jQuery("#helloDiv").append(message.body);
                });

                client.subscribe("/topic/helloDiv2", function(message) {
                    jQuery("#helloDiv2").append(message.body);
                });
            });
        });
    </script>
</head>
<body>
<h1>前端測試區</h1>
<div>
    <h2>helloDiv 測試訊息：</h2>
    <div id="helloDiv"></div>
</div>
<div>
    <h2>helloDiv2 測試訊息：</h2>
    <div id="helloDiv2"></div>
</div>

</body>
</html>