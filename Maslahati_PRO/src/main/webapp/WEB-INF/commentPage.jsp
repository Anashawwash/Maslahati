<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <c:when test="${lang=='ar'}">التعليقات والتقييمات</c:when>
            <c:otherwise>User Reviews</c:otherwise>
        </c:choose>
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="min-h-screen bg-gray-100 text-gray-800">

<!-- ═══════════════════════ HEADER ═══════════════════════ -->
<header class="bg-white border-b shadow-sm sticky top-0 z-50">
    <div class="max-w-6xl mx-auto flex justify-between items-center py-4 px-4">

        <!-- Back -->
        <a href="/homeworker" class="flex items-center gap-2 text-gray-600 hover:text-gray-900">
            <i class="fa-solid fa-arrow-right"></i>
            <c:choose>
                <c:when test="${lang=='ar'}">رجوع</c:when>
                <c:otherwise>Back</c:otherwise>
            </c:choose>
        </a>

        <!-- Logo -->
        <div class="flex items-center gap-2">
            <span class="text-xl font-bold">مصلحاتي</span>
            <div class="w-10 h-10 bg-blue-600 text-white flex items-center justify-center rounded-full">
                <i class="fa-solid fa-screwdriver-wrench"></i>
            </div>
        </div>

        <!-- Language Switch -->
        <a href="?lang=${lang=='ar' ? 'en' : 'ar'}"
           class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 rounded-md font-medium transition">
            <c:choose>
                <c:when test="${lang=='ar'}">English</c:when>
                <c:otherwise>العربية</c:otherwise>
            </c:choose>
        </a>
    </div>
</header>

<!-- ═══════════════════════ COMMENTS SECTION ═══════════════════════ -->
<div class="max-w-4xl mx-auto py-10 px-4 space-y-10">

    <h2 class="text-2xl font-bold text-purple-600 border-b-2 border-purple-600 pb-1">
        <c:choose>
            <c:when test="${lang=='ar'}">التعليقات والتقييمات</c:when>
            <c:otherwise>Ratings & Comments</c:otherwise>
        </c:choose>
    </h2>

    <c:forEach var="serv" items="${services}">
        <c:forEach var="review" items="${serv.reviews}">
            <div class="relative bg-white shadow-lg rounded-xl p-6 hover:shadow-xl transition">
                <!-- Rating Badge -->
                <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-purple-100 text-purple-700 flex items-center gap-1">
                    <i class="fa-solid fa-star"></i> ${review.rating}/5
                </span>

                <h3 class="text-xl font-bold mb-2 mt-4 flex items-center gap-2">
                    <i class="fa-solid fa-user text-gray-600"></i>
                        ${review.reviewer.userName}
                </h3>

                <p class="text-gray-700 leading-relaxed">${review.comment}</p>

                <p class="text-gray-400 text-sm mt-3">
                    <i class="fa-regular fa-calendar"></i>
                    <c:choose>
                        <c:when test="${lang=='ar'}">التاريخ:</c:when>
                        <c:otherwise>Date:</c:otherwise>
                    </c:choose>
                        ${review.createdAt}
                </p>
            </div>
        </c:forEach>
    </c:forEach>

    <c:if test="${services == null || services.isEmpty()}">
        <p class="text-gray-500 text-center">
            <c:choose>
                <c:when test="${lang=='ar'}">لا يوجد تعليقات حتى الآن</c:when>
                <c:otherwise>No comments yet</c:otherwise>
            </c:choose>
        </p>
    </c:if>

</div>

</body>
</html>
