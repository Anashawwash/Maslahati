<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>حجز موعد - مصلحاتي</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="min-h-screen bg-gray-50">

<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <a href="/homeworker" class="px-6 py-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-colors">
                <i class="fas fa-arrow-right ml-2"></i> العودة
            </a>
            <a href="index.jsp" class="flex items-center gap-3 hover:opacity-80 transition-opacity">
                <span class="text-xl font-bold text-gray-900">مصلحاتي</span>
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

<div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="bg-blue-600 text-white px-6 py-4">
            <h2 class="text-2xl font-bold">اضيف خدمة</h2>
        </div>

        <div class="p-6">

            <form:form  method="POST" modelAttribute="service" action="/addservice">
                <div class="mb-4">
                    <form:select path="name" cssClass="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent">
                        <form:option value="" label="نوع الخدمة"/>
                        <form:option value="حداد" label="حداد"/>
                        <form:option value="موسرجي" label="موسرجي"/>
                        <form:option value="كهربجي" label="كهربجي"/>
                        <form:option value="بليط" label="بليط"/>
                        <form:option value="نجار" label="نجار"/>
                        <form:option value="منظف بيوت" label="منظف بيوت"/>
                    </form:select>
                    <form:errors path="name" cssClass="text-red-500 mt-1"/>
                </div>

                <%-- hiddin input --%>
                <form:hidden path="user" value="${worker.id}"/>
                <div class="mb-4">
                    <label class="block mb-2 font-semibold">
                        <i class="fas fa-map-marker-alt ml-2"></i> عدد سنين الخبرة
                    </label>
                    <form:input path="experienceYear" placeholder="مثل: ١"
                                cssClass="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
                    <form:errors path="experienceYear" cssClass="text-red-500 mt-1"/>
                </div>

                <div class="mb-4">
                    <label class="block mb-2 font-semibold">
                        <i class="fas fa-file-text ml-2"></i> معلومات اكثر عن الخدمة
                    </label>
                    <form:textarea path="description" rows="4" placeholder="اشرح بشكل بسيط ومفصل..."
                                   cssClass="w-full px-4 py-3 border border-gray-300 rounded-lg resize-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"/>
                    <form:errors path="description" cssClass="text-red-500 mt-1"/>
                </div>

                <div class="flex gap-3 pt-4">
                    <a href="/homeworker" class="flex-1 px-6 py-3 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors text-center">
                        إلغاء
                    </a>
                    <button type="submit" class="flex-1 px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
                        تأكيد الخدمة
                    </button>
                </div>
            </form:form>

        </div>
    </div>
</div>
</body>
</html>
