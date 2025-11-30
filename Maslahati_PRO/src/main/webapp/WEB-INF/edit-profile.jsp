<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>تعديل الملف الشخصي - سوق الصنايعية</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Cairo', sans-serif;
        }
        .input-error {
            border-color: #ef4444 !important;
        }
        .input-success {
            border-color: #10b981 !important;
        }
    </style>
</head>
<body class="bg-[#f9fafb] min-h-screen">
<div class="max-w-4xl mx-auto p-6 py-12">
    <!-- Header -->
    <div class="mb-8">
        <a href="profile.jsp" class="inline-flex items-center gap-2 text-gray-600 hover:text-[#2563eb] mb-4 transition-colors">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="m15 18-6-6 6-6"/>
            </svg>
            العودة إلى الملف الشخصي
        </a>
        <h1 class="text-4xl font-bold text-gray-900 mb-2">تعديل الملف الشخصي</h1>
        <p class="text-gray-600 text-lg">قم بتحديث معلوماتك الشخصية</p>
    </div>

    <!-- Form Card -->
    <div class="bg-white rounded-[32px] p-8 md:p-12 shadow-sm">
        <form id="editProfileForm" action="processEditProfile.jsp" method="post" enctype="multipart/form-data">
            <!-- Avatar Upload -->
            <div class="mb-8">
                <label class="block text-gray-900 font-semibold mb-4 text-lg">الصورة الشخصية</label>
                <div class="flex items-center gap-6">
                    <div class="relative">
                        <img id="avatarPreview" src="https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx1c2VyJTIwYXZhdGFyJTIwbWFufGVufDF8fHx8MTc2NDA3NTM5MHww&ixlib=rb-4.1.0&q=80&w=1080"
                             alt="Avatar"
                             class="w-24 h-24 rounded-full object-cover border-4 border-gray-100">
                        <label for="avatarUpload" class="absolute bottom-0 left-0 w-8 h-8 bg-[#2563eb] hover:bg-[#1d4ed8] rounded-full flex items-center justify-center cursor-pointer transition-colors">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-white">
                                <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/>
                                <polyline points="17 8 12 3 7 8"/>
                                <line x1="12" x2="12" y1="3" y2="15"/>
                            </svg>
                        </label>
                        <input type="text" id="avatarUpload" name="avatar" accept="image/*" class="hidden" onchange="previewAvatar(event)">
                    </div>
                    <div>
                        <p class="text-gray-900 font-medium mb-1">تحميل صورة جديدة</p>
                    </div>
                </div>
            </div>

            <!-- Basic Information -->
            <div class="space-y-6 mb-8">
                <h3 class="text-xl font-bold text-gray-900 flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                        <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                        <circle cx="12" cy="7" r="4"/>
                    </svg>
                    المعلومات الأساسية
                </h3>

                <!-- Full Name -->
                <div>
                    <label for="fullName" class="block text-gray-700 font-medium mb-2">الاسم الكامل</label>
                    <div class="relative">
                        <input type="text"
                               id="fullName"
                               name="fullName"
                               value="محمد أحمد علي"
                               required
                               class="w-full px-5 py-4 pr-12 border-2 border-gray-200 rounded-[20px] focus:outline-none focus:ring-2 focus:ring-[#2563eb] focus:border-transparent transition-all">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400">
                            <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/>
                            <circle cx="12" cy="7" r="4"/>
                        </svg>
                    </div>
                </div>

                <!-- Email -->
                <div>
                    <label for="email" class="block text-gray-700 font-medium mb-2">البريد الإلكتروني</label>
                    <div class="relative">
                        <input type="email"
                               id="email"
                               name="email"
                               value="mohamed.ahmed@email.com"
                               required
                               class="w-full px-5 py-4 pr-12 border-2 border-gray-200 rounded-[20px] focus:outline-none focus:ring-2 focus:ring-[#2563eb] focus:border-transparent transition-all">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400">
                            <rect width="20" height="16" x="2" y="4" rx="2"/>
                            <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                        </svg>
                    </div>
                </div>

                <!-- Phone -->
                <div>
                    <label for="phone" class="block text-gray-700 font-medium mb-2">رقم الهاتف</label>
                    <div class="relative">
                        <input type="tel"
                               id="phone"
                               name="phone"
                               value="+20 123 456 7890"
                               required
                               class="w-full px-5 py-4 pr-12 border-2 border-gray-200 rounded-[20px] focus:outline-none focus:ring-2 focus:ring-[#2563eb] focus:border-transparent transition-all">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-400">
                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                        </svg>
                    </div>
                </div>

                <!-- Bio -->
                <div>
                    <label for="bio" class="block text-gray-700 font-medium mb-2">نبذة عنك</label>
                    <textarea id="bio"
                              name="bio"
                              rows="4"
                              placeholder="اكتب نبذة مختصرة عنك..."
                              class="w-full px-5 py-4 border-2 border-gray-200 rounded-[20px] focus:outline-none focus:ring-2 focus:ring-[#2563eb] focus:border-transparent transition-all resize-none">أنا مستخدم نشط في سوق الصنايعية أبحث عن أفضل الحرفيين المحترفين.</textarea>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="flex flex-col sm:flex-row gap-4 pt-8 border-t border-gray-200">
                <button type="submit"
                        class="flex-1 bg-[#2563eb] hover:bg-[#1d4ed8] text-white py-4 rounded-[20px] transition-colors font-semibold text-lg flex items-center justify-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/>
                        <polyline points="22 4 12 14.01 9 11.01"/>
                    </svg>
                    حفظ التغييرات
                </button>
                <a href="profile.jsp"
                   class="flex-1 bg-gray-100 hover:bg-gray-200 text-gray-700 py-4 rounded-[20px] transition-colors font-semibold text-lg flex items-center justify-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 6 6 18"/>
                        <path d="m6 6 12 12"/>
                    </svg>
                    إلغاء
                </a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
