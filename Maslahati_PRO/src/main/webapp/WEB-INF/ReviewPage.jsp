<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>التقييمات - مصلحاتي</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen">

<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <a href="/homeuser" class="px-6 py-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-colors">
                <i class="fas fa-arrow-right ml-2"></i> العودة
            </a>
            <a href="/homeuser" class="flex items-center gap-3 hover:opacity-80 transition-opacity">
                <span class="text-xl font-bold text-gray-900">مصلحاتي</span>
                <div class="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center">
                    <i class="fas fa-tools text-white text-lg"></i>
                </div>
            </a>
        </div>
    </div>
</header>

<div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">

    <h1 class="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-right">تقييمات المستخدمين</h1>

    <!-- Form to Add New Review -->
    <div class="bg-white rounded-xl shadow-lg p-6">
        <h2 class="text-lg font-bold text-gray-900 mb-4">أضف تقييم جديد</h2>
        <form:form method="post" action="/reviews/save/${request.id}" modelAttribute="newReview" class="space-y-4">

            <div>
                <label class="block text-gray-800 font-semibold mb-1">التقييم (1-5):</label>
                <form:input path="rating" type="number" min="1" max="5"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                <form:errors path="rating" cssClass="text-red-500 text-sm mt-1"/>
            </div>

            <div>
                <label class="block text-gray-800 font-semibold mb-1">التعليق:</label>
                <form:textarea path="comment" rows="3" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                <form:errors path="comment" cssClass="text-red-500 text-sm mt-1"/>
            </div>
                <form:hidden path="reviewed" value="${request.service.id}"/>
                <form:hidden path="reviewer" value="${User.id}"/>
            <button type="submit"
                    class="w-full px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-semibold flex items-center justify-center gap-2">
                <i class="fas fa-plus-circle"></i> إضافة تقييم
            </button>
        </form:form>
    </div>
</div>

</body>
</html>
