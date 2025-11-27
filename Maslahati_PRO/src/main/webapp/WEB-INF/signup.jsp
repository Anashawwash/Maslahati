<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>Maslahati | Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">
<jsp:include page="includes/header.jsp" />
<div class="flex h-screen">

    <!-- Same Left Side -->
    <div class="w-1/2 relative">
        <img src="/images/tools-bg.jpg" class="w-full h-full object-cover">
        <div class="absolute inset-0 bg-black bg-opacity-60"></div>

        <div class="absolute top-1/4 left-14 text-white">
            <h1 class="text-5xl font-bold mb-4">🛠️ مصلحــاتي</h1>
            <h2 class="text-3xl font-semibold mb-4">Join Us Today</h2>
            <p class="max-w-md leading-7 text-gray-200">
                Create your account and get access to trusted professionals and seamless home service experience.
            </p>
        </div>
    </div>

    <!-- Right Side -->
    <div class="w-1/2 flex items-center justify-center">

        <div class="w-96">

            <div class="flex justify-around mb-8">
                <a href="/login" class="text-gray-500 hover:text-blue-600 pb-2">Sign In</a>
                <a href="/signup" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-2">Sign Up</a>
            </div>

            <h2 class="text-2xl font-bold mb-2">Create Account</h2>

            <form action="/signup" method="post">

                <label class="font-medium">Full Name</label>
                <input type="text" name="name"
                       class="w-full p-3 border rounded-lg mt-1 mb-4" required>

                <label class="font-medium">Email Address</label>
                <input type="email" name="email"
                       class="w-full p-3 border rounded-lg mt-1 mb-4" required>

                <label class="font-medium">Password</label>
                <input type="password" name="password"
                       class="w-full p-3 border rounded-lg mt-1 mb-6" required>

                <button type="submit"
                        class="w-full bg-blue-600 text-white p-3 rounded-lg mb-4 hover:bg-blue-700">
                    Create Account
                </button>

            </form>

        </div>
    </div>

</div>
<!-- Include Footer -->
<jsp:include page="includes/footer.jsp" />
</body>
</html>
