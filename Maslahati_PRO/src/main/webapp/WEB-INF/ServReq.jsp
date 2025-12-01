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
            <c:when test="${lang=='ar'}">طلبات الخدمة</c:when>
            <c:otherwise>Service Requests</c:otherwise>
        </c:choose>
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="min-h-screen bg-gray-100 text-gray-800">

<!-- HEADER -->
<header class="bg-white border-b shadow-sm sticky top-0 z-50">
    <div class="max-w-6xl mx-auto flex justify-between items-center py-4 px-4">

        <!-- Back Button -->
        <a href="/homeworker" class="flex items-center gap-2 text-gray-600 hover:text-gray-900">
            <i class="fa-solid fa-arrow-right"></i>
            <c:choose>
                <c:when test="${lang=='ar'}">الرجوع</c:when>
                <c:otherwise>Back</c:otherwise>
            </c:choose>
        </a>

        <!-- Logo / Title -->
        <div class="flex items-center gap-2">
            <span class="text-xl font-bold">مصلحاتي</span>
            <div class="w-10 h-10 bg-blue-600 text-white flex items-center justify-center rounded-full">
                <i class="fa-solid fa-screwdriver-wrench"></i>
            </div>
        </div>

        <!-- Language Switch Button -->
        <a href="?lang=${lang=='ar' ? 'en' : 'ar'}"
           class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 rounded-md font-medium transition">
            <c:choose>
                <c:when test="${lang=='ar'}">English</c:when>
                <c:otherwise>العربية</c:otherwise>
            </c:choose>
        </a>

    </div>
</header>

<div class="max-w-4xl mx-auto py-10 px-4 space-y-10">

    <!-- ─────────────── NEW REQUESTS ─────────────── -->
    <h2 class="text-2xl font-bold text-blue-600 border-b-2 border-blue-600 pb-1">
        <c:choose>
            <c:when test="${lang=='ar'}">الطلبات الجديدة</c:when>
            <c:otherwise>New Requests</c:otherwise>
        </c:choose>
    </h2>

    <c:set var="hasNew" value="false"/>
    <c:forEach var="serviceObj" items="${service}">
        <c:forEach var="request" items="${serviceObj.requests}">
            <c:if test="${!request.inProgress}">
                <c:if test="${!request.done}">

                    <c:set var="hasNew" value="true"/>

                    <div class="relative bg-white shadow-lg rounded-xl p-6 hover:shadow-xl transition">

                        <!-- Badge -->
                        <c:choose>
                            <c:when test="${request.status}">
                                <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">
                                    <c:choose>
                                        <c:when test="${lang=='ar'}">جديد</c:when>
                                        <c:otherwise>New</c:otherwise>
                                    </c:choose>
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-gray-200 text-gray-700">
                                    <c:choose>
                                        <c:when test="${lang=='ar'}">قديم</c:when>
                                        <c:otherwise>Old</c:otherwise>
                                    </c:choose>
                                </span>
                            </c:otherwise>
                        </c:choose>

                        <!-- Request Info -->
                        <h3 class="text-xl font-bold mb-3 mt-4">${request.user.userName}</h3>
                        <p><span class="font-semibold">
                            <c:choose>
                                <c:when test="${lang=='ar'}">العنوان:</c:when>
                                <c:otherwise>Address:</c:otherwise>
                            </c:choose>
                        </span> ${request.address}</p>
                        <p class="mt-2"><span class="font-semibold">
                            <c:choose>
                                <c:when test="${lang=='ar'}">الوصف:</c:when>
                                <c:otherwise>Description:</c:otherwise>
                            </c:choose>
                        </span> ${request.problemDesc}</p>

                        <div class="grid grid-cols-2 gap-3 mt-6">
                            <form action="/requests/accept/${request.id}" method="GET">
                                <button class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700">
                                    <c:choose>
                                        <c:when test="${lang=='ar'}">قبول</c:when>
                                        <c:otherwise>Accept</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>
                            <form action="/requests/reject/${request.id}" method="GET">
                                <button class="w-full border border-gray-300 py-2 rounded-lg hover:bg-gray-200">
                                    <c:choose>
                                        <c:when test="${lang=='ar'}">رفض</c:when>
                                        <c:otherwise>Reject</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>
                        </div>
                    </div>

                </c:if>
            </c:if>
        </c:forEach>
    </c:forEach>

    <c:if test="${!hasNew}">
        <p class="text-gray-500 text-center">
            <c:choose>
                <c:when test="${lang=='ar'}">لا يوجد طلبات جديدة</c:when>
                <c:otherwise>No new requests</c:otherwise>
            </c:choose>
        </p>
    </c:if>

    <!-- ─────────────── IN PROGRESS ─────────────── -->
    <h2 class="text-2xl font-bold text-yellow-600 border-b-2 border-yellow-600 pb-1">
        <c:choose>
            <c:when test="${lang=='ar'}">طلبات قيد التنفيذ</c:when>
            <c:otherwise>In Progress Requests</c:otherwise>
        </c:choose>
    </h2>

    <c:set var="hasProgress" value="false"/>
    <c:forEach var="serviceObj" items="${service}">
        <c:forEach var="request" items="${serviceObj.requests}">
            <c:if test="${request.inProgress}">
                <c:if test="${!request.done}">

                    <c:set var="hasProgress" value="true"/>

                    <div class="relative bg-white shadow-lg rounded-xl p-6 hover:shadow-xl transition border-l-4 border-yellow-500">

                        <!-- Badge -->
                        <c:if test="${request.inProgress}">
                            <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-700">
                                <c:choose>
                                    <c:when test="${lang=='ar'}">جاري العمل عليه</c:when>
                                    <c:otherwise>In Progress</c:otherwise>
                                </c:choose>
                            </span>
                        </c:if>

                        <!-- Request Info -->
                        <h3 class="text-xl font-bold mb-3 mt-4">${request.user.userName}</h3>
                        <p><span class="font-semibold">
                            <c:choose>
                                <c:when test="${lang=='ar'}">العنوان:</c:when>
                                <c:otherwise>Address:</c:otherwise>
                            </c:choose>
                        </span> ${request.address}</p>
                        <p class="mt-2"><span class="font-semibold">
                            <c:choose>
                                <c:when test="${lang=='ar'}">الوصف:</c:when>
                                <c:otherwise>Description:</c:otherwise>
                            </c:choose>
                        </span> ${request.problemDesc}</p>
                        <p class="mt-2"><span class="font-semibold">
                            <c:choose>
                                <c:when test="${lang=='ar'}">رقم الهاتف:</c:when>
                                <c:otherwise>PhoneNumber:</c:otherwise>
                            </c:choose>
                        </span> ${request.user.phoneNumber}</p>

                        <div class="grid grid-cols-2 gap-3 mt-6">
                            <form action="/requests/accept/${request.id}" method="GET">
                                <button class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700"
                                        onclick="showAgreementMessage()">

                                    <c:choose>
                                        <c:when test="${lang=='ar'}">إنهاء</c:when>
                                        <c:otherwise>Complete</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>

                        </div>

                    </div>

                </c:if>
            </c:if>
        </c:forEach>
    </c:forEach>

    <c:if test="${!hasProgress}">
        <p class="text-gray-500 text-center">
            <c:choose>
                <c:when test="${lang=='ar'}">لا يوجد طلبات قيد التنفيذ</c:when>
                <c:otherwise>No requests in progress</c:otherwise>
            </c:choose>
        </p>
    </c:if>

</div>
</body>
<script>
    function showAgreementMessage() {
        alert("لا تستطيع انهاء الخدمة دون موافقة المستفيد");
    }
</script>
</html>
