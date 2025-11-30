<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <c:when test="${lang=='ar'}">طلباتي - مصلحاتي</c:when>
            <c:otherwise>My Requests - Maslahati</c:otherwise>
        </c:choose>
    </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen">

<!-- Header -->
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

            <!-- Page Title -->
            <h1 class="text-2xl font-bold text-gray-900">
                <c:choose>
                    <c:when test="${lang=='ar'}">طلباتي</c:when>
                    <c:otherwise>My Requests</c:otherwise>
                </c:choose>
            </h1>

            <div class="flex items-center gap-3">
                <!-- Logout Button -->
                <a href="/logout"
                   class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded-md font-medium transition">
                    <c:choose>
                        <c:when test="${lang=='ar'}">تسجيل الخروج</c:when>
                        <c:otherwise>Logout</c:otherwise>
                    </c:choose>
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
    </div>
</header>

<!-- Main content -->
<main class="max-w-7xl mx-auto px-4 py-8 space-y-6">
    <c:if test="${empty requests}">
        <div class="bg-white p-6 rounded-xl shadow text-center text-gray-600">
            <c:choose>
                <c:when test="${lang=='ar'}">لم تقم بتقديم أي طلبات بعد.</c:when>
                <c:otherwise>You haven't submitted any requests yet.</c:otherwise>
            </c:choose>
        </div>
    </c:if>

    <c:forEach var="request" items="${requests}">
        <c:if test="${!request.done}">
            <div class="bg-white rounded-xl shadow-lg overflow-hidden relative p-6">

                <!-- Waiting Badge -->
                <c:if test="${!request.inProgress}">
                <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-gray-100 text-gray-700">
                    <c:choose>
                        <c:when test="${lang=='ar'}">الطلب قيد الانتظار</c:when>
                        <c:otherwise>Request Pending</c:otherwise>
                    </c:choose>
                </span>
                </c:if>

                <!-- In-Progress Badge -->
                <c:if test="${request.inProgress}">
                <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">
                    <c:choose>
                        <c:when test="${lang=='ar'}">قيد التنفيذ</c:when>
                        <c:otherwise>In Progress</c:otherwise>
                    </c:choose>
                </span>
                </c:if>

                <!-- Request Info -->
                <div class="mb-4">
                    <h2 class="text-xl font-bold text-gray-900 mb-1">
                        <c:choose>
                            <c:when test="${lang=='ar'}">طلب الخدمة: </c:when>
                            <c:otherwise>Service Request: </c:otherwise>
                        </c:choose>
                            ${request.service.name}
                    </h2>
                </div>

                <div class="space-y-3 mb-6 text-gray-700">
                    <div class="flex justify-between">
                    <span class="font-semibold text-gray-800">
                        <c:choose>
                            <c:when test="${lang=='ar'}">العنوان:</c:when>
                            <c:otherwise>Address:</c:otherwise>
                        </c:choose>
                    </span>
                        <span>${request.user.location}</span>
                    </div>
                    <div class="flex justify-between">
                    <span class="font-semibold text-gray-800">
                        <c:choose>
                            <c:when test="${lang=='ar'}">الوصف:</c:when>
                            <c:otherwise>Description:</c:otherwise>
                        </c:choose>
                    </span>
                        <span>${request.problemDesc}</span>
                    </div>
                    <div class="flex justify-between">
                    <span class="font-semibold text-gray-800">
                        <c:choose>
                            <c:when test="${lang=='ar'}">تاريخ الطلب:</c:when>
                            <c:otherwise>Request Date:</c:otherwise>
                        </c:choose>
                    </span>
                        <span class="createdAt" data-date="${request.createdAt}"></span>
                    </div>
                </div>

                <!-- Actions -->
                <div class="flex gap-3 pt-4 border-t border-gray-100">
                    <c:if test="${!request.inProgress}">
                        <form action="/requests/cancel/${request.id}" method="get" class="flex-1 w-full">
                            <button type="submit"
                                    class="w-full px-6 py-4 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-all flex flex-col items-center gap-1 font-semibold shadow-md transform hover:scale-105">
                                <i class="fas fa-times-circle text-white text-lg animate-pulse"></i>
                                <span>
                                <c:choose>
                                    <c:when test="${lang=='ar'}">إلغاء الطلب</c:when>
                                    <c:otherwise>Cancel Request</c:otherwise>
                                </c:choose>
                            </span>
                                <span class="text-xs text-gray-200">
                                <c:choose>
                                    <c:when test="${lang=='ar'}">(لا يمكن الغاء الطلب اذا اصبح قيد التنفيذ)</c:when>
                                    <c:otherwise>(Cannot cancel if in progress)</c:otherwise>
                                </c:choose>
                            </span>
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${request.inProgress}">
                        <div class="flex gap-3 pt-4 border-t border-gray-100 w-full">
                        <span class="flex-1 px-6 py-3 text-center bg-yellow-100 text-yellow-800 rounded-lg flex items-center justify-center gap-2 font-medium shadow-sm">
                            <i class="fas fa-exclamation-circle text-yellow-500 animate-pulse"></i>
                            <c:choose>
                                <c:when test="${lang=='ar'}">لا يمكن الغاء الطلب إذا أصبح قيد التنفيذ</c:when>
                                <c:otherwise>Cannot cancel request once in progress</c:otherwise>
                            </c:choose>
                        </span>

                            <form action="/requests/add/review/${request.id}" method="get" class="flex-1">
                                <button type="submit"
                                        class="w-full px-6 py-4 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-all flex flex-col items-center gap-1 font-semibold shadow-md transform hover:scale-105">
                                    <i class="fas fa-check-circle text-white text-lg animate-bounce"></i>
                                    <span>
                                    <c:choose>
                                        <c:when test="${lang=='ar'}">هل أتم العامل الطلب؟</c:when>
                                        <c:otherwise>Worker Completed Request?</c:otherwise>
                                    </c:choose>
                                </span>
                                    <span class="text-xs text-gray-200">
                                    <c:choose>
                                        <c:when test="${lang=='ar'}">(اضغط هنا لتأكيد)</c:when>
                                        <c:otherwise>(Click to confirm)</c:otherwise>
                                    </c:choose>
                                </span>
                                </button>
                            </form>
                        </div>
                    </c:if>

                </div>

            </div>
        </c:if>
    </c:forEach>
</main>

<!-- Footer (optional) -->
<jsp:include page="includes/footer.jsp" />

<script>
    document.querySelectorAll(".createdAt").forEach(span => {
        const isoDate = new Date(span.dataset.date);
        span.innerText = isoDate.toLocaleString("${lang=='ar' ? 'ar-EG' : 'en-US'}", {
            dateStyle: "medium",
            timeStyle: "short"
        });
    });
</script>

</body>
</html>
