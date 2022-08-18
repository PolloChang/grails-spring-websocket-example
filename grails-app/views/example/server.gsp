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
        $(function() {
            var socket = new SockJS("${createLink(uri: '/stomp')}");
            var client = webstomp.over(socket);

            $("#helloButton").click(function() {
                client.send("/app/hello", JSON.stringify("world"));
            });
        });
    </script>
</head>
<body>
<button id="helloButton">hello</button>
</body>
</html>