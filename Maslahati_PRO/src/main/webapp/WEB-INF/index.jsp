<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String lang = request.getParameter("lang");
    if(lang == null) { lang = "ar"; }

    // النصوص حسب اللغة
    String pageTitle = lang.equals("en") ? "Craftsmen Market - Home" : "سوق الصنايعية - الصفحة الرئيسية";
    String heroTitle = lang.equals("en") ? "Find the best craftsmen in your area" : "ابحث عن أفضل الصنايعية في منطقتك";
    String heroSubtitle = lang.equals("en") ? "A trusted platform connecting you with skilled artisans" : "منصة موثوقة تربطك بأمهر الحرفيين والصنايعية المحترفين";

    String sliderUsers = lang.equals("en") ? "Number of users searching for service" : "عدد الأشخاص الباحثين عن خدمة";
    String sliderWorkers = lang.equals("en") ? "Number of craftsmen offering services" : "عدد الصنايعية المنشورين خدماتهم";
    String sliderActive = lang.equals("en") ? "Number of active craftsmen" : "عدد الصنايعية النشطين";

    String step1Title = lang.equals("en") ? "Choose specialization" : "اختر التخصص";
    String step1Desc = lang.equals("en") ? "Select the type of service you need from the available list" : "حدد نوع الخدمة التي تحتاجها من قائمة التخصصات المتاحة";
    String step2Title = lang.equals("en") ? "Book a craftsman" : "احجز صنايعي";
    String step2Desc = lang.equals("en") ? "Choose the right craftsman based on ratings and experience" : "اختر الصنايعي المناسب بناءً على التقييمات والخبرة";
    String step3Title = lang.equals("en") ? "Contact directly" : "تواصل مباشرة";
    String step3Desc = lang.equals("en") ? "Communicate with the craftsman and schedule work" : "تواصل مع الصنايعي وحدد موعد بدء العمل";

    String accountTitle = lang.equals("en") ? "Choose Account Type" : "اختر نوع الحساب";
    String accountDesc = lang.equals("en") ? "Select the account type that suits your needs" : "حدد نوع الحساب الذي يناسب احتياجاتك";

    String userCardTitle = lang.equals("en") ? "User looking for a craftsman" : "مستخدم يبحث عن صنايعي";
    String userCardDesc = lang.equals("en") ? "If you are looking for professional craftsmen services, sign up as a user and start searching for the right service" : "إذا كنت تبحث عن خدمات الصنايعية والحرفيين المحترفين، سجل كمستخدم وابدأ في البحث عن الخدمة المناسبة لك";
    String userButton = lang.equals("en") ? "Sign up as User" : "تسجيل كمستخدم";

    String workerCardTitle = lang.equals("en") ? "Craftsman offering services" : "صنايعي يقدم خدماته";
    String workerCardDesc = lang.equals("en") ? "If you are a professional craftsman and want more clients, sign up and showcase your skills" : "إذا كنت صنايعي محترف وتريد الحصول على المزيد من العملاء، سجل كصنايعي واعرض خدماتك ومهاراتك";
    String workerButton = lang.equals("en") ? "Sign up as Craftsman" : "تسجيل كصنايعي";
%>

<!DOCTYPE html>
<html lang="<%= lang %>" dir="<%= lang.equals("ar") ? "rtl" : "ltr" %>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= pageTitle %></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>body { font-family: 'Cairo', sans-serif; }</style>
</head>
<body class="bg-gray-50">

<!-- Include Header -->
<jsp:include page="includes/header.jsp" />

<!-- Language Switcher -->
<div class="flex justify-end gap-4 p-4">
    <a href="?lang=ar" class="px-3 py-1 bg-blue-500 text-white rounded">العربية</a>
    <a href="?lang=en" class="px-3 py-1 bg-gray-200 rounded">English</a>
</div>

<!-- Hero Section -->
<div class="relative h-[600px] overflow-hidden">
    <div class="absolute inset-0">
        <img src="https://images.unsplash.com/photo-1707064892275-a3088e8240be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
             alt="Hero" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/40 to-black/30"></div>
    </div>
    <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-full flex flex-col justify-center items-center text-center">
        <h1 class="text-white text-5xl font-bold mb-6 max-w-3xl"><%= heroTitle %></h1>
        <p class="text-white/90 text-xl mb-10 max-w-2xl"><%= heroSubtitle %></p>

        <!-- ===== Slider Section ===== -->
        <div class="w-full max-w-3xl overflow-hidden rounded-2xl shadow-2xl mx-auto mb-6">
            <div id="slider" class="flex transition-transform duration-700">
                <div class="min-w-full bg-blue-600 p-10 text-center text-white rounded-2xl">
                    <h2 class="text-3xl font-bold mb-3"><%= sliderUsers %></h2>
                    <p id="usersCount" class="text-6xl font-extrabold">0</p>
                </div>
                <div class="min-w-full bg-green-600 p-10 text-center text-white rounded-2xl">
                    <h2 class="text-3xl font-bold mb-3"><%= sliderWorkers %></h2>
                    <p id="workersCount" class="text-6xl font-extrabold">0</p>
                </div>
            </div>
        </div>

        <!-- Active Workers Box -->
        <div class="w-full max-w-3xl mx-auto">
            <div class="bg-yellow-400 text-gray-900 rounded-2xl p-8 text-center shadow-xl">
                <h3 class="text-2xl font-bold mb-2"><%= sliderActive %></h3>
                <p id="activeWorkersCount" class="text-5xl font-extrabold">0</p>
            </div>
        </div>
    </div>
