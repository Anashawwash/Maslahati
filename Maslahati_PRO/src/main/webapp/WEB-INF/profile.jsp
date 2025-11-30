<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>الملف الشخصي </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Cairo', sans-serif;
        }
    </style>
</head>
<body>
<jsp:include page="includes/header.jsp" />
<div class="bg-[#f9fafb]">
<div class="min-h-screen flex">
    <!-- Sidebar -->
    <aside class="w-72 bg-white border-l border-gray-200 hidden lg:block">
        <div class="p-8">
            <div class="flex items-center gap-3 mb-12">
                <div class="w-10 h-10 bg-[#2563eb] rounded-full flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-white">
                        <path d="m15 12-8.5 8.5c-.83.83-2.17.83-3 0 0 0 0 0 0 0a2.12 2.12 0 0 1 0-3L12 9"/>
                        <path d="M17.64 15 22 10.64"/>
                        <path d="m20.91 11.7-1.25-1.25c-.6-.6-.93-1.4-.93-2.25v-.86L16.01 4.6a5.56 5.56 0 0 0-3.94-1.64H9l.92.82A6.18 6.18 0 0 1 12 8.4v1.56l2 2h2.47l2.26 1.91"/>
                    </svg>
                </div>
                <span class="font-bold text-gray-900 text-lg">مصلحاتي</span>
            </div>


            <div class="mt-auto pt-8 border-t border-gray-200 mt-32">
                <a href="login.jsp" class="flex items-center gap-3 px-4 py-3 text-red-600 hover:bg-red-50 rounded-2xl transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                        <polyline points="16 17 21 12 16 7"/>
                        <line x1="21" x2="9" y1="12" y2="12"/>
                    </svg>
                    <span>تسجيل الخروج</span>
                </a>
            </div>
        </div>
    </aside>

    <!-- Main Content -->
    <main class="flex-1 overflow-auto">
        <div class="max-w-5xl mx-auto p-6 md:p-12">
            <!-- Hero Section -->
            <div class="bg-white rounded-[32px] p-8 md:p-12 mb-6 shadow-sm">
                <div class="flex flex-col md:flex-row items-center md:items-start gap-8">
                    <!-- Avatar -->
                    <div class="relative">
                        <div class="w-32 h-32 md:w-40 md:h-40 rounded-full overflow-hidden border-4 border-gray-100">
                            <img src="https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHx1c2VyJTIwYXZhdGFyJTIwbWFufGVufDF8fHx8MTc2NDA3NTM5MHww&ixlib=rb-4.1.0&q=80&w=1080"
                                 alt="${user.name}"
                                 class="w-full h-full object-cover">
                        </div>
                        <div class="absolute bottom-2 left-2 w-6 h-6 bg-green-500 border-4 border-white rounded-full"></div>
                    </div>

                    <!-- User Info -->
                    <div class="flex-1 text-center md:text-right">
                        <h1 class="text-4xl font-bold text-gray-900 mb-3">${user.userName}</h1>
                        <div class="space-y-3 mb-6">
                            <div class="flex items-center justify-center md:justify-start gap-3 text-gray-600">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <rect width="20" height="16" x="2" y="4" rx="2"/>
                                    <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                                </svg>
                                <span class="text-lg">${user.email}</span>
                            </div>
                            <div class="flex items-center justify-center md:justify-start gap-3 text-gray-600">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                                </svg>
                                <span class="text-lg">${user.phoneNumber}</span>
                            </div>
                            <div class="flex items-center justify-center md:justify-start gap-3 text-gray-600">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                                    <rect width="18" height="18" x="3" y="4" rx="2" ry="2"/>
                                    <line x1="16" x2="16" y1="2" y2="6"/>
                                    <line x1="8" x2="8" y1="2" y2="6"/>
                                    <line x1="3" x2="21" y1="10" y2="10"/>
                                </svg>
                                <span class="text-lg">انضم في 15 يناير 2024</span>
                            </div>
                        </div>
                        <a href="edit-profile.jsp" class="inline-flex items-center gap-2 bg-[#2563eb] hover:bg-[#1d4ed8] text-white px-8 py-3 rounded-2xl transition-colors font-medium">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M17 3a2.85 2.83 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/>
                                <path d="m15 5 4 4"/>
                            </svg>
                            تعديل الملف الشخصي
                        </a>
                    </div>
                </div>
            </div>

            <!-- Account Settings -->
            <div class="bg-white rounded-[32px] p-8 md:p-12 mb-6 shadow-sm">
                <h2 class="text-2xl font-bold text-gray-900 mb-6 flex items-center gap-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb]">
                        <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/>
                        <circle cx="12" cy="12" r="3"/>
                    </svg>
                    إعدادات الحساب
                </h2>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                    <a href="edit-profile.jsp" class="group bg-[#f9fafb] hover:bg-blue-50 border-2 border-transparent hover:border-[#2563eb] rounded-[24px] p-6 transition-all">
                        <div class="flex items-center justify-center w-14 h-14 bg-blue-100 group-hover:bg-[#2563eb] rounded-2xl mb-4 transition-colors">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb] group-hover:text-white transition-colors">
                                <path d="M17 3a2.85 2.83 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"/>
                                <path d="m15 5 4 4"/>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">تعديل الملف</h3>
                        <p class="text-gray-600">قم بتحديث معلوماتك الشخصية</p>
                    </a>

                    <a href="#" class="group bg-[#f9fafb] hover:bg-blue-50 border-2 border-transparent hover:border-[#2563eb] rounded-[24px] p-6 transition-all">
                        <div class="flex items-center justify-center w-14 h-14 bg-blue-100 group-hover:bg-[#2563eb] rounded-2xl mb-4 transition-colors">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-[#2563eb] group-hover:text-white transition-colors">
                                <rect width="18" height="11" x="3" y="11" rx="2" ry="2"/>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">تغيير كلمة المرور</h3>
                        <p class="text-gray-600">حافظ على أمان حسابك</p>
                    </a>

                    <a href="#" class="group bg-[#f9fafb] hover:bg-red-50 border-2 border-transparent hover:border-red-500 rounded-[24px] p-6 transition-all">
                        <div class="flex items-center justify-center w-14 h-14 bg-red-100 group-hover:bg-red-500 rounded-2xl mb-4 transition-colors">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-red-600 group-hover:text-white transition-colors">
                                <path d="M3 6h18"/>
                                <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"/>
                                <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"/>
                            </svg>
                        </div>
                        <h3 class="text-xl font-semibold text-gray-900 mb-2">حذف الحساب</h3>
                        <p class="text-gray-600">إزالة حسابك نهائياً</p>
                    </a>
                </div>
            </div>
        </div>
    </main>
</div>
</div>
<!-- Include Footer -->
<jsp:include page="includes/footer.jsp" />
</body>
</html>
