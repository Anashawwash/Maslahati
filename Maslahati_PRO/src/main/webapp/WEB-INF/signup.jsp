<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <meta charset="UTF-8">
    <title>مصلحاتي | إنشاء حساب</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Leaflet Map -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
</head>

<body class="bg-gray-50">

<div class="flex min-h-screen">

    <!-- Left Banner -->
    <div class="w-1/2 relative hidden md:block bg-cover bg-center"
         style="background-image: url('/images/craftsman.jpg'); background-color: #1a1a1a;">

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

            <div class="flex justify-center mb-8 border-b border-gray-200">
                <a href="/login" class="text-gray-500 hover:text-blue-600 px-4 py-2">تسجيل دخول</a>
                <a href="/signup" class="text-blue-600 font-semibold border-b-2 border-blue-600 px-4 py-2">إنشاء حساب</a>
            </div>

            <h2 class="text-2xl font-bold mb-6 text-center">إنشاء حساب</h2>
            <div class="mb-4">
                <a href="/">
                    <button type="button"
                            class="bg-gray-300 hover:bg-gray-400 text-gray-700 font-semibold py-2 px-4 rounded transition">
                        العودة
                    </button>

                </a>
            </div>
            <form:form action="/signup" method="post" modelAttribute="newUser" class="space-y-4">

                <form:hidden path="craftsman" value="${type}" />

                <div>
                    <label class="font-medium block mb-1">اسم المستخدم</label>
                    <form:input path="userName"
                                cssClass="w-full p-3 border border-gray-300 rounded-lg focus:ring-blue-500"
                                placeholder="اكتب اسم المستخدم" required="true"/>
                    <form:errors path="userName" cssClass="text-red-500 text-sm mt-1"/>
                </div>

                <div>
                    <label class="font-medium block mb-1">البريد الإلكتروني</label>
                    <form:input path="email" type="email"
                                cssClass="w-full p-3 border border-gray-300 rounded-lg focus:ring-blue-500"
                                placeholder="example@email.com" required="true"/>
                    <form:errors path="email" cssClass="text-red-500 text-sm mt-1"/>
                </div>

                <div>
                    <label class="font-medium block mb-1">رقم الهاتف</label>
                    <form:input path="phoneNumber"
                                cssClass="w-full p-3 border border-gray-300 rounded-lg focus:ring-blue-500"
                                placeholder="059-xxxxxxx" required="true"/>
                    <form:errors path="phoneNumber" cssClass="text-red-500 text-sm mt-1"/>
                </div>


                <!-- 🔥 Location -->
                <div>
                    <label class="font-medium block mb-1">الموقع *</label>
                    <div class="flex gap-2 w-full">
                         <input type="text" id="location" name="location"
                               class="flex-1 rounded-md p-3 bg-gray-50 border border-gray-300
                                      placeholder-gray-500 focus:ring-2 focus:ring-blue-500"
                               placeholder="اختر موقعك من الخريطة" readonly/>

                        <button type="button" id="open-map"
                                class="border border-gray-300 px-3 rounded-md hover:bg-blue-600 hover:text-white">
                            اختر من الخريطة
                        </button>
                    </div>

                    <!-- Hidden Coordinate Fields -->
                    <input type="hidden" id="latitude" name="latitude">
                    <input type="hidden" id="longitude" name="longitude">
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="font-medium block mb-1">كلمة المرور</label>
                        <form:password path="password"
                                       cssClass="w-full p-3 border border-gray-300 rounded-lg focus:ring-blue-500"
                                       placeholder="••••••••" required="true"/>
                        <form:errors path="password" cssClass="text-red-500 text-sm mt-1"/>
                    </div>

                    <div>
                        <label class="font-medium block mb-1">تأكيد كلمة المرور</label>
                        <form:password path="confirmPassword"
                                       cssClass="w-full p-3 border border-gray-300 rounded-lg focus:ring-blue-500"
                                       placeholder="••••••••" required="true"/>
                        <form:errors path="confirmPassword" cssClass="text-red-500 text-sm mt-1"/>
                    </div>
                </div>

                <button type="submit"
                        class="w-full bg-blue-600 text-white p-3 rounded-lg font-semibold hover:bg-blue-700">
                    إنشاء حساب
                </button>
            </form:form>

            <p class="text-center text-gray-500 text-sm mt-6">
                لديك حساب؟ <a href="/login" class="text-blue-600 font-semibold">تسجيل دخول</a>
            </p>
        </div>
    </div>
</div>



<!-- 🌍 MAP POPUP -->
<div id="map-popup"
     class="hidden fixed inset-0 z-50 bg-black bg-opacity-60 flex justify-center items-center">

    <div class="bg-white rounded-lg w-[90%] md:w-[600px] p-4">
        <h2 class="text-lg font-bold mb-3">اختر موقعك من الخريطة</h2>

        <div id="map" class="w-full h-64 rounded-md border"></div>

        <div class="flex justify-between mt-4">
            <button id="cancel-map" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400">
                إلغاء
            </button>
            <button id="confirm-location" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                تأكيد
            </button>
        </div>
    </div>
</div>


<script type="text/javascript" isELIgnored="true">
    document.addEventListener("DOMContentLoaded", () => {
        const mapPopup = document.getElementById("map-popup");
        const locationBtn = document.getElementById("open-map");
        const confirmBtn = document.getElementById("confirm-location");
        const cancelBtn = document.getElementById("cancel-map");
        const latInput = document.getElementById("latitude");
        const lonInput = document.getElementById("longitude");
        const locationInput = document.getElementById("location");

        let map, marker;

        locationBtn.addEventListener("click", (e) => {
            e.preventDefault();
            mapPopup.classList.remove("hidden");

            if (!map) {
                map = L.map("map").setView([0, 0], 2);
                L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
                    attribution: '&copy; OpenStreetMap contributors'
                }).addTo(map);

                marker = L.marker([0, 0], {draggable: true}).addTo(map);

                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(
                        (pos) => {
                            const lat = pos.coords.latitude;
                            const lon = pos.coords.longitude;
                            map.invalidateSize();
                            marker._icon && marker.update();
                            map.setView([lat, lon], 15);
                            marker.setLatLng([lat, lon]);
                        },
                        () => {
                            alert("Unable to get your location. You can move the marker manually.");
                            map.setView([31.9522, 35.2332], 8);
                            marker.setLatLng([31.9522, 35.2332]);
                        }
                    );
                }
            }

            setTimeout(() => map.invalidateSize(), 100);
        });

        confirmBtn.addEventListener("click", async () => {
            const pos = marker.getLatLng();
            const lat = Number(pos.lat);
            const lon = Number(pos.lng);

            console.log("lat:", lat, "lon:", lon);
            console.log(`URL: /api/location/reverse?lat=\${lat}&lon=\${lon}`);

            latInput.value = lat;
            lonInput.value = lon;

            try {
                const response = await fetch(`/api/location/reverse?lat=\${lat}&lon=\${lon}`);
                const data = await response.json();

                console.log("Reverse:", data);

                locationInput.value = data.display_name || "الموقع غير معروف";
            } catch (error) {
                console.error("Error:", error);
                locationInput.value = "خطأ أثناء جلب الموقع";
            }
            mapPopup.classList.add("hidden");

        });



        cancelBtn.addEventListener("click", () => mapPopup.classList.add("hidden"));

    });
</script>

</body>
</html>
