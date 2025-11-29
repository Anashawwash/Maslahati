<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <title>Craftsman Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
<div class="bg-gray-100 flex" dir="rtl">
    <div class="w-64 h-screen bg-blue-900 text-white flex flex-col p-6">
        <h2 class="text-2xl font-bold mb-10">🛠️ لوحة الحرفي</h2>

        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">تعديل الملف الشخصي</a>
        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">عرض الطلبات</a>
        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="#">التقييمات</a>
        <a class="py-2 mb-2 hover:bg-blue-700 rounded px-3" href="/addservice">إضافة خدمة جديدة</a>

        <div class="mt-auto">
            <a class="py-2 mt-20 hover:bg-red-600 bg-red-500 text-center rounded block" href="/logout">تسجيل الخروج</a>
        </div>
    </div>

    <div class="flex-1 p-10">

        <h1 class="text-3xl font-bold mb-3">مرحبًا، <span class="text-blue-700">${worker.userName}</span></h1>
        <p class="text-gray-600 mb-8">هنا نظرة عامة على مهاراتك المهنية</p>

        <div class="bg-white rounded-xl shadow p-6 mb-10">
            <h2 class="text-xl font-bold mb-4">معلوماتك الشخصية</h2>
            <div class="grid grid-cols-2 gap-6">
                <p><span class="font-medium">الاسم:</span> ${worker.userName}</p>
                <p><span class="font-medium">البريد الإلكتروني:</span> ${worker.email}</p>
                <p><span class="font-medium">عدد الخدمات المقدمة:</span> ${many}</p>
                <p><span class="font-medium">الخبرة:</span> سنوات</p>
            </div>
        </div>

        <div class="grid grid-cols-3 gap-6">

            <div class="bg-white shadow rounded-xl p-6 text-center">
                <h3 class="text-lg font-bold text-gray-700">إجمالي المستخدمين المخدومين</h3>
                <p class="text-4xl font-extrabold text-blue-700 mt-3"></p>
            </div>

            <div class="bg-white shadow rounded-xl p-6 text-center">
                <h3 class="text-lg font-bold text-gray-700">التقييم العام</h3>
                <p class="text-4xl font-extrabold text-yellow-500 mt-3"></p>
            </div>

            <div class="bg-white shadow rounded-xl p-6 text-center">
                <h3 class="text-lg font-bold text-gray-700">الطلبات المكتملة</h3>
                <p class="text-4xl font-extrabold text-green-600 mt-3">0999</p>
            </div>

        </div>

    </div>
</div>
<!-- Include Footer -->
<jsp:include page="includes/footer.jsp" />
</body>
</html>
