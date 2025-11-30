<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title>Chatbot</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        .typing-dot {
            display:inline-block;
            width:6px;height:6px;border-radius:50%;
            background:#94a3b8;margin-left:4px;
            animation: blink 1s infinite;
        }
        .typing-dot:nth-child(2){ animation-delay: .2s; }
        .typing-dot:nth-child(3){ animation-delay: .4s; }
        @keyframes blink { 0%{opacity:.2}50%{opacity:1}100%{opacity:.2} }

        .msg-row { margin:8px 0; display:flex; }
        .msg-user { margin-left:auto; background:#dbeafe; padding:8px 12px; border-radius:12px; max-width:80%; word-wrap:break-word; }
        .msg-bot  { margin-right:auto; background:#f1f5f9;  padding:8px 12px; border-radius:12px; max-width:80%; word-wrap:break-word; }
    </style>
</head>
<body class="bg-gray-100 p-8">

<div class="max-w-xl mx-auto bg-white p-6 rounded shadow">
    <h1 class="text-2xl font-bold mb-4">Chatbot</h1>

    <div id="chatBox" class="border p-3 h-64 overflow-auto mb-4 bg-gray-50"></div>

    <input id="messageInput" type="text"
           class="border p-2 w-full"
           placeholder="اكتب رسالتك..."
           onkeypress="if(event.key === 'Enter') sendMessage()">

    <button id="sendBtn" class="bg-blue-500 text-white px-4 py-2 mt-2 rounded">ارسال</button>
</div>

<script>
    (async function() {
        const chatBox = document.getElementById('chatBox');
        const messageInput = document.getElementById('messageInput');
        const sendBtn = document.getElementById('sendBtn');

        function appendUser(msg) {
            const row = document.createElement('div'); row.className = 'msg-row';
            const bubble = document.createElement('div'); bubble.className = 'msg-user'; bubble.innerText = msg;
            row.appendChild(bubble); chatBox.appendChild(row); chatBox.scrollTop = chatBox.scrollHeight;
        }

        function appendBot(msg) {
            const row = document.createElement('div'); row.className = 'msg-row';
            const bubble = document.createElement('div'); bubble.className = 'msg-bot'; bubble.innerText = msg;
            row.appendChild(bubble); chatBox.appendChild(row); chatBox.scrollTop = chatBox.scrollHeight;
        }

        function addTypingIndicator() {
            const row = document.createElement('div'); row.className = 'msg-row'; row.id = 'typing-row';
            const bubble = document.createElement('div'); bubble.className = 'msg-bot';
            bubble.innerHTML = '<span>البوت يكتب</span><span style="display:inline-block;margin-left:8px;"><span class="typing-dot"></span><span class="typing-dot"></span><span class="typing-dot"></span></span>';
            row.appendChild(bubble); chatBox.appendChild(row); chatBox.scrollTop = chatBox.scrollHeight;
        }

        function removeTypingIndicator() {
            const el = document.getElementById('typing-row'); if(el) el.remove();
        }

        function delay(ms) { return new Promise(res => setTimeout(res, ms)); }

        async function sendMessage() {
            const msg = messageInput.value.trim();
            if(!msg) return;
            appendUser(msg);
            messageInput.value = '';
            addTypingIndicator();

            let serverReply = null;
            try {
                const res = await fetch('<%=request.getContextPath()%>/api/chatbot', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ message: msg })
                });

                const ct = res.headers.get('Content-Type') || res.headers.get('content-type') || '';
                if (ct.toLowerCase().includes('application/json')) {
                    const json = await res.json();
                    if (json && typeof json.reply === 'string') serverReply = json.reply;
                    else serverReply = JSON.stringify(json);
                } else {
                    serverReply = await res.text();
                }
            } catch (err) {
                console.error('Fetch error:', err);
                serverReply = null;
            }

            await delay(3000);
            removeTypingIndicator();

            if (serverReply === null || typeof serverReply === 'undefined' || serverReply === '') {
                appendBot('حدث خطأ في الاتصال أو لم يرد السيرفر.');
            } else {
                appendBot(serverReply);
            }
        }

        // روابط الأحداث
        sendBtn.addEventListener('click', sendMessage);
        messageInput.addEventListener('keypress', e => { if(e.key === 'Enter') sendMessage(); });

    })();
</script>

</body>
</html>
