<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>سوق الصنايعية - الصفحة الرئيسية</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Cairo', sans-serif; }
    </style>
</head>
<body class="bg-gray-50">

<!-- Include Header -->
<jsp:include page="includes/header.jsp" />

<!-- Hero Section -->
<div class="relative h-[600px] overflow-hidden">
    <div class="absolute inset-0">
        <img src="https://images.unsplash.com/photo-1707064892275-a3088e8240be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=1080"
             alt="Hero" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/40 to-black/30"></div>
    </div>
    <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-full flex flex-col justify-center items-center text-center">
        <h1 class="text-white text-5xl font-bold mb-6 max-w-3xl">
            ابحث عن أفضل الصنايعية في منطقتك
        </h1>
        <p class="text-white/90 text-xl mb-10 max-w-2xl">
            منصة موثوقة تربطك بأمهر الحرفيين والصنايعية المحترفين
        </p>

        <!-- Search Bar -->
        <div class="w-full max-w-4xl bg-white rounded-2xl shadow-2xl p-3 flex gap-2">
            <a href="workers-list.jsp" class="bg-[#2563eb] text-white px-8 py-4 rounded-xl hover:bg-[#1d4ed8] transition-colors flex items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"/>
                    <path d="m21 21-4.3-4.3"/>
                </svg>
                <span>بحث</span>
            </a>
            <div class="flex-1 flex items-center gap-3 px-4 border-l-2 border-gray-200">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-400">
                    <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/>
                    <circle cx="12" cy="10" r="3"/>
                </svg>
                <input type="text" placeholder="أدخل موقعك" class="flex-1 outline-none text-right" />
            </div>
            <div class="flex-1 flex items-center gap-3 px-4">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-gray-400">
                    <path d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.77-3.77a6 6 0 0 1-7.94 7.94l-6.91 6.91a2.12 2.12 0 0 1-3-3l6.91-6.91a6 6 0 0 1 7.94-7.94l-3.76 3.76z"/>
                </svg>
                <select class="flex-1 outline-none text-right cursor-pointer bg-transparent">
                    <option>اختر التخصص</option>
                    <option>سباك</option>
                    <option>كهربائي</option>
                    <option>نجار</option>
                    <option>دهان</option>
                    <option>حداد</option>
                </select>
            </div>
        </div>
    </div>
</div>



<!-- How It Works -->
<div id="a" class="bg-gray-50 py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold mb-4">كيف يعمل الموقع</h2>
            <p class="text-gray-600 text-lg">ثلاث خطوات بسيطة للوصول إلى أفضل الصنايعية</p>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white rounded-2xl p-8 shadow-md hover:shadow-xl transition-shadow">
                <div class="w-16 h-16 bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl flex items-center justify-center mb-6 mr-auto">
                    <span class="text-white text-2xl font-bold">١</span>
                </div>
                <h3 class="text-2xl font-semibold mb-3">اختر التخصص</h3>
                <p class="text-gray-600 leading-relaxed">حدد نوع الخدمة التي تحتاجها من قائمة التخصصات المتاحة</p>
            </div>
            <div class="bg-white rounded-2xl p-8 shadow-md hover:shadow-xl transition-shadow">
                <div class="w-16 h-16 bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl flex items-center justify-center mb-6 mr-auto">
                    <span class="text-white text-2xl font-bold">٢</span>
                </div>
                <h3 class="text-2xl font-semibold mb-3">احجز صنايعي</h3>
                <p class="text-gray-600 leading-relaxed">اختر الصنايعي المناسب بناءً على التقييمات والخبرة</p>
            </div>
            <div class="bg-white rounded-2xl p-8 shadow-md hover:shadow-xl transition-shadow">
                <div class="w-16 h-16 bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl flex items-center justify-center mb-6 mr-auto">
                    <span class="text-white text-2xl font-bold">٣</span>
                </div>
                <h3 class="text-2xl font-semibold mb-3">تواصل مباشرة</h3>
                <p class="text-gray-600 leading-relaxed">تواصل مع الصنايعي وحدد موعد بدء العمل</p>
            </div>
        </div>
    </div>
</div>

<%--shoce the right account for you --%>
<main id="shoce" class="min-h-[calc(100vh-5rem)] bg-gradient-to-br from-gray-50 to-gray-100 py-20">
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

                <a href="/signup?t=false" class="block w-full bg-[#2563eb] text-white py-4 rounded-xl hover:bg-[#1d4ed8] transition-colors text-center font-semibold">
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

                <a href="/signup?t=true" class="block w-full bg-[#fbbf24] text-gray-900 py-4 rounded-xl hover:bg-[#f59e0b] transition-colors text-center font-semibold">
                    تسجيل كصنايعي
                </a>
            </div>
        </div>
    </div>
</main>
<!-- Include Footer -->
<jsp:include page="includes/footer.jsp" />

</body>
</html>
