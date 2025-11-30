<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String lang = request.getParameter("lang");
    if(lang == null) { lang = "ar"; }
%>

<footer id="main-footer" class="bg-gray-900 text-white mt-20" dir="<%= lang.equals("ar") ? "rtl" : "ltr" %>">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">

        <!-- Grid -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-12">

            <!-- Logo & Description -->
            <div class="space-y-4 text-center md:text-left">
                <div class="flex items-center justify-center md:justify-start gap-3">
                    <div class="w-14 h-14 bg-blue-600 rounded-full flex items-center justify-center">
                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
                             fill="none" stroke="white" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <path d="m15 12-8.5 8.5c-.83.83-2.17.83-3 0a2.12 2.12 0 0 1 0-3L12 9"/>
                            <path d="M17.64 15 22 10.64"/>
                            <path d="m20.91 11.7-1.25-1.25c-.6-.6-.93-1.4-.93-2.25v-.86L16.01 4.6A5.56 5.56 0 0 0 12.07 3H9l.92.82A6.18 6.18 0 0 1 12 8.4v1.56l2 2h2.47l2.26 1.91"/>
                        </svg>
                    </div>
                    <span id="platform-name" class="text-2xl font-bold"><%= lang.equals("en") ? "Moslahati" : "مصلحاتي" %></span>
                </div>
                <p id="platform-desc" class="text-gray-400 leading-relaxed">
                    <%= lang.equals("en") ? "A trusted platform to connect with the best craftsmen in Palestine." : "منصة موثوقة للتواصل مع أفضل الصنايعية في فلسطين." %>
                </p>
            </div>

            <!-- Quick Links -->
            <div class="space-y-6 text-center md:text-left">
                <h4 id="quick-links-title" class="text-xl font-semibold"><%= lang.equals("en") ? "Quick Links" : "روابط سريعة" %></h4>
                <ul class="space-y-3 text-gray-400 text-sm">
                    <li><a id="about-link" href="#about" class="hover:text-white"><%= lang.equals("en") ? "About Us" : "من نحن" %></a></li>
                    <li><a id="howitworks-link" href="#howitworks" class="hover:text-white"><%= lang.equals("en") ? "How It Works" : "كيف يعمل الموقع" %></a></li>
                </ul>
            </div>

            <!-- Contact Section -->
            <div class="space-y-6 text-center md:text-left">
                <h4 id="contact-us-title" class="text-xl font-semibold"><%= lang.equals("en") ? "Contact Us" : "تواصل معنا" %></h4>
                <ul class="space-y-4 text-gray-400 text-sm">
                    <li class="flex items-center justify-center md:justify-start gap-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                             fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6A19.79 19.79 0 0 1 2.11 4.24 2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                        </svg>
                        <span>+970 566 548 430</span>
                    </li>
                    <li class="flex items-center justify-center md:justify-start gap-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                             fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <rect width="20" height="16" x="2" y="4" rx="2"/>
                            <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/>
                        </svg>
                        <span>Axsosstudent@gmail.com</span>
                    </li>
                    <li class="flex items-center justify-center md:justify-start gap-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                             fill="none" stroke="currentColor" stroke-width="2"
                             stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/>
                            <circle cx="12" cy="10" r="3"/>
                        </svg>
                        <span id="location-text"><%= lang.equals("en") ? "Palestine, West Bank" : "فلسطين، الضفة الغربية" %></span>
                    </li>
                </ul>
            </div>

        </div>

        <!-- Language Switch Button -->
        <div class="mt-8 text-center">
            <button id="toggle-lang" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">
                <%= lang.equals("en") ? "العربية" : "English" %>
            </button>
        </div>

        <!-- Bottom copyright -->
        <div id="copyright-text" class="border-t border-gray-800 mt-14 pt-8 text-center text-gray-400 text-sm">
            <%= lang.equals("en") ? "© 2025 Moslahati. All rights reserved." : "© 2025 مصلحاتي. جميع الحقوق محفوظة." %>
        </div>

    </div>
</footer>

<script>
    const toggleBtn = document.getElementById("toggle-lang");
    let lang = "<%= lang %>";

    toggleBtn.addEventListener("click", () => {
        // تغيير اللغة
        lang = (lang === "ar") ? "en" : "ar";

        // تحديث النصوص
        document.getElementById("platform-name").textContent = (lang === "en") ? "Moslahati" : "مصلحاتي";
        document.getElementById("platform-desc").textContent = (lang === "en")
            ? "A trusted platform to connect with the best craftsmen in Palestine."
            : "منصة موثوقة للتواصل مع أفضل الصنايعية في فلسطين.";
        document.getElementById("quick-links-title").textContent = (lang === "en") ? "Quick Links" : "روابط سريعة";
        document.getElementById("about-link").textContent = (lang === "en") ? "About Us" : "من نحن";
        document.getElementById("howitworks-link").textContent = (lang === "en") ? "How It Works" : "كيف يعمل الموقع";
        document.getElementById("contact-us-title").textContent = (lang === "en") ? "Contact Us" : "تواصل معنا";
        document.getElementById("location-text").textContent = (lang === "en") ? "Palestine, West Bank" : "فلسطين، الضفة الغربية";
        document.getElementById("copyright-text").textContent = (lang === "en")
            ? "© 2025 Moslahati. All rights reserved."
            : "© 2025 مصلحاتي. جميع الحقوق محفوظة.";
        toggleBtn.textContent = (lang === "en") ? "العربية" : "English";

        // تغيير اتجاه الصفحة
        document.getElementById("main-footer").dir = (lang === "en") ? "ltr" : "rtl";
    });
</script>
