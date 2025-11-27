<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>سوق الصنايعية - اختر نوع الحساب</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Cairo', sans-serif; }
    </style>
</head>
<body class="bg-gray-50">
<jsp:include page="includes/header.jsp" />
<header class="bg-white shadow-md p-4">
    <div class="max-w-6xl mx-auto text-center">
        <h1 class="text-3xl font-bold">سوق الصنايعية</h1>
    </div>
</header>

<main class="min-h-[calc(100vh-5rem)] bg-gradient-to-br from-gray-50 to-gray-100 py-20">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h1 class="text-5xl font-bold mb-4">اختر نوع الحساب</h1>
            <p class="text-gray-600 text-xl">حدد نوع الحساب الذي يناسب احتياجاتك</p>
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
                    <h3 class="text-2xl font-semibold">مستخدم يبحث عن صنايعي</h3>
                </div>

                <p class="text-gray-600 mb-6 leading-relaxed">
                    إذا كنت تبحث عن خدمات الصنايعية والحرفيين المحترفين، سجل كمستخدم وابدأ في البحث عن الخدمة المناسبة لك
                </p>

                <a href="#" class="block w-full bg-[#2563eb] text-white py-4 rounded-xl hover:bg-[#1d4ed8] transition-colors text-center font-semibold">
                    تسجيل كمستخدم
                </a>
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
                    <h3 class="text-2xl font-semibold">صنايعي يقدم خدماته</h3>
                </div>

                <p class="text-gray-600 mb-6 leading-relaxed">
                    إذا كنت صنايعي محترف وتريد الحصول على المزيد من العملاء، سجل كصنايعي واعرض خدماتك ومهاراتك
                </p>

                <a href="#" class="block w-full bg-[#fbbf24] text-gray-900 py-4 rounded-xl hover:bg-[#f59e0b] transition-colors text-center font-semibold">
                    تسجيل كصنايعي
                </a>
            </div>
        </div>
    </div>
</main>

<footer>
    <jsp:include page="includes/footer.jsp" />
</footer>

</body>
</html>
