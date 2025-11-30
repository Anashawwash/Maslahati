<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>مصلحاتي | إنشاء حساب</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">

<div class="flex min-h-screen">

    <!-- Left Banner -->
    <div class="w-1/2 relative hidden md:block bg-cover bg-center"
         style="background-image: url('/images/craftsman.jpg'); background-color: #1a1a1a;">

        <!-- طبقة التعتيم -->
        <div class="absolute inset-0 bg-black bg-opacity-60"></div>

        <div class="absolute top-1/4 left-12 text-white text-right">
            <h1 class="text-5xl font-bold mb-4">🛠️ مصلحــاتي</h1>
            <h2 class="text-3xl font-semibold mb-4">انضم إلينا اليوم</h2>
            <p class="max-w-sm leading-7 text-gray-200">
                قم بإنشاء حساب للحصول على أفضل الخدمات المنزلية والتواصل مع أمهر الحرفيين بسهولة.
            </p>
        </div>
    </div>


    <!-- Right Form -->
    <div class="flex-1 flex items-center justify-center px-4">
        <div class="w-full max-w-md bg-white p-10 rounded-xl shadow-lg">

            <!-- Navigation Tabs -->
            <div class="flex justify-center mb-8 border-b border-gray-200">
                <a href="/login" class="text-gray-500 hover:text-blue-600 px-4 py-2">تسجيل دخول</a>
                <a href="/signup" class="text-blue-600 font-semibold border-b-2 border-blue-600 px-4 py-2">إنشاء حساب</a>
            </div>

            <h2 class="text-2xl font-bold mb-6 text-center">إنشاء حساب</h2>

            <form:form action="/signup" method="post" modelAttribute="newUser" class="space-y-4">

                <!-- Hidden Role -->
                <form:hidden path="craftsman" value="${type}" />

                <!-- Username -->
                <div>
                    <label class="font-medium block mb-1">اسم المستخدم</label>
                    <form:input path="userName"
                                cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                placeholder="اكتب اسم المستخدم" required="true"/>
                    <form:errors path="userName" cssClass="text-red-500 text-sm mt-1 block"/>
                </div>

                <!-- Email -->
                <div>
                    <label class="font-medium block mb-1">البريد الإلكتروني</label>
                    <form:input path="email" type="email"
                                cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                placeholder="example@email.com" required="true"/>
                    <form:errors path="email" cssClass="text-red-500 text-sm mt-1 block"/>
                </div>

                <!-- Phone & Location -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                    <div>
                        <label class="font-medium block mb-1">رقم الهاتف</label>
                        <form:input path="phoneNumber"
                                    cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                    placeholder="059-xxxxxxx" required="true"/>
                        <form:errors path="phoneNumber" cssClass="text-red-500 text-sm mt-1 block"/>
                    </div>

                    <div>
                        <label class="font-medium block mb-1">الموقع</label>
                        <form:input path="location"
                                    cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                    placeholder="المدينة / المنطقة" required="true"/>
                        <form:errors path="location" cssClass="text-red-500 text-sm mt-1 block"/>
                    </div>
                </div>

                <!-- Password & Confirm Password -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

                    <div>
                        <label class="font-medium block mb-1">كلمة المرور</label>
                        <form:password path="password"
                                       cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                       placeholder="••••••••" required="true"/>
                        <form:errors path="password" cssClass="text-red-500 text-sm mt-1 block"/>
                    </div>

                    <div>
                        <label class="font-medium block mb-1">تأكيد كلمة المرور</label>
                        <form:password path="confirmPassword"
                                       cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                       placeholder="••••••••" required="true"/>
                        <form:errors path="confirmPassword" cssClass="text-red-500 text-sm mt-1 block"/>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit"
                        class="w-full bg-blue-600 text-white p-3 rounded-lg font-semibold hover:bg-blue-700 transition">
                    إنشاء حساب
                </button>
            </form:form>


            <p class="text-center text-gray-500 text-sm mt-6">
                لديك حساب بالفعل؟ <a href="/login" class="text-blue-600 font-semibold">تسجيل دخول</a>
            </p>

        </div>
    </div>

</div>

</body>
</html>
