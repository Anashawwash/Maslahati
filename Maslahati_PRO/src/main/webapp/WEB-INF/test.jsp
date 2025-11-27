<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Maslahati | Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function sendRequest() {
            const name = document.getElementById("name").value;
            fetch('/api/try?name=' + name)
                .then(response => response.json())
                .then(data => {
                    document.getElementById("result").innerText = data.status;
                })
                .catch(error => console.error('Error:', error));
        }
    </script>
</head>
<body class="bg-gray-50">


<input type="text" id="name" placeholder="Enter your name">
<button onclick="sendRequest()">Say Hello</button>
<p id="result"></p>
</body>
</html>
