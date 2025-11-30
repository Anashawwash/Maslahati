<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>طلباتي - مصلحاتي</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen">

<!-- Header -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-20">
            <a href="/homeuser" class="px-6 py-2 text-gray-700 hover:bg-gray-100 rounded-lg transition-colors">
                <i class="fas fa-arrow-right ml-2"></i> العودة
            </a>
            <h1 class="text-2xl font-bold text-gray-900">طلباتي</h1>
            <a href="/logout" class="px-4 py-2 bg-red-500 hover:bg-red-600 text-white rounded-md font-medium transition">
                تسجيل الخروج
            </a>
        </div>
    </div>
</header>

<!-- Main content -->
<main class="max-w-7xl mx-auto px-4 py-8 space-y-6">
    <c:if test="${empty requests}">
        <div class="bg-white p-6 rounded-xl shadow text-center text-gray-600">
            لم تقم بتقديم أي طلبات بعد.
        </div>
    </c:if>

    <c:forEach var="request" items="${requests}">
        <c:if test="${!request.done}">
        <div class="bg-white rounded-xl shadow-lg overflow-hidden relative p-6">

            <!-- Waiting Badge -->
            <c:if test="${!request.inProgress}">
        <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-gray-100 text-gray-700">
            الطلب قيد الانتظار
        </span>
            </c:if>

            <!-- In-Progress Badge -->
            <c:if test="${request.inProgress}">
        <span class="absolute top-4 left-4 px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-800">
            قيد التنفيذ
        </span>
            </c:if>

            <!-- Request Info -->
            <div class="mb-4">
                <h2 class="text-xl font-bold text-gray-900 mb-1">طلب الخدمة: ${request.service.name}</h2>
            </div>

            <div class="space-y-3 mb-6 text-gray-700">
                <div class="flex justify-between">
                    <span class="font-semibold text-gray-800">العنوان:</span>
                    <span>${request.user.location}</span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold text-gray-800">الوصف:</span>
                    <span>${request.problemDesc}</span>
                </div>
                <div class="flex justify-between">
                    <span class="font-semibold text-gray-800">تاريخ الطلب:</span>
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
                            <span>إلغاء الطلب</span>
                            <span class="text-xs text-gray-200">(لا يمكن الغاء الطلب اذا اصبح قيد التنفيذ)</span>
                        </button>
                    </form>
                </c:if>

                <c:if test="${request.inProgress}">
                    <div class="flex gap-3 pt-4 border-t border-gray-100 w-full">

                        <!-- Info Badge -->
                        <span class="flex-1 px-6 py-3 text-center bg-yellow-100 text-yellow-800 rounded-lg flex items-center justify-center gap-2 font-medium shadow-sm">
            <i class="fas fa-exclamation-circle text-yellow-500 animate-pulse"></i>
            لا يمكن الغاء الطلب إذا أصبح قيد التنفيذ
        </span>
                        <!-- Confirmation Button -->
                        <form action="/requests/add/review/${request.id}" method="get" class="flex-1">
                            <button type="submit"
                                    class="w-full px-6 py-4 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-all flex flex-col items-center gap-1 font-semibold shadow-md transform hover:scale-105">
                                <i class="fas fa-check-circle text-white text-lg animate-bounce"></i>
                                <span>هل أتم العامل الطلب؟</span>
                                <span class="text-xs text-gray-200">(اضغط هنا لتأكيد)</span>
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
        span.innerText = isoDate.toLocaleString("ar-EG", {
            dateStyle: "medium",
            timeStyle: "short"
        });
    });
</script>
</body>
</html>
