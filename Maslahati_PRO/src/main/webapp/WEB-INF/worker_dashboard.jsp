<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>Craftsman Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<div class="bg-gray-100 flex" dir="rtl">

    <!-- Sidebar -->
    <div class="w-64 h-screen bg-blue-900 text-white flex flex-col p-6">
        <h2 id="sidebar-title" class="text-2xl font-bold mb-10">🛠️ لوحة الحرفي</h2>

        <!-- Language Selector -->
        <select id="langSelect" class="mb-6 text-black rounded px-2 py-1 w-full">
            <option value="ar">العربية</option>
            <option value="en">English</option>
        </select>

        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" id="editProfile" href="#">تعديل الملف الشخصي</a>
        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" id="viewRequests" href="/servreq">عرض الطلبات</a>
        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" id="ratings" href="/comments">التقييمات</a>
        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" id="addService" href="/addservice">إضافة خدمة جديدة</a>

        <div class="mt-auto">
            <a class="py-2 mt-20 hover:bg-red-600 bg-red-500 text-center rounded block" id="logout" href="/logout">تسجيل الخروج</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="flex-1 p-10">
        <h1 class="text-3xl font-bold mb-3">
            <span id="welcomeMsg">مرحبًا</span>، <span class="text-blue-700">${worker.userName}</span>
        </h1>
        <p class="text-gray-600 mb-8" id="overviewMsg">هنا نظرة عامة على مهاراتك المهنية</p>

        <div class="bg-white rounded-xl shadow p-6 mb-10">
            <h2 class="text-xl font-bold mb-4" id="personalInfoTitle">معلوماتك الشخصية</h2>
            <div class="grid grid-cols-2 gap-6">
                <p><span id="nameLabel" class="font-medium">الاسم:</span> ${worker.userName}</p>
                <p><span id="emailLabel" class="font-medium">البريد الإلكتروني:</span> ${worker.email}</p>
                <p><span id="servicesLabel" class="font-medium">عدد الخدمات المقدمة:</span> ${many}</p>
                <p><span id="experienceLabel" class="font-medium">الخبرة: ${worker.experience}</span> سنوات</p>
            </div>
        </div>

        <div class="grid grid-cols-3 gap-6">
            <div class="bg-white shadow rounded-xl p-6 text-center">
                <h3 class="text-lg font-bold text-gray-700" id="overallRating">التقييم العام</h3>
                <p class="text-4xl font-extrabold text-yellow-500 mt-3"> ${worker.averageRating}</p>
            </div>
            <div class="bg-white shadow rounded-xl p-6 text-center">
                <h3 class="text-lg font-bold text-gray-700" id="completedOrders">الطلبات المكتملة</h3>
                <p class="text-4xl font-extrabold text-green-600 mt-3">${worker.orderes}</p>
            </div>
        </div>
    </div>
</div>

<!-- Include Footer -->
<jsp:include page="includes/footer.jsp" />

<script>
    const translations = {
        ar: {
            sidebarTitle: "🛠️ لوحة الحرفي",
            editProfile: "تعديل الملف الشخصي",
            viewRequests: "عرض الطلبات",
            ratings: "التقييمات",
            addService: "إضافة خدمة جديدة",
            logout: "تسجيل الخروج",
            welcome: "مرحبًا",
            overview: "هنا نظرة عامة على مهاراتك المهنية",
            personalInfo: "معلوماتك الشخصية",
            name: "الاسم:",
            email: "البريد الإلكتروني:",
            services: "عدد الخدمات المقدمة:",
            experience: "الخبرة:",
            totalClients: "إجمالي المستخدمين المخدومين",
            overallRating: "التقييم العام",
            completedOrders: "الطلبات المكتملة"
        },
        en: {
            sidebarTitle: "🛠️ Craftsman Dashboard",
            editProfile: "Edit Profile",
            viewRequests: "View Requests",
            ratings: "Ratings",
            addService: "Add New Service",
            logout: "Logout",
            welcome: "Welcome",
            overview: "Here is an overview of your professional skills",
            personalInfo: "Personal Information",
            name: "Name:",
            email: "Email:",
            services: "Services Provided:",
            experience: "Experience:",
            totalClients: "Total Clients Served",
            overallRating: "Overall Rating",
            completedOrders: "Completed Orders"
        }
    };

    const langSelect = document.getElementById("langSelect");

    langSelect.addEventListener("change", function() {
        const lang = this.value;
        const t = translations[lang];

        document.getElementById("sidebar-title").innerText = t.sidebarTitle;
        document.getElementById("editProfile").innerText = t.editProfile;
        document.getElementById("viewRequests").innerText = t.viewRequests;
        document.getElementById("ratings").innerText = t.ratings;
        document.getElementById("addService").innerText = t.addService;
        document.getElementById("logout").innerText = t.logout;
        document.getElementById("welcomeMsg").innerText = t.welcome;
        document.getElementById("overviewMsg").innerText = t.overview;
        document.getElementById("personalInfoTitle").innerText = t.personalInfo;
        document.getElementById("nameLabel").innerText = t.name;
        document.getElementById("emailLabel").innerText = t.email;
        document.getElementById("servicesLabel").innerText = t.services;
        document.getElementById("experienceLabel").innerText = t.experience;
        document.getElementById("totalClients").innerText = t.totalClients;
        document.getElementById("overallRating").innerText = t.overallRating;
        document.getElementById("completedOrders").innerText = t.completedOrders;

        // Adjust text direction
        document.querySelector("body > div").setAttribute("dir", lang === "en" ? "ltr" : "rtl");
    });
</script>
</html>
