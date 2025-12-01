<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>احجز موعد</title>

    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center p-6">

<div class="bg-white w-full max-w-6xl rounded-xl shadow-xl overflow-hidden p-6">

    <!-- Header -->
    <div class="bg-blue-50 p-4 rounded-lg shadow-sm text-right mb-6">
        <p class="text-xl font-bold text-gray-900">${serv.user.userName}</p>
        <p class="text-sm text-gray-600">${serv.name}</p>
    </div>

    <!-- Layout -->
    <div class="flex flex-col lg:flex-row gap-6">

        <!-- Reviews -->
        <div class="lg:w-1/2 space-y-4">

            <h2 class="text-lg font-bold text-gray-800 mb-3">آراء العملاء</h2>

            <c:if test="${empty review}">
                <p class="text-gray-500 text-center py-4 border rounded-lg">لا توجد تقييمات بعد</p>
            </c:if>

            <c:forEach var="r" items="${review}">
                <div class="bg-white p-4 rounded-lg shadow hover:shadow-lg transition">
                    <p class="font-semibold text-gray-900">${r.reviewer.userName}</p>

                    <div class="text-yellow-500 text-sm mt-1">
                        <c:forEach begin="1" end="${r.rating}">⭐</c:forEach>
                    </div>

                    <p class="text-gray-700 text-sm mt-2">${r.comment}</p>
                </div>
            </c:forEach>

        </div>

        <!-- Booking Form -->
        <div class="lg:w-1/2 bg-gray-50 p-6 rounded-lg shadow-sm">

            <form:form method="POST" modelAttribute="bookingForm" action="/booking" class="space-y-6">

                <form:hidden path="user" value="${User.id}"/>
                <form:hidden path="service" value="${serv.id}"/>

                <!-- Address -->
                <div>
                    <label class="block mb-1 font-medium text-gray-700">العنوان</label>
                    <form:input path="address"
                                value="${User.location}"
                                class="w-full border border-gray-300 rounded-lg p-2 text-right
                                       focus:outline-none focus:ring-2 focus:ring-blue-500"
                                placeholder="أدخل العنوان"/>
                    <form:errors path="address" cssClass="text-red-500 text-sm"/>
                </div>

                <!-- Phone -->
                <div>
                    <label class="block mb-1 font-medium text-gray-700">رقم الجوال</label>
                    <form:input path="phoneNumber"
                                value="${User.phoneNumber}"
                                class="w-full border border-gray-300 rounded-lg p-2 text-right
                                       focus:outline-none focus:ring-2 focus:ring-blue-500"
                                placeholder="05XXXXXXXX"/>
                    <form:errors path="phoneNumber" cssClass="text-red-500 text-sm"/>
                </div>

                <!-- Problem -->
                <div>
                    <label class="block mb-1 font-medium text-gray-700">وصف المشكلة</label>
                    <form:textarea path="problemDesc" rows="4"
                                   class="w-full border border-gray-300 rounded-lg p-2 text-right
                                          focus:outline-none focus:ring-2 focus:ring-blue-500"
                                   placeholder="اشرح المشكلة بالتفصيل..."/>
                    <form:errors path="problemDesc" cssClass="text-red-500 text-sm"/>
                </div>

                <!-- Buttons -->
                <div class="flex gap-4 pt-2 flex-col sm:flex-row">
                    <a href="/" class="flex-1 text-center py-3 border rounded-lg bg-white hover:bg-gray-100 font-semibold">
                        إلغاء
                    </a>

                    <button type="submit"
                            class="flex-1 py-3 rounded-lg bg-blue-600 text-white font-semibold hover:bg-blue-700 shadow">
                        تأكيد الحجز
                    </button>
                </div>

            </form:form>

        </div>
    </div>

</div>

</body>
</html>
