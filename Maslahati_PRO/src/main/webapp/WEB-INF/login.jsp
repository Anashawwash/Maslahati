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

            <p class="max-w-md leading-7 text-gray-200">
                Find qualified plumbers, electricians, and technicians for all your home maintenance needs.
                Quality service, reliable professionals, seamless experience.
            </p>

            <div class="mt-10 space-y-3">
                <p class="text-xl"><span class="font-bold text-3xl">1000+</span> Professionals</p>
                <p class="text-xl"><span class="font-bold text-3xl">5000+</span> Jobs Done</p>
                <p class="text-xl"><span class="font-bold text-3xl">4.8★</span> Rating</p>
            </div>
        </div>
    </div>

    <div class="w-1/2 flex items-center justify-center">

        <div class="w-96">

            <div class="flex justify-around mb-8">
                <a href="/login" class="text-blue-600 font-semibold border-b-2 border-blue-600 pb-2">Sign In</a>
                <a href="/signup" class="text-gray-500 hover:text-blue-600 pb-2">Sign Up</a>
            </div>

            <h2 class="text-2xl font-bold mb-2">Welcome back</h2>
            <p class="text-gray-500 mb-6">Sign in to your account to continue</p>

            <form action="/login" method="post">

                <input type="hidden" id="roleInput" name="role" value="USER">

                <div class="mb-6">
                    <label class="font-medium">Choose Account Type</label>

                    <div class="flex gap-4 mt-2">

                        <button type="button"
                                class="flex-1 border p-2 rounded-lg bg-blue-600 text-white">
                            User
                        </button>

                        <button type="button"
                                class="flex-1 border p-2 rounded-lg hover:bg-gray-200">
                            Craftsman
                        </button>

                    </div>
                </div>


                <label class="font-medium">Email Address</label>
                <input type="email" name="email"
                       class="w-full p-3 border rounded-lg mt-1 mb-4"
                       placeholder="you@example.com" required>

                <label class="font-medium">Password</label>
                <input type="password" name="password"
                       class="w-full p-3 border rounded-lg mt-1 mb-6"
                       placeholder="••••••••" required>

                <button type="submit"
                        class="w-full bg-black text-white p-3 rounded-lg mb-4 hover:bg-gray-900">
                    Sign In
                </button>

                <div class="text-center text-gray-600 text-sm">
                    New to مصلحاتي؟
                    <a class="text-blue-600 font-semibold" href="/signup">Create a new account</a>
                </div>

            </form>
        </div>
    </div>

</div>


</body>
</html>
