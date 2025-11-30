<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String lang = request.getParameter("lang") != null ? request.getParameter("lang")
            : (session.getAttribute("lang") != null ? session.getAttribute("lang").toString() : "ar");
    session.setAttribute("lang", lang);
%>

<!DOCTYPE html>
<html lang="${lang}" dir="${lang=='ar' ? 'rtl' : 'ltr'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <c:choose>
            <c:when test="${lang=='ar'}">التقييمات - مصلحاتي</c:when>
            <c:otherwise>Reviews - Maslahati</c:otherwise>
        </c:choose>
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen">

<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">

            <!-- Back Button -->
            <a href="/homeuser" class="px-6 py-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-colors">
                <i class="fas fa-arrow-right ml-2"></i>
                <c:choose>
                    <c:when test="${lang=='ar'}">العودة</c:when>
                    <c:otherwise>Back</c:otherwise>
                </c:choose>
            </a>

            <!-- Logo / Title -->
            <a href="/homeuser" class="flex items-center gap-3 hover:opacity-80 transition-opacity">
                <span class="text-xl font-bold text-gray-900">مصلحاتي</span>
                <div class="w-12 h-12 bg-blue-600 rounded-full flex items-center justify-center">
                    <i class="fas fa-tools text-white text-lg"></i>
                </div>
            </a>

            <!-- Language Switch Button -->
            <a href="?lang=${lang=='ar' ? 'en' : 'ar'}"
               class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 rounded-md font-medium transition">
                <c:choose>
                    <c:when test="${lang=='ar'}">English</c:when>
                    <c:otherwise>العربية</c:otherwise>
                </c:choose>
            </a>

        </div>
    </div>
</header>

<div class="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-6">

    <h1 class="text-2xl md:text-3xl font-bold text-gray-900 mb-6 text-right">
        <c:choose>
            <c:when test="${lang=='ar'}">تقييمات المستخدمين</c:when>
            <c:otherwise>User Reviews</c:otherwise>
        </c:choose>
    </h1>

    <!-- Form to Add New Review -->
    <div class="bg-white rounded-xl shadow-lg p-6">
        <h2 class="text-lg font-bold text-gray-900 mb-4">
            <c:choose>
                <c:when test="${lang=='ar'}">أضف تقييم جديد</c:when>
                <c:otherwise>Add New Review</c:otherwise>
            </c:choose>
        </h2>

        <form:form method="post" action="/reviews/save/${request.id}" modelAttribute="newReview" class="space-y-4">

            <div>
                <label class="block text-gray-800 font-semibold mb-1">
                    <c:choose>
                        <c:when test="${lang=='ar'}">التقييم (1-5):</c:when>
                        <c:otherwise>Rating (1-5):</c:otherwise>
                    </c:choose>
                </label>
                <form:input path="rating" type="number" min="1" max="5"
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                <form:errors path="rating" cssClass="text-red-500 text-sm mt-1"/>
            </div>

            <div>
                <label class="block text-gray-800 font-semibold mb-1">
                    <c:choose>
                        <c:when test="${lang=='ar'}">التعليق:</c:when>
                        <c:otherwise>Comment:</c:otherwise>
                    </c:choose>
                </label>
                <form:textarea path="comment" rows="3"
                               class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                <form:errors path="comment" cssClass="text-red-500 text-sm mt-1"/>
            </div>

            <form:hidden path="reviewed" value="${request.service.id}"/>
            <form:hidden path="reviewer" value="${User.id}"/>

            <button type="submit"
                    class="w-full px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-semibold flex items-center justify-center gap-2">
                <i class="fas fa-plus-circle"></i>
                <c:choose>
                    <c:when test="${lang=='ar'}">إضافة تقييم</c:when>
                    <c:otherwise>Add Review</c:otherwise>
                </c:choose>
            </button>
        </form:form>
    </div>
</div>

</body>
</html>
