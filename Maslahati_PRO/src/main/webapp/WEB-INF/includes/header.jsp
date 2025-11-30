<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String lang = request.getParameter("lang");
    if(lang == null) { lang = "ar"; }

    String homeText = lang.equals("en") ? "Home" : "الرئيسية";
    String loginText = lang.equals("en") ? "Login" : "تسجيل الدخول";
    String signupText = lang.equals("en") ? "Sign Up" : "تسجيل حساب";
    String logoText = lang.equals("en") ? "Moslahati" : "مصلحاتي";
%>

<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <!-- Navigation -->
            <nav class="flex gap-8 items-center">
                <a href="/homepage?lang=<%=lang%>" class="hover:underline hover:text-blue-600 nav-link"><%= homeText %></a>
                <a href="/login?lang=<%=lang%>" class="nav-link"><%= loginText %></a>
                <a href="/#shoce?lang=<%=lang%>" class="nav-link"><%= signupText %></a>
                <!-- Language Switcher -->
                <div class="ml-6 flex gap-2">
                    <a href="?lang=ar" class="text-sm font-semibold hover:underline">عربي</a>
                    <a href="?lang=en" class="text-sm font-semibold hover:underline">English</a>
                </div>
            </nav>

            <!-- Logo -->
            <a href="index.jsp?lang=<%=lang%>" class="flex items-center gap-3 hover:opacity-80 transition-opacity">
                <span class="text-xl font-bold text-gray-900"><%= logoText %></span>
                <div class="w-12 h-12 bg-[#2563eb] rounded-full flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-white">
                        <path d="m15 12-8.5 8.5c-.83.83-2.17.83-3 0 0 0 0 0 0 0a2.12 2.12 0 0 1 0-3L12 9"/>
                        <path d="M17.64 15 22 10.64"/>
                        <path d="m20.91 11.7-1.25-1.25c-.6-.6-.93-1.4-.93-2.25v-.86L16.01 4.6a5.56 5.56 0 0 0-3.94-1.64H9l.92.82A6.18 6.18 0 0 1 12 8.4v1.56l2 2h2.47l2.26 1.91"/>
                    </svg>
                </div>
            </a>
        </div>
    </div>
</header>

<!-- Chatbot Box -->
<div id="chatbot-container">
    <div id="chatbot-header">💬 مساعدة</div>
    <div id="chat"></div>
    <input id="chat-message" type="text" placeholder="اكتب رسالتك...">
    <button id="chat-send">ارسال</button>
</div>

<style>
    #chatbot-container { position: fixed; bottom: 20px; right: 20px; width: 300px; font-family: Arial; z-index:1000; }
    #chatbot-header { background-color: #007bff; color:white; padding:10px; border-radius:10px 10px 0 0; cursor:pointer; text-align:center; }
    #chat { border:1px solid #ccc; height:250px; overflow-y:auto; background:#f9f9f9; padding:10px; display:block; }
    #chat-message { width:70%; padding:5px; margin-top:5px; }
    #chat-send { width:25%; padding:5px; margin-top:5px; }
</style>

<script>
    const headerBtn = document.getElementById("chatbot-header");
    const chatBox = document.getElementById("chat");
    const input = document.getElementById("chat-message");
    const sendBtn = document.getElementById("chat-send");

    headerBtn.addEventListener("click", () => {
        const visible = chatBox.style.display !== "none";
        chatBox.style.display = visible ? "none" : "block";
        input.style.display = visible ? "none" : "inline-block";
        sendBtn.style.display = visible ? "none" : "inline-block";
    });

    function addMessage(text) {
        const p = document.createElement("p");
        p.textContent = text;
        chatBox.appendChild(p);
        chatBox.scrollTop = chatBox.scrollHeight;
    }

    async function sendMessage() {
        const msg = input.value;
        if(!msg) return;
        addMessage("انت: " + msg);

        try {
            const response = await fetch("/api/chatbot", {
                method:"POST",
                headers:{"Content-Type":"application/json"},
                body:JSON.stringify({ message: msg })
            });
            const data = await response.json();
            addMessage("البوت: " + data.reply);
        } catch(err) {
            addMessage("البوت: حدث خطأ في الاتصال");
        }

        input.value = "";
    }

    sendBtn.addEventListener("click", sendMessage);
    input.addEventListener("keypress", e => { if(e.key === "Enter") sendMessage(); });
</script>
