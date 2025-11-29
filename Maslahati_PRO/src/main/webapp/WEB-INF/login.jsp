<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Maslahati | Sign In</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<div class="flex min-h-screen">

    <!-- Left Banner -->
    <div class="w-1/2 relative hidden md:block bg-cover bg-center"
         style="background-image: url('/images/craftsman.jpg'); background-color: #1a1a1a;">

        <!-- طبقة التعتيم -->
        <div class="absolute inset-0 bg-black bg-opacity-60"></div>

        <div class="absolute top-1/4 left-12 text-white">
            <h1 class="text-5xl font-bold mb-4">🛠️ مصلحــاتي</h1>
            <h2 class="text-3xl font-semibold mb-4">Connect with Trusted Professionals</h2>
            <p class="max-w-sm leading-7 text-gray-200">
                Sign in to manage your account, contact professionals, and get things fixed easily.
            </p>
        </div>
    </div>


    <!-- Right Form -->
    <div class="flex-1 flex items-center justify-center px-4">
        <div class="w-full max-w-md bg-white p-10 rounded-xl shadow-lg">

            <!-- Navigation Tabs -->
            <div class="flex justify-center mb-8 border-b border-gray-200">
                <a href="/login" class="text-blue-600 font-semibold border-b-2 border-blue-600 px-4 py-2">Sign In</a>
                <a href="/#shoce" class="text-gray-500 hover:text-blue-600 px-4 py-2">Sign Up</a>
            </div>

            <h2 class="text-2xl font-bold mb-6 text-center">Sign In</h2>

            <form:form action="/login" method="post" modelAttribute="newUser" class="space-y-4">

                <!-- Hidden Role -->

                <!-- Email -->
                <div>
                    <label class="font-medium block mb-1">Email Address</label>
                    <form:input path="loginEmail" type="email"
                                cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                placeholder="you@example.com" required="true"/>
                    <form:errors path="loginEmail" cssClass="text-red-500 text-sm mt-1 block"/>
                </div>

                <!-- Password -->
                <div>
                    <label class="font-medium block mb-1">Password</label>
                    <form:password path="confirm" cssClass="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="••••••••" required="true"/>
                    <form:errors path="confirm" cssClass="text-red-500 text-sm mt-1 block"/>
                </div>

                <!-- Submit Button -->
                <button type="submit"
                        class="w-full bg-blue-600 text-white p-3 rounded-lg font-semibold hover:bg-blue-700 transition">
                    Sign In
                </button>
            </form:form>

            <p class="text-center text-gray-500 text-sm mt-6">
                New to مصلحاتي؟ <a href="/signup" class="text-blue-600 font-semibold">Create a new account</a>
            </p>

        </div>
    </div>

</div>

</body>
</html>
