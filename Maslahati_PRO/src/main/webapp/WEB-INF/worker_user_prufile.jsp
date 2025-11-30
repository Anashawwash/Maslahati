<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>سوق الصنايعية - ملف الصنايعي</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Cairo', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-50">
<jsp:include page="includes/header.jsp" />

<div class="bg-gray-50 min-h-screen">
    <!-- Banner -->
    <div class="relative h-80 overflow-hidden">
        <img src="https://images.unsplash.com/photo-1707064892275-a3088e8240be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjcmFmdHNtYW4lMjB3b3JraW5nJTIwY29uc3RydWN0aW9ufGVufDF8fHx8MTc2NDA3MzUxMXww&ixlib=rb-4.1.0&q=80&w=1080" alt="Banner" class="w-full h-full object-cover" />
        <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent"></div>
    </div>

    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 -mt-32 relative z-10">
        <!-- Profile Card -->
        <div class="bg-white rounded-3xl shadow-2xl p-8 mb-8">
            <div class="flex flex-col md:flex-row gap-8">
                <!-- Profile Image -->
                <div class="flex-shrink-0">
                    <div class="w-40 h-40 rounded-3xl overflow-hidden border-4 border-white shadow-xl">
                        <img src="${user.avatar}" alt="${user.userName}" class="w-40 h-40 rounded-3xl object-cover"/>
                    </div>
                </div>

                <!-- Profile Info -->
                <div class="flex-1">
                    <div class="flex flex-wrap items-start justify-between gap-4 mb-4">
                        <div>
                            <h1 class="text-5xl font-bold mb-2">${user.userName}</h1>

                            <div class="flex items-center gap-6 flex-wrap">
                                <div class="flex items-center gap-2">
                                    <div class="flex items-center gap-1 bg-[#fbbf24] text-gray-900 px-3 py-1 rounded-lg">
                                        <span class="font-semibold">4.8</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                                        </svg>
                                    </div>
                                    <span class="text-gray-600">(124 تقييم)</span>
                                </div>
                                <div class="flex items-center gap-2 text-gray-600">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/>
                                        <circle cx="12" cy="10" r="3"/>
                                    </svg>
                                    <span>${user.location}</span>
                                </div>
                            </div>
                        </div>

                        <button class="bg-[#2563eb] text-white px-8 py-4 rounded-xl hover:bg-[#1d4ed8] transition-colors flex items-center gap-2 font-semibold">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                            </svg>
                            <span>حجز صنايعي الآن</span>
                        </button>
                    </div>

                    <!-- Stats -->
                    <div class="grid grid-cols-3 gap-6 pt-6 border-t border-gray-200">

                        <div class="text-center">
                            <div class="flex items-center justify-center gap-2 mb-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <rect width="20" height="14" x="2" y="7" rx="2" ry="2"/>
                                    <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/>
                                </svg>
                                <c:forEach var="service" items="${user.services}">
                                    <p class="text-2xl text-gray-900 font-semibold">${service.experienceYear}</p>
                                </c:forEach>

                            </div>
                            <p class="text-gray-600 text-sm">سنوات خبرة</p>
                        </div>
                        <div class="text-center">
                            <div class="flex items-center justify-center gap-2 mb-2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <path d="M8 2v4"/>
                                    <path d="M16 2v4"/>
                                    <rect width="18" height="18" x="3" y="4" rx="2"/>
                                    <path d="M3 10h18"/>
                                </svg>
                                <p class="text-2xl text-gray-900 font-semibold">${user.createdAt }</p>
                            </div>
                            <p class="text-gray-600 text-sm">تاريخ الانضمام</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8 mb-8">
            <!-- Main Content -->
            <div class="lg:col-span-2 space-y-8">
                <!-- About -->
                <div class="bg-white rounded-2xl shadow-sm p-8">
                    <h3 class="text-2xl font-semibold mb-4">نبذة عني</h3>
                    <c:forEach var="service" items="${user.services}">
                        <p class="text-gray-700 leading-relaxed">
                            ${service.description}
                        </p>
                    </c:forEach>
                </div>

                <!-- Services -->
                <div class="bg-white rounded-2xl shadow-sm p-8">
                    <h3 class="text-2xl font-semibold mb-6">الخدمات المقدمة</h3>
                    <div class="grid grid-cols-2 gap-4">
                        <ul>
                            <c:forEach var="service" items="${user.services}">
                                <li>
                                    <div class="flex items-center gap-3 p-4 bg-gray-50 rounded-xl">
                                        <div class="w-10 h-10 bg-[#2563eb]/10 rounded-lg flex items-center justify-center flex-shrink-0">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                                                <polyline points="22 4 12 14.01 9 11.01"/>
                                            </svg>
                                        </div>
                                        <span class="text-gray-900">${service.name}</span>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <!-- Work Gallery -->
                <div class="bg-white rounded-2xl shadow-sm p-8">
                    <h3 class="text-2xl font-semibold mb-6">معرض الأعمال</h3>
                    <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
                        <c:forEach var="imgUrl" items="${service.imageUrls}">
                            <div class="aspect-square rounded-xl overflow-hidden group cursor-pointer">
                                <img src="${imgUrl}" alt="${service.name}" class="w-40 h-40 object-cover rounded-xl mb-2"/>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Reviews -->
                <div class="bg-white rounded-2xl shadow-sm p-8">
                    <h3 class="text-2xl font-semibold mb-6">التقييمات والمراجعات</h3>
                    <div class="space-y-6">
                        <!-- Review 1 -->
                        <div class="border-b border-gray-200 pb-6">
                            <div class="flex items-start justify-between mb-3">
                                <div>
                                    <p class="text-gray-900 font-medium mb-1">محمد علي</p>
                                    <p class="text-sm text-gray-500">منذ أسبوع</p>
                                </div>
                                <div class="flex items-center gap-1 bg-[#fbbf24] text-gray-900 px-3 py-1 rounded-lg">
                                    <span class="font-semibold">5</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                                    </svg>
                                </div>
                            </div>
                            <p class="text-gray-700 leading-relaxed">
                                عمل ممتاز ودقيق، أنصح بالتعامل معه
                            </p>
                        </div>

                        <!-- Review 2 -->
                        <div class="border-b border-gray-200 pb-6">
                            <div class="flex items-start justify-between mb-3">
                                <div>
                                    <p class="text-gray-900 font-medium mb-1">سارة أحمد</p>
                                    <p class="text-sm text-gray-500">منذ أسبوعين</p>
                                </div>
                                <div class="flex items-center gap-1 bg-[#fbbf24] text-gray-900 px-3 py-1 rounded-lg">
                                    <span class="font-semibold">5</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                                    </svg>
                                </div>
                            </div>
                            <p class="text-gray-700 leading-relaxed">
                                سرعة في الإنجاز واحترافية عالية
                            </p>
                        </div>

                        <!-- Review 3 -->
                        <div class="pb-0">
                            <div class="flex items-start justify-between mb-3">
                                <div>
                                    <p class="text-gray-900 font-medium mb-1">خالد حسن</p>
                                    <p class="text-sm text-gray-500">منذ شهر</p>
                                </div>
                                <div class="flex items-center gap-1 bg-[#fbbf24] text-gray-900 px-3 py-1 rounded-lg">
                                    <span class="font-semibold">4</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
                                    </svg>
                                </div>
                            </div>
                            <p class="text-gray-700 leading-relaxed">
                                جيد جداً وملتزم بالمواعيد
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="space-y-6">
                <!-- Contact Card -->
                <div class="bg-white rounded-2xl shadow-sm p-6 sticky top-8">
                    <h4 class="text-xl font-semibold mb-6">معلومات التواصل</h4>
                    <div class="space-y-4">
                        <a href="tel:+201234567890" class="flex items-center gap-3 p-4 bg-gray-50 rounded-xl hover:bg-gray-100 transition-colors">
                            <div class="w-10 h-10 bg-[#2563eb]/10 rounded-lg flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                                </svg>
                            </div>
                            <div class="flex-1 text-left">
                                <p class="text-sm text-gray-600">الهاتف</p>
                                <p class="text-gray-900">${user.phoneNumber}</p>
                            </div>
                        </a>

                        <a href="mailto:ahmed.mahmoud@email.com" class="flex items-center gap-3 p-4 bg-gray-50 rounded-xl hover:bg-gray-100 transition-colors">
                            <div class="w-10 h-10 bg-[#2563eb]/10 rounded-lg flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <rect width="20" height="16" x="2" y="4" rx="2"/>
                                    <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                                </svg>
                            </div>
                            <div class="flex-1 text-left">
                                <p class="text-sm text-gray-600">البريد</p>
                                <p class="text-gray-900 text-sm break-all">${user.email}</p>
                            </div>
                        </a>
                    </div>

                    <button class="w-full bg-[#2563eb] text-white py-4 rounded-xl hover:bg-[#1d4ed8] transition-colors mt-6 font-semibold">
                        إرسال رسالة
                    </button>
                </div>

                <!-- Badge -->
                <div class="bg-gradient-to-br from-[#2563eb] to-[#1d4ed8] rounded-2xl shadow-sm p-6 text-white text-center">
                    <div class="w-16 h-16 bg-white/20 rounded-2xl flex items-center justify-center mx-auto mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="m15.477 12.89 1.515 8.526a.5.5 0 0 1-.81.47l-3.58-2.687a1 1 0 0 0-1.197 0l-3.586 2.686a.5.5 0 0 1-.81-.469l1.514-8.526"/>
                            <circle cx="12" cy="8" r="6"/>
                        </svg>
                    </div>
                    <h4 class="text-white text-xl font-semibold mb-2">صنايعي معتمد</h4>
                    <p class="text-white/90 text-sm">
                        تم التحقق من الهوية والمهارات
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp" />
</body>
</html>
