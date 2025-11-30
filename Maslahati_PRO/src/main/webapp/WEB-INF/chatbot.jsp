<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AI Chatbot</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .chat-box {
            height: 500px;
            overflow-y: scroll;
        }
    </style>
</head>

<body class="bg-gray-100">

<div class="max-w-3xl mx-auto mt-10 p-6 bg-white shadow-xl rounded-2xl">
    <h1 class="text-3xl font-bold mb-4 text-center text-blue-700">🤖 Moslehati AI Chatbot</h1>

    <!-- Chat messages -->
    <div id="chatBox" class="chat-box border p-4 rounded-lg bg-gray-50 mb-4"></div>

    <!-- User input -->
    <div class="flex">
        <input id="userMessage" type="text" placeholder="Type your message..."
               class="flex-1 p-3 border rounded-l-lg outline-none">
        <button onclick="sendMessage()"
                class="p-3 bg-blue-600 text-white rounded-r-lg hover:bg-blue-700 transition">
            Send
        </button>
    </div>
</div>

<script>
    function sendMessage() {
        const msg = document.getElementById("userMessage").value;
        if (msg.trim() === "") return;

        // show user message
        appendMessage("user", msg);

        // send to backend
        fetch("/api/chatbot", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({message: msg})
        })
            .then(res => res.text())
            .then(data => {
                appendMessage("bot", data);
            });

        document.getElementById("userMessage").value = "";
    }

    function appendMessage(sender, text) {
        const chatBox = document.getElementById("chatBox");
        const div = document.createElement("div");

        if (sender === "user") {
            div.className = "text-right mb-2";
            div.innerHTML = `<span class="inline-block bg-blue-600 text-white p-2 rounded-lg">${text}</span>`;
        } else {
            div.className = "text-left mb-2";
            div.innerHTML = `<span class="inline-block bg-gray-300 p-2 rounded-lg">${text}</span>`;
        }

        chatBox.appendChild(div);
        chatBox.scrollTop = chatBox.scrollHeight;
    }
</script>

</body>
</html>
