<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>الصناعية المتاحة - أعلن عن أفضل الصناعيين في منطقتك</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .craftsman-card {
            transition: all 0.3s ease;
        }

        .craftsman-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .rating-badge {
            background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
        }

        .search-input::placeholder {
            color: #9ca3af;
        }
    </style>
</head>
<body class="bg-gray-50" dir="rtl">

<!-- Header Section -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        <div class="flex items-center justify-between h-20">

            <!-- Logout Button -->
            <a href="/logout"
               class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded-md font-medium transition">
                تسجيل الخروج
            </a>

            <!-- Title Center -->
            <h1 class="text-2xl font-bold text-gray-900 text-center">
                ابحث عن افضل العمال
            </h1>

            <!-- Logo Section -->
            <a href="/homeuser" class="flex items-center gap-3 hover:opacity-80 transition">
                <span class="text-xl font-bold text-gray-900">مصلحاتي</span>
                <div class="w-12 h-12 bg-[#2563eb] rounded-full flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="text-white">
                        <path d="m15 12-8.5 8.5c-.83.83-2.17.83-3 0 0 0 0 0 0 0a2.12 2.12 0 0 1 0-3L12 9"/>
                        <path d="M17.64 15 22 10.64"/>
                        <path d="m20.91 11.7-1.25-1.25c-.6-.6-.93-1.4-.93-2.25v-.86L16.01 4.6a5.56 5.56 0 0 0-3.94-1.64H9l.92.82A6.18 6.18 0 0 1 12 8.4v1.56l2 2h2.47l2.26 1.91"/>
                    </svg>
                </div>
            </a>

        </div>
    </div>
</header>

<section class="bg-white border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 py-6">
        <div class="flex flex-col md:flex-row gap-4 items-center justify-between">
            <div class="w-full md:w-auto md:flex-1 max-w-md">
                <div class="relative">
                    <input type="text" placeholder="ابحث بإسم الصناعي..." class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-right">
                    <svg class="absolute left-3 top-3.5 w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
            </div>
            <div class="flex flex-wrap gap-3 justify-end w-full md:w-auto">

                <div class="relative">
                    <select id="profession" class="appearance-none px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition pr-10 text-right cursor-pointer">
                        <option value="all">كل التخصصات</option>
                        <option value="pata"> موسرجي</option>
                        <option>تخصص 2</option>
                        <option>تخصص 3</option>
                    </select>
                    <svg class="w-5 h-5 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.5a2 2 0 00-1 .267M7 21H5m12 0h2m0-4V5a2 2 0 00-2-2h-4a2 2 0 00-2 2v12a4 4 0 004 4z"></path>
                    </svg>
                </div>
                <div class="relative">
                    <select class="appearance-none px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition pr-10 text-right cursor-pointer">
                        <option>كل المناطق</option>
                        <option>المنطقة 1</option>
                        <option>المنطقة 2</option>
                        <option>المنطقة 3</option>
                    </select>
                    <svg class="w-5 h-5 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                </div>

                <!-- Ratings Dropdown -->
                <div class="relative">
                    <select class="appearance-none px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition pr-10 text-right cursor-pointer">
                        <option>كل التقييمات</option>
                        <option>1 نجمة</option>
                        <option>2 نجوم</option>
                        <option>3 نجوم</option>
                        <option>4 نجوم</option>
                        <option>5 نجوم</option>
                    </select>
                    <svg class="w-5 h-5 absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                    </svg>
                </div>

            </div>

        </div>
        <div class="flex items-center justify-between mt-6 pt-4 border-t border-gray-200">
            <span class="text-gray-600 text-sm">${many} صناعي متاح</span>
        </div>
    </div>
</section>

<!-- Craftsmen Grid Section -->
<main class="max-w-7xl mx-auto px-4 py-12">
    <div id="main" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Craftsman Card 1 -->
        <c:forEach items="${service}" var="serv" >
            <div class="craftsman-card bg-white rounded-lg overflow-hidden shadow-md">
                <div class="relative h-48 bg-gray-200 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=400&h=300&fit=crop" alt="خالد أحمد" class="w-full h-full object-cover">
                </div>
                <div class="p-4">
                    <div class="flex items-start justify-between mb-2">
                        <div class="text-right flex-1">
                            <h3 class="font-bold text-gray-900">${serv.user.userName}</h3>
                            <p class="text-sm text-gray-600"></p>
                        </div>

                        <div class="rating-badge text-white px-2 py-1 rounded-md text-sm font-bold flex items-center gap-1">
                            <span>4.7</span>
                            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                            </svg>
                        </div>
                    </div>

                    <div class="flex  justify-between space-y-2 text-sm text-gray-600 mb-4">
                        <div>
                            <h1 class="text-xl">${serv.name}</h1>
                            <h1 class="w-25 text-sm">${serv.description}</h1>
                        </div>
                        <div class="flex items-center gap-2 ">
                            <span>${serv.user.location}</span>
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                            </svg>
                        </div>
                    </div>
                    <div class="flex items-center justify-between text-sm text-blue-600 border-t border-gray-200 pt-3">
                        <a href="/booking/${serv.id}" class="hover:underline">تقديم طلب خدمة</a>
                        <span> ${serv.doneOrders}  الاعمال المنجز</span>
                    </div>
                </div>
            </div>
        </c:forEach>







    </div>
</main>
<!-- Include Footer -->
<jsp:include page="includes/footer.jsp" />
</body>
<script>
    document.getElementById("profession").addEventListener("change", function() {
        const selected = this.value;
        console.log(selected);
        axios.get(`/userhome?rate=${selected}`)
            .then(response => {
                let html =``
                const data = response.data;
                const main = document.getElementById("mian");
                data.forEach(trying => {
                    html = `  <div class="craftsman-card bg-white rounded-lg overflow-hidden shadow-md">
            <div class="relative h-48 bg-gray-200 overflow-hidden">
                <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=400&h=300&fit=crop" alt="خالد أحمد" class="w-full h-full object-cover">
            </div>
            <div class="p-4">
                <div class="flex items-start justify-between mb-2">
                    <div class="text-right flex-1">
                        <h3 class="font-bold text-gray-900">خالد أحمد</h3>
                        <p class="text-sm text-gray-600">${trying.user.username}</p>
                    </div>
                    <div class="rating-badge text-white px-2 py-1 rounded-md text-sm font-bold flex items-center gap-1">
                        <span>4.7</span>
                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                        </svg>
                    </div>
                </div>

                <div class="space-y-2 text-sm text-gray-600 mb-4">
                    <div class="flex items-center gap-2 justify-end">
                        <span>6 مشاريع حجز</span>
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                        </svg>
                    </div>
                    <div class="flex items-center gap-2 justify-end">
                        <span>الإسكندرية</span>
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        </svg>
                    </div>
                </div>

                <div class="flex items-center justify-between text-sm text-blue-600 border-t border-gray-200 pt-3">
                    <a href="#" class="hover:underline">عرض الملف</a>
                    <span>156 عمل منجز</span>
                </div>
            </div>
        </div>
 `;

                });
            });
    });
    main.innerHTML = html;

</script>
</html>
