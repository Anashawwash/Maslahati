<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>طلبات الخدمة</title>
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
                <div class="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center">
                    <i class="fas fa-tools text-white text-lg"></i>
                </div>
            </a>
        </div>
    </div>
</header>

<div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">

    <h1 class="text-2xl md:text-3xl font-bold text-gray-900 mb-4 text-right">طلبات الخدمة</h1>

    <!-- Loop over services -->
    <c:forEach var="serviceObj" items="${service}">
        <c:forEach var="request" items="${serviceObj.requests}">

            <div class="bg-white rounded-xl shadow-lg overflow-hidden relative p-6">

                <!-- Badge -->
                <c:choose>
                    <c:when test="${request.status}">
                        <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">
                            جديد
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-gray-200 text-gray-700">
                            قديم
                        </span>
                    </c:otherwise>
                </c:choose>

                <!-- Request Info -->
                <div class="mb-4">
                    <h2 class="text-xl font-bold text-gray-900 mb-1">طلب من ${request.user.userName}</h2>
                </div>

                <div class="space-y-3 mb-6 text-gray-700">
                    <div class="flex justify-between">
                        <span class="font-semibold text-gray-800">العنوان:</span>
                        <span>${request.address}</span>
                    </div>
                    <div class="flex justify-between">
                        <span class="font-semibold text-gray-800">الوصف:</span>
                        <span>${request.problemDesc}</span>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="flex gap-3 pt-4 border-t border-gray-100">
                    <form action="/requests/accept/${request.id}" method="POST" class="flex-1">
                        <button type="submit" class="w-full px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">
                            قبول الطلب
                        </button>
                    </form>
                    <form action="/requests/reject/${request.id}" method="POST" class="flex-1">
                        <button type="submit" class="w-full px-6 py-3 border border-gray-300 bg-white text-gray-700 rounded-lg hover:bg-gray-50 transition-colors">
                            رفض
                        </button>
                    </form>
                </div>

            </div>

        </c:forEach>
    </c:forEach>

</div>
</body>
</html>
