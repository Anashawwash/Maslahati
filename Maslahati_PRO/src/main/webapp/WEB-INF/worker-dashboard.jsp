<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Craftsman Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex">

<div class="w-64 h-screen bg-blue-900 text-white flex flex-col p-6">
    <h2 class="text-2xl font-bold mb-10">🛠️ Craftsman Panel</h2>

    <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">Edit Profile</a>
    <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">View Requests</a>
    <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">Ratings</a>
    <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">Add New Service</a>
    <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">Orders List</a>
    <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">Contact Support</a>

    <div class="mt-auto">
        <a class="py-2 mt-20 hover:bg-red-600 bg-red-500 text-center rounded block" href="/logout">Logout</a>
    </div>
</div>

<div class="flex-1 p-10">

    <h1 class="text-3xl font-bold mb-3">Welcome,
        <span class="text-blue-700">${worker.userName}</span>
    </h1>

    <p class="text-gray-600 mb-8">Here is your professional overview</p>

    <div class="bg-white rounded-xl shadow p-6 mb-10">
        <h2 class="text-xl font-bold mb-4">Your Information</h2>

        <div class="grid grid-cols-2 gap-6">
            <p><span class="font-medium">Name:</span> ${worker.userName}</p>
            <p><span class="font-medium">Email:</span> ${worker.email}</p>
            <p><span class="font-medium">Phone:</span> ${worker.phone}</p>
            <p><span class="font-medium">Location:</span> ${worker.location}</p>
        </div>
    </div>

    <div class="grid grid-cols-3 gap-6">

        <div class="bg-white shadow rounded-xl p-6 text-center">
            <h3 class="text-lg font-bold text-gray-700">Total Users Served</h3>
            <p class="text-4xl font-extrabold text-blue-700 mt-3">${usersCount}</p>
        </div>

        <div class="bg-white shadow rounded-xl p-6 text-center">
            <h3 class="text-lg font-bold text-gray-700">Overall Rating</h3>
            <p class="text-4xl font-extrabold text-yellow-500 mt-3">${rating}</p>
        </div>

        <div class="bg-white shadow rounded-xl p-6 text-center">
            <h3 class="text-lg font-bold text-gray-700">Completed Orders</h3>
            <p class="text-4xl font-extrabold text-green-600 mt-3">${completedOrders}</p>
        </div>

    </div>

</div>
</body>
</html>
