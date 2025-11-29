<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>احجز موعد</title>
    <!-- Tailwind CSS CDN for demonstration. In a real project, you should use a build process. -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for better RTL form appearance */
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #374151; /* text-gray-700 */
            text-align: right;
        }
        .form-input, .form-textarea, .form-select {
            display: block;
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #D1D5DB; /* border-gray-300 */
            border-radius: 0.5rem; /* rounded-lg */
            font-size: 1rem;
            line-height: 1.5;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .form-input:focus, .form-textarea:focus, .form-select:focus {
            border-color: #3B82F6; /* blue-500 */
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.5); /* ring-blue-500/50 */
            outline: none;
        }
        .form-input::placeholder, .form-textarea::placeholder {
            color: #9CA3AF; /* text-gray-400 */
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen p-4">

<!-- Modal/Form Container -->
<div class="bg-white w-full max-w-xl rounded-xl shadow-2xl overflow-hidden">

    <!-- Header -->
    <div class="p-6 border-b border-gray-200 flex justify-between items-center">
        <h1 class="text-2xl font-bold text-gray-900">احجز موعد</h1>
        <button class="text-gray-400 hover:text-gray-600 text-xl">
            &times;
        </button>
    </div>

    <!-- Form Body -->
    <div class="p-6 space-y-6">

        <!-- Service Provider Info Box -->
        <div class="bg-blue-50 p-4 rounded-lg shadow-sm">
            <p class="text-lg font-bold text-gray-900 mb-1">${serv.user.userName}</p>
            <p class="text-sm text-gray-600 mb-2">${serv.name}</p>
        </div>

        <!-- The Spring Form -->
        <!-- NOTE: Replace "bookingForm" with the actual name of your model attribute -->
        <form:form modelAttribute="bookingForm" method="POST" action="/booking" class="space-y-6">

            <form:hidden path="user" value="${User.id}"/>
            <form:hidden path="service" value="${serv.id}"/>

            <!-- Address Field -->
            <div>
                <label for="address" class="form-label flex items-center">
                    العنوان
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M17.657 16.727A8 8 0 016.343 5.273L12 1l5.657 4.273z" />
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 13a3 3 0 100-6 3 3 0 000 6z" />
                    </svg>
                </label>
                <!-- Assuming 'address' is a field in your BookingForm model -->
                <form:input path="address" id="address" value="${User.location}" type="text" placeholder="أدخل العنوان الكامل" class="form-input text-right" />
                <form:errors path="address" cssClass="text-red-500 text-sm mt-1" />
            </div>

            <!-- Phone Number Field -->
            <div>
                <label for="phoneNumber" class="form-label">رقم الجوال</label>
                <!-- Assuming 'phoneNumber' is a field in your BookingForm model -->
                <form:input path="phoneNumber" value="${User.phoneNumber}" id="phoneNumber" type="tel" placeholder="05XXXXXXXX" class="form-input text-left" />
                <form:errors path="phoneNumber" cssClass="text-red-500 text-sm mt-1" />
            </div>

            <!-- Problem Description Field -->
            <div>
                <label for="problemDescription" class="form-label flex items-center">
                    وصف المشكلة
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                    </svg>
                </label>
                <!-- Assuming 'problemDescription' is a field in your BookingForm model -->
                <form:textarea path="problemDesc" id="problemDescription" rows="4" placeholder="... اشرح المشكلة بالتفصيل" class="form-textarea text-right" />
                <form:errors path="problemDesc" cssClass="text-red-500 text-sm mt-1" />
            </div>

            <!-- Buttons (Form Footer) -->
            <div class="flex justify-end space-x-4 space-x-reverse pt-4">
                <!-- Cancel Button -->
                <button type="button" class="flex-1 px-6 py-3 text-gray-700 font-bold bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition duration-150">
                    إلغاء
                </button>

                <!-- Submit Button -->
                <button type="submit" class="flex-1 px-6 py-3 text-white font-bold bg-blue-600 rounded-lg hover:bg-blue-700 transition duration-150 shadow-md">
                    تأكيد الحجز
                </button>
            </div>

        </form:form>
    </div>
</div>

</body>
</html>