</div>

<!-- How It Works -->
<div id="a" class="bg-gray-50 py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold mb-4"><%= step1Title %></h2>
            <p class="text-gray-600 text-lg"><%= step1Desc %></p>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-2xl p-8 shadow-md hover:shadow-xl transition-shadow">
                <div class="w-16 h-16 bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl flex items-center justify-center mb-6 mr-auto">
                    <span class="text-white text-2xl font-bold">1</span>
                </div>
                <h3 class="text-2xl font-semibold mb-3"><%= step1Title %></h3>
                <p class="text-gray-600 leading-relaxed"><%= step1Desc %></p>
            </div>
            <div class="bg-white rounded-2xl p-8 shadow-md hover:shadow-xl transition-shadow">
                <div class="w-16 h-16 bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl flex items-center justify-center mb-6 mr-auto">
                    <span class="text-white text-2xl font-bold">2</span>
                </div>
                <h3 class="text-2xl font-semibold mb-3"><%= step2Title %></h3>
                <p class="text-gray-600 leading-relaxed"><%= step2Desc %></p>
            </div>
            <div class="bg-white rounded-2xl p-8 shadow-md hover:shadow-xl transition-shadow">
                <div class="w-16 h-16 bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl flex items-center justify-center mb-6 mr-auto">
                    <span class="text-white text-2xl font-bold">3</span>
                </div>
                <h3 class="text-2xl font-semibold mb-3"><%= step3Title %></h3>
                <p class="text-gray-600 leading-relaxed"><%= step3Desc %></p>
            </div>
        </div>
    </div>
</div>

<!-- Choose the Right Account -->
<main id="shoce" class="min-h-[calc(100vh-5rem)] bg-gradient-to-br from-gray-50 to-gray-100 py-20">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h1 class="text-5xl font-bold mb-4"><%= accountTitle %></h1>
            <p class="text-gray-600 text-xl"><%= accountDesc %></p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-5xl mx-auto">
            <!-- User Card -->
            <div class="bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 group">
                <div class="h-64 rounded-2xl overflow-hidden mb-6">
                    <img src="https://images.unsplash.com/photo-1636414722386-a73bd3fc368c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
                         alt="User" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300" />
                </div>
                <div class="flex items-center gap-4 mb-4">
                    <div class="w-16 h-16 bg-[#2563eb]/10 rounded-2xl flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold"><%= userCardTitle %></h3>
                </div>
                <p class="text-gray-600 mb-6 leading-relaxed"><%= userCardDesc %></p>
                <a href="/signup?t=false" class="block w-full bg-[#2563eb] text-white py-4 rounded-xl hover:bg-[#1d4ed8] transition-colors text-center font-semibold"><%= userButton %></a>
            </div>

            <!-- Worker Card -->
            <div class="bg-white rounded-3xl p-8 shadow-xl hover:shadow-2xl transition-all duration-300 hover:-translate-y-2 group">
                <div class="h-64 rounded-2xl overflow-hidden mb-6">
                    <img src="https://images.unsplash.com/photo-1556157382-97eda2d62296?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
                         alt="Worker" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-300" />
                </div>
                <div class="flex items-center gap-4 mb-4">
                    <div class="w-16 h-16 bg-[#fbbf24]/10 rounded-2xl flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#fbbf24]">
                            <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
                        </svg>
                    </div>
                    <h3 class="text-2xl font-semibold"><%= workerCardTitle %></h3>
                </div>
                <p class="text-gray-600 mb-6 leading-relaxed"><%= workerCardDesc %></p>
                <a href="/signup?t=true" class="block w-full bg-[#fbbf24] text-gray-900 py-4 rounded-xl hover:bg-[#f59e0b] transition-colors text-center font-semibold"><%= workerButton %></a>
            </div>
        </div>
    </div>
</main>

<jsp:include page="includes/footer.jsp" />

<!-- Slider Script -->
<script>
    const slider = document.getElementById("slider");
    let index = 0;

    const usersCountFinal = 115;
    const workersCountFinal = 85;
    const activeWorkersCountFinal = 78;

    const usersCountEl = document.getElementById("usersCount");
    const workersCountEl = document.getElementById("workersCount");
    const activeWorkersCountEl = document.getElementById("activeWorkersCount");

    function animateCounter(element, finalNumber, duration = 1500) {
        let start = 0;
        const increment = finalNumber / (duration / 30);
        const counterInterval = setInterval(() => {
            start += increment;
            if(start >= finalNumber){
                start = finalNumber;
                clearInterval(counterInterval);
            }
            element.textContent = Math.floor(start);
        }, 30);
    }

    function showSlide(idx) {
        slider.style.transform = `translateX(-${idx * 100}%)`;
        if(idx === 0) animateCounter(usersCountEl, usersCountFinal);
        if(idx === 1) animateCounter(workersCountEl, workersCountFinal);
    }

    function animateActiveWorkers() {
        animateCounter(activeWorkersCountEl, activeWorkersCountFinal);
    }

    showSlide(index);
    animateActiveWorkers();

    setInterval(() => {
        index = (index + 1) % 2;
        showSlide(index);
        animateActiveWorkers();
    }, 3000);
</script>

</body>
</html>
