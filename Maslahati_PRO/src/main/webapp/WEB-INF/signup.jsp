<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Maslahati | Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">

<div class="flex min-h-screen">

    <!-- Left Side: Banner -->
    <div class="w-1/2 relative hidden md:block">
        <div class="absolute inset-0 bg-black bg-opacity-60"></div>
        <div class="absolute top-1/4 left-12 text-white">
            <h1 class="text-5xl font-bold mb-4">🛠️ مصلحــاتي</h1>
            <h2 class="text-3xl font-semibold mb-4">Join Us Today</h2>
            <p class="max-w-sm leading-7 text-gray-200">
                Create your account and get access to trusted professionals and seamless home service experience.
            </p>
        </div>
    </div>

    <!-- Right Side: Form -->
    <div class="flex-1 flex items-center justify-center px-4">
        <div class="w-full max-w-md bg-white p-10 rounded-xl shadow-lg">

            <!-- Navigation Tabs -->
            <div class="flex justify-center mb-8 border-b border-gray-200">
                <a href="/login" class="text-gray-500 hover:text-blue-600 px-4 py-2">Sign In</a>
                <a href="/signup" class="text-blue-600 font-semibold border-b-2 border-blue-600 px-4 py-2">Sign Up</a>
            </div>

            <h2 class="text-2xl font-bold mb-6 text-center">Create Account</h2>

            <c:if test="${not empty error}">
                <div class="bg-red-100 text-red-700 p-3 rounded mb-4 text-center">${error}</div>
            </c:if>

            <form action="/signup" method="post" class="space-y-4">

                <!-- Username -->
                <div>
                    <label class="font-medium block mb-1">Username</label>
                    <input type="text" name="username" placeholder="Enter your username"
                           class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                </div>

                <!-- Email -->
                <div>
                    <label class="font-medium block mb-1">Email Address</label>
                    <input type="email" name="email" placeholder="you@example.com"
                           class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                </div>

                <!-- Phone & Location in 2 columns -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="font-medium block mb-1">Phone Number</label>
                        <input type="text" name="phone" placeholder="059-xxxxxxx"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                    </div>
                    <div>
                        <label class="font-medium block mb-1">Location</label>
                        <input type="text" name="location" placeholder="City / Area"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                    </div>
                </div>

                <!-- Role -->
                <div>
                    <label class="font-medium block mb-1">Account Type</label>
                    <select name="role" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        <option value="WORKER">Worker</option>
                        <option value="USER">User</option>
                    </select>
                </div>

                <!-- Password & Confirm Password -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="font-medium block mb-1">Password</label>
                        <input type="password" name="password" placeholder="••••••••"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                    </div>
                    <div>
                        <label class="font-medium block mb-1">Confirm Password</label>
                        <input type="password" name="confirmPassword" placeholder="••••••••"
                               class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                    </div>
                </div>

                <button type="submit"
                        class="w-full bg-blue-600 text-white p-3 rounded-lg font-semibold hover:bg-blue-700 transition">
                    Create Account
                </button>
            </form>

            <p class="text-center text-gray-500 text-sm mt-6">
                Already have an account? <a href="/login" class="text-blue-600 font-semibold">Sign In</a>
            </p>

        </div>
    </div>

</div>

</body>
</html>
