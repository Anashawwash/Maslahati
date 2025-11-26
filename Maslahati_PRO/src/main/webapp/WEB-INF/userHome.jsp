<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>الصناعية المتاحة - أعلن عن أفضل الصناعيين في منطقتك</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .craftsman-card {
            transition: all 0.3s ease;
        }

        .craftsman-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .rating-badge {
            background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%);
        }

        .search-input::placeholder {
            color: #9ca3af;
        }
    </style>
</head>
<body class="bg-gray-50" dir="rtl">
<!-- Header Section -->
<header class="bg-white border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 py-8">
        <div class="text-right">
            <h1 class="text-3xl font-bold text-gray-900 mb-2">الصناعية المتاحة</h1>
            <p class="text-gray-600 text-sm">أعلن عن أفضل الصناعيين في منطقتك</p>
        </div>
    </div>
</header>

<!-- Filters Section -->
<section class="bg-white border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 py-6">
        <div class="flex flex-col md:flex-row gap-4 items-center justify-between">
            <!-- Search Bar -->
            <div class="w-full md:w-auto md:flex-1 max-w-md">
                <div class="relative">
                    <input
                            type="text"
                            placeholder="ابحث بإسم الصناعي..."
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 text-right"
                    >
                    <svg class="absolute left-3 top-3.5 w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                    </svg>
                </div>
            </div>

            <!-- Filter Buttons -->
            <div class="flex flex-wrap gap-3 justify-end w-full md:w-auto">
                <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition text-right flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21a4 4 0 01-4-4V5a2 2 0 012-2h4a2 2 0 012 2v12a4 4 0 01-4 4zm0 0h12a2 2 0 002-2v-4a2 2 0 00-2-2h-2.5a2 2 0 00-1 .267M7 21H5m12 0h2m0-4V5a2 2 0 00-2-2h-4a2 2 0 00-2 2v12a4 4 0 004 4z"></path>
                    </svg>
                    <span>كل التخصصات</span>
                </button>

                <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition text-right flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    <span>كل المناطق</span>
                </button>

                <button class="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition text-right flex items-center gap-2">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                    </svg>
                    <span>كل التقييمات</span>
                </button>
            </div>
        </div>

        <!-- View Toggle and Results Count -->
        <div class="flex items-center justify-between mt-6 pt-4 border-t border-gray-200">
            <span class="text-gray-600 text-sm">6 صناعي متاح</span>
        </div>
    </div>
</section>

<!-- Craftsmen Grid Section -->
<main class="max-w-7xl mx-auto px-4 py-12">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

        <!-- Craftsman Card 1 -->
        <div class="craftsman-card bg-white rounded-lg overflow-hidden shadow-md">
            <div class="relative h-48 bg-gray-200 overflow-hidden">
                <img src="https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=400&h=300&fit=crop" alt="خالد أحمد" class="w-full h-full object-cover">
            </div>
            <div class="p-4">
                <div class="flex items-start justify-between mb-2">
                    <div class="text-right flex-1">
                        <h3 class="font-bold text-gray-900">خالد أحمد</h3>
                        <p class="text-sm text-gray-600">نجار</p>
                    </div>
                    <div class="rating-badge text-white px-2 py-1 rounded-md text-sm font-bold flex items-center gap-1">
                        <span>4.7</span>
                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                        </svg>
                    </div>
                </div>

                <div class="space-y-2 text-sm text-gray-600 mb-4">
                    <div class="flex items-center gap-2 justify-end">
                        <span>6 مشاريع حجز</span>
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path>
                        </svg>
                    </div>
                    <div class="flex items-center gap-2 justify-end">
                        <span>الإسكندرية</span>
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        </svg>
                    </div>
                </div>

                <div class="flex items-center justify-between text-sm text-blue-600 border-t border-gray-200 pt-3">
                    <a href="#" class="hover:underline">عرض الملف</a>
                    <span>156 عمل منجز</span>
                </div>
            </div>
        </div>

</main>
<script>
    // Add interactivity here if needed
    document.querySelectorAll('input[type="text"]').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('ring-2', 'ring-blue-500');
        });
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('ring-2', 'ring-blue-500');
        });
    });
</script>
</body>
</html>
