<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Maslahati | Sign In</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">

<div class="flex h-screen">
    <div class="w-1/2 relative">
        <div class="absolute inset-0 bg-black bg-opacity-60"></div>
        <div class="absolute top-1/4 left-14 text-white">
            <h1 class="text-5xl font-bold mb-4">🛠️ مصلحــاتي</h1>
            <h2 class="text-3xl font-semibold mb-4">Connect with Trusted Professionals</h2>
        </div>
    </div>

    <div class="w-1/2 flex items-center justify-center">
        <div class="w-96">
            <div class="flex justify-around mb-8">
                <a href="/login" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-2">Sign In</a>
                <a href="/signup" class="text-gray-500 hover:text-blue-600 pb-2">Sign Up</a>
            </div>

            <c:if test="${not empty error}">
                <div class="bg-red-200 text-red-800 p-3 rounded mb-4">${error}</div>
            </c:if>

            <form action="/login" method="post">

                <div class="mb-4">
                    <label class="font-medium">Choose Account Type</label>
                    <select name="role" class="w-full p-3 border rounded-lg mt-1" required>
                        <option value="">-- Select Role --</option>
                        <option value="USER">User</option>
                        <option value="WORKER">Craftsman</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="font-medium">Email Address</label>
                    <input type="email" name="email" class="w-full p-3 border rounded-lg mt-1" placeholder="you@example.com" required>
                </div>

                <div class="mb-6">
                    <label class="font-medium">Password</label>
                    <input type="password" name="password" class="w-full p-3 border rounded-lg mt-1" placeholder="••••••••" required>
                </div>

                <button type="submit" class="w-full bg-black text-white p-3 rounded-lg hover:bg-gray-900 mb-4">Sign In</button>

                <div class="text-center text-gray-600 text-sm">
                    New to مصلحاتي؟ <a class="text-blue-600 font-semibold" href="/signup">Create a new account</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
