<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title>Chatbot</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">

<div class="max-w-xl mx-auto bg-white p-6 rounded shadow">
    <h1 class="text-2xl font-bold mb-4">Chatbot</h1>
    <div id="chatBox" class="border p-3 h-64 overflow-auto mb-4"></div>
    <input id="messageInput" type="text" class="border p-2 w-full" placeholder="اكتب رسالتك...">
    <button onclick="sendMessage()" class="bg-blue-500 text-white px-4 py-2 mt-2 rounded">ارسال</button>
</div>

<script>
    const chatBox = document.getElementById('chatBox');
    const messageInput = document.getElementById('messageInput');

    function sendMessage() {
        const msg = messageInput.value.trim();
        if (!msg) return;

        appendMessage('انت: ' + msg);
        messageInput.value = '';

        fetch('/api/chatbot', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({message: msg})
        })
            .then(res => res.text())
            .then(data => appendMessage(data))
            .catch(err => appendMessage('خطأ: ' + err));
    }

    function appendMessage(msg) {
        chatBox.innerHTML += '<div>' + msg + '</div>';
        chatBox.scrollTop = chatBox.scrollHeight;
    }
</script>

</body>
</html>
