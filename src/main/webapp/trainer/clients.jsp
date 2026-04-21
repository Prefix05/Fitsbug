<%--
  Created by IntelliJ IDEA.
  User: jinhoyon
  Date: 4/21/26
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<html>

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Fitzberg - Client Management</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap"
          rel="stylesheet" />
    <link
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
            rel="stylesheet" />
    <script
            id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "on-tertiary": "#ffffff", "on-surface": "#1a1c1f", "on-secondary-container": "#2d4c83", "surface-container-high": "#e8e8ed", tertiary: "#9e3d00", surface: "#f9f9fe", "on-error": "#ffffff", "surface-container-highest": "#e2e2e7", "on-primary-fixed-variant": "#004493", "on-tertiary-container": "#fffbff", "secondary-fixed": "#d8e2ff", "surface-container": "#ededf2", "primary-fixed-dim": "#adc6ff", "tertiary-fixed-dim": "#ffb595", "on-background": "#1a1c1f", "surface-variant": "#e2e2e7", "inverse-primary": "#adc6ff", "tertiary-fixed": "#ffdbcc", "outline-variant": "#c1c6d7", "on-secondary-fixed-variant": "#26467d", "on-primary-container": "#fefcff", "on-secondary": "#ffffff", "surface-bright": "#f9f9fe", "primary-fixed": "#d8e2ff", "on-tertiary-fixed-variant": "#7c2e00", "surface-dim": "#d9dade", "on-surface-variant": "#414755", "surface-container-low": "#f3f3f8", outline: "#717786", "on-tertiary-fixed": "#351000", "error-container": "#ffdad6", secondary: "#405e96", "on-error-container": "#93000a", "inverse-surface": "#2e3034", "secondary-fixed-dim": "#adc6ff", "on-primary-fixed": "#001a41", primary: "#0058bc", "tertiary-container": "#c64f00", "on-secondary-fixed": "#001a41", "secondary-container": "#a1befd", "primary-container": "#0070eb", "surface-container-lowest": "#ffffff", "surface-tint": "#005bc1", error: "#ba1a1a", "on-primary": "#ffffff", background: "#f9f9fe", "inverse-on-surface": "#f0f0f5" }, borderRadius: { DEFAULT: "0.125rem", lg: "0.25rem", xl: "0.5rem", full: "0.75rem" }, fontFamily: { headline: ["Inter"], body: ["Inter"], label: ["Inter"], display: "Inter" }, boxShadow: { "primary-glow": "0 0 15px -3px rgba(0, 88, 188, 0.2), 0 4px 6px -2px rgba(0, 88, 188, 0.1)" }, keyframes: { pulseCustom: { "0%, 100%": { opacity: 1, transform: "scale(1)" }, "50%": { opacity: 0.5, transform: "scale(1.2)" } } }, animation: { "pulse-dot": "pulseCustom 2s cubic-bezier(0.4, 0, 0.6, 1) infinite" } } } };</script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }

        .scrollbar-hide::-webkit-scrollbar {
            display: none;
        }

        .scrollbar-hide {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        #client-list-container {
            scrollbar-width: thin;
            scrollbar-color: #e2e2e7 transparent;
        }

        #client-list-container::-webkit-scrollbar {
            width: 6px;
        }

        #client-list-container::-webkit-scrollbar-track {
            background: transparent;
        }

        #client-list-container::-webkit-scrollbar-thumb {
            background-color: #e2e2e7;
            border-radius: 20px;
        }
    </style>
</head>

<body class="bg-background text-on-background h-screen overflow-hidden flex">

<!-- Mobile Top Bar -->
<header
        class="lg:hidden fixed top-0 left-0 right-0 z-30 bg-slate-50 border-b border-slate-200 px-4 py-3 flex items-center justify-between">
    <div class="flex items-center gap-2">
        <div class="w-8 h-8 bg-[#007AFF] rounded-lg flex items-center justify-center">
            <span class="material-symbols-outlined text-white text-lg">exercise</span>
        </div>
        <h1 class="text-lg font-bold text-on-surface">Fitsbug</h1>
    </div>
    <div class="flex items-center gap-1">
        <button class="p-2 rounded-lg hover:bg-slate-200">
            <span class="material-symbols-outlined">notifications</span>
        </button>
        <a href="./profile.html" class="p-1 rounded-full">
            <img alt="연진호" class="w-8 h-8 rounded-full object-cover"
                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLhyuu6rdbT8CspzqySgGADnPxyIZWQ8JzIVzEVHSPkB3UoDOAnZJJhZ7cPpcvRt9El0mEpCGTPo-ipH8tmcW9-1VJX9uPfKjuW6-wnQk8l60TyYJuHFUx-ER7gH9tCPui0ZcXDuvH0okvDCPmNyngCwbTzX130D_1k-cU7r_UYLYwjc9G4FkGvBrwYIPVBudS3XRg5OfUza5BbOyu2mmJQa8uPxFR30YuJ6RWgfoV5POhIwmfRnsUouAZZYhCreQjA-1_7aGakeQ" />
        </a>
    </div>
</header>

<!-- Mobile Bottom Nav -->
<nav
        class="lg:hidden fixed bottom-0 left-0 right-0 z-30 bg-white border-t border-slate-200 px-2 py-2 flex items-center justify-around">
    <a href="/dashboard.html" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">dashboard</span>
        <span class="text-[10px] font-medium">대시보드</span>
    </a>
    <a href="/clients.html" class="flex flex-col items-center gap-1 px-3 py-1 text-blue-700">
        <span class="material-symbols-outlined text-[22px]" style='font-variation-settings: "FILL" 1;'>group</span>
        <span class="text-[10px] font-bold text-blue-700">회원관리</span>
    </a>
    <a href="/calendar.html" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">calendar_today</span>
        <span class="text-[10px] font-medium">일정</span>
    </a>
    <a href="#" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">chat</span>
        <span class="text-[10px] font-medium">메시지</span>
    </a>
    <a href="#" class="flex flex-col items-center gap-1 px-3 py-1 text-slate-400">
        <span class="material-symbols-outlined text-[22px]">payments</span>
        <span class="text-[10px] font-medium">수익</span>
    </a>
</nav>

<!-- SideNavBar Shell -->
<aside
        class="fixed left-0 top-0 h-full w-64 bg-slate-50 dark:bg-slate-900 transition-colors duration-200 z-20 flex flex-col p-6">
    <a href="" class="flex items-center gap-3 mb-10">
        <div class="w-10 h-10 bg-[#007AFF] rounded-xl flex items-center justify-center shrink-0">
            <span class="material-symbols-outlined text-white text-2xl" data-icon="" style="">exercise</span>
        </div>
        <h1 class="text-2xl font-bold tracking-tight text-on-surface" style="">Fitsbug</h1>
    </a>
    <nav class="flex-1 space-y-1" id="main-nav">

        <!-- 공통 nav item -->
        <!-- 내주변 -->
        <div class="relative">
            <!-- Parent toggle -->
            <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg cursor-pointer select-none"
               onclick="
                            this.parentElement.querySelector('.dropdown').classList.toggle('hidden');
                            this.querySelector('.chevron').classList.toggle('rotate-180');
                        " href="#">
                <span class="material-symbols-outlined">distance</span>
                내주변
                <span class="material-symbols-outlined ml-auto transition-transform duration-200 chevron"
                      style="font-size:18px">expand_more</span>
            </a>

            <!-- Dropdown children -->
            <div class="dropdown hidden flex-col pl-4">
                <!-- 헬스장 -->
                <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
                   href="#">
                    <span class="material-symbols-outlined" data-icon="">fitness_center</span>
                    헬스장
                </a>
                <!-- 트레이너 -->
                <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
                   href="#">
                    <span class="material-symbols-outlined" data-icon="">person</span>
                    트레이너
                </a>
            </div>
        </div>

        <!-- 트레이너  nav item-->

        <!-- 대시보드 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/dashboard.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                 style="">dashboard</span>
            대시보드</a>

        <!-- 회원관리 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-semibold text-blue-700 border-r-4 border-blue-700 bg-slate-200/50 transition-colors duration-200"
           href="/clients.html" style=""><span class="material-symbols-outlined" data-icon="" style="">group</span>
            회원
            관리</a>

        <!-- 일정 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="/calendar.html" style=""><span class="material-symbols-outlined" data-icon=""
                                                style="">calendar_today</span> 일정</a>

        <!-- 메시지 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">chat</span> 메시지</a>

        <!-- 수익 -->
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">payments</span>
            수익</a>
    </nav>

    <!-- 공통 nav item -->
    <div class="mt-auto pt-6 border-slate-200 dark:border-slate-800 space-y-1">
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">settings</span>
            설정</a>
        <a class="flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg"
           href="#" style=""><span class="material-symbols-outlined" data-icon="" style="">help</span> 고객
            지원</a>
        <div class="border-t border-slate-200 dark:border-slate-800 my-2"></div>
    </div>


    <!-- 마이프로필 nav item -->
    <a href="./profile.html"
       class=" flex items-center gap-3 px-4 py-3 text-sm font-medium text-slate-500 hover:bg-slate-200/50 transition-colors duration-200 rounded-lg">
        <img alt="Alex Fischer" class="w-10 h-10 rounded-full object-cover shrink-0"
             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBmLhyuu6rdbT8CspzqySgGADnPxyIZWQ8JzIVzEVHSPkB3UoDOAnZJJhZ7cPpcvRt9El0mEpCGTPo-ipH8tmcW9-1VJX9uPfKjuW6-wnQk8l60TyYJuHFUx-ER7gH9tCPui0ZcXDuvH0okvDCPmNyngCwbTzX130D_1k-cU7r_UYLYwjc9G4FkGvBrwYIPVBudS3XRg5OfUza5BbOyu2mmJQa8uPxFR30YuJ6RWgfoV5POhIwmfRnsUouAZZYhCreQjA-1_7aGakeQ"
             style="" />
        <div class="overflow-hidden">
            <p class="text-sm font-bold text-on-surface truncate" style="">연진호</p>
            <p class="text-xs text-slate-500 truncate" style="">마이프로필</p>
        </div>
    </a>
</aside>
<!-- Main Content Canvas (Adjusted with ml-64) -->
<div class="flex-1 ml-64 flex flex-col overflow-hidden relative">
    <!-- TopNavBar Shell -->
    <main class="flex-1 overflow-hidden pt-8 px-8 pb-12 flex flex-col">
        <!-- Header & Control Bar -->
        <div class="flex-none max-w-7xl w-full mx-auto mb-8">
            <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-6">
                <div>
                    <h2 class="text-3xl font-extrabold tracking-tight text-on-surface" style="">회원 관리</h2>
                    <p class="text-on-surface-variant mt-1" style="">활성 교육 명단을 관리하고 성과를 추적하세요.</p>
                </div>
            </div>
            <!-- Control Row -->
            <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
                <div class="flex flex-col md:flex-row md:items-center gap-4 flex-1">
                    <!-- Integrated Search Bar -->
                    <div class="relative w-full lg:max-w-[300px]">
                            <span
                                    class="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-outline text-lg"
                                    data-icon="search" style="">search</span>
                        <input
                                class="w-full bg-white border border-outline-variant rounded-xl pl-10 pr-4 py-2.5 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all placeholder-outline text-on-surface"
                                placeholder="회원 검색..." type="text" />
                    </div>
                    <!-- Segmented Control Filter -->
                    <div
                            class="flex items-center gap-1 p-1 bg-surface-container-high rounded-2xl w-fit overflow-x-auto scrollbar-hide shrink-0">
                        <button
                                class="px-5 py-2 text-sm font-semibold rounded-xl bg-white shadow-sm text-primary transition-all"
                                style="">전체</button>
                        <button
                                class="px-5 py-2 text-sm font-medium rounded-xl text-on-surface-variant hover:bg-white/50 transition-all flex items-center gap-2"
                                style="">검토 필요 <span
                                class="bg-primary text-on-primary text-[10px] w-4 h-4 flex items-center justify-center rounded-full"
                                style="">2</span></button>
                        <button
                                class="px-5 py-2 text-sm font-medium rounded-xl text-on-surface-variant hover:bg-white/50 transition-all"
                                style="">오늘</button>
                        <button
                                class="px-5 py-2 text-sm font-medium rounded-xl text-on-surface-variant hover:bg-white/50 transition-all"
                                style="">완료</button>
                    </div>
                </div>
                <!-- Sort Dropdown Far Right -->
                <div class="flex items-center gap-3">
                    <div class="relative w-full lg:w-auto">
                        <select
                                class="w-full lg:w-auto appearance-none bg-white border border-outline-variant rounded-xl pl-4 pr-10 py-2.5 text-sm font-medium text-on-surface-variant focus:ring-2 focus:ring-primary/20 focus:border-primary transition-all cursor-pointer">
                            <option>정렬 기준: 다음 세션</option>
                            <option>정렬 기준: 최근 활동</option>
                            <option>정렬 기준: 남은 세션</option>
                        </select>
                        <span
                                class="material-symbols-outlined absolute right-3 top-1/2 -translate-y-1/2 pointer-events-none text-outline text-lg"
                                data-icon="expand_more" style="">expand_more</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scrollable Client List Container -->
        <div class="flex-1 overflow-y-auto max-w-7xl w-full mx-auto" id="client-list-container">
            <div class="space-y-4 pr-2">
                <!-- Client Card 1 (UNREAD) -->
                <a href="./clientDetail.html">
                    <div
                            class="relative bg-primary/[0.05] border-l-4 border-l-primary border-y border-r border-surface-container-highest rounded-2xl p-5 grid grid-cols-[280px_1fr_220px] items-center gap-6 shadow-primary-glow transition-all hover:shadow-lg min-h-[96px] group cursor-pointer">
                        <div class="absolute -top-2.5 -left-1 flex items-center gap-1.5 bg-white border border-primary/20 text-primary text-[10px] font-bold px-2.5 py-1 rounded-full shadow-sm z-[1]"
                             style="">
                            <span class="w-1.5 h-1.5 bg-primary rounded-full animate-pulse-dot"></span>새 활동 • 2시간 전
                        </div>
                        <div class="flex items-start gap-3">
                            <img alt="Marcus Thompson"
                                 class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm shrink-0"
                                 src="https://lh3.googleusercontent.com/aida-public/AB6AXuDxVLWR39yh428x_vNAZmvkk5yrVsx-RcET5Bir0Z_WyRuh9BrayJqHJczEoui0FW7uK6LAeON_tYfaNKTeSm3vvT7J4uGv1ilqrS-uLsBhga6BRlz5gnf764MV5a3KjoiE8F7P3j03_22mTpxbp8Pij4SeXpyTb3ORj06rzur95YYQBbxPpKJ_i-n3HDuICWhHpUVt5ab0v9h3qSZ9r2OeK018nvurd1ZU9__CtuAcVxV4URUjC94fgTQ7gypLE4EWQqbX7hEEBd9B"
                                 style="" />
                            <div class="flex flex-col gap-1">
                                <h3 class="text-base font-bold text-on-surface leading-none" style="">김길동</h3>
                                <div class="flex gap-2 mt-1"><span
                                        class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                        style="">체중 감량</span><span
                                        class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                        style="">근력 증강</span></div>
                            </div>
                        </div>
                        <div class="flex justify-between px-6 border-x border-gray-50 items-start">
                            <div>
                                <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5"
                                   style="">
                                    다음 세션</p>
                                <p class="text-sm font-bold text-primary" style="">오늘 <br /><span
                                        class="text-xs font-medium opacity-80" style="">오후 6:00</span></p>
                            </div>
                            <div>
                                <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5"
                                   style="">
                                    남은 세션 횟수</p>
                                <p class="text-sm font-bold text-error flex items-center gap-1" style="">
                                    2 <span class="material-symbols-outlined text-sm" data-icon="warning"
                                            style="">warning</span>
                                </p>
                            </div>
                            <div>
                                <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5"
                                   style="">
                                    전 세션</p>
                                <p class="text-sm font-medium text-outline" style="">4/28</p>
                            </div>
                        </div>
                        <div class="flex justify-end items-center gap-2"><span
                                class="material-symbols-outlined text-outline group-hover:text-primary transition-colors"
                                data-icon="chevron_right" style="">chevron_right</span></div>
                    </div>
                </a>
                <!-- Client Card 2 (UNREAD) -->
                <div
                        class="relative bg-primary/[0.05] border-l-4 border-l-primary border-y border-r border-surface-container-highest rounded-2xl p-5 grid grid-cols-[280px_1fr_220px] items-center gap-6 shadow-primary-glow transition-all hover:shadow-lg min-h-[96px] group cursor-pointer">
                    <div class="absolute -top-2.5 -left-1 flex items-center gap-1.5 bg-white border border-primary/20 text-primary text-[10px] font-bold px-2.5 py-1 rounded-full shadow-sm z-[1]"
                         style="">
                        <span class="w-1.5 h-1.5 bg-primary rounded-full animate-pulse-dot"></span>
                        새 활동 • 어제
                    </div>
                    <div class="flex items-start gap-3">
                        <img alt="Sarah Jenkins"
                             class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm shrink-0"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuBpR_qOfy4raNiQLzeCFTV8SBqJuBH7POtl_ukN2wJ8ls-sdT_vdhynoJ-zbYpsRJqFcGd6TdzdyYz-Pb1uMEz-yvKTYU3afmYYxEN6pE2trhCPHOzr4Oq7P7nyaVqMdW2I7bhFIUI3wP4OKt3bejPMbNwOJSPIvExk5wmTPFaxkmim3OM_dQYMKaAvWXQfqfh2eD0M_hv3earipx5NSm150zKhda-FtaWm0Q1h6olKC9VFdafP707DBmzEu-dXrEtxRPFDVxLzCokc"
                             style="" />
                        <div class="flex flex-col gap-1">
                            <h3 class="text-base font-bold text-on-surface leading-none" style="">송길동</h3>
                            <div class="flex gap-2 mt-1"><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">유연성 향상</span></div>
                        </div>
                    </div>
                    <div class="flex justify-between px-6 border-x border-gray-50 items-start">
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                다음 세션</p>
                            <p class="text-sm font-bold text-on-surface" style=""><span
                                    class="text-xs font-medium text-outline" style="">
                                        <font color="#1a1c1f"><span style="font-size: 14px;"><b>(목) 4/11</b></span>
                                        </font>
                                    </span></p>
                            <div><span class="text-xs font-medium text-outline" style="">오전 10:00</span></div>
                            <p></p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                남은 세션 횟수</p>
                            <p class="text-sm font-bold text-on-surface" style="">12</p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                전 세션</p>
                            <p class="text-sm font-medium text-outline" style="">3/27</p>
                        </div>
                    </div>
                    <div class="flex justify-end items-center gap-2"><span
                            class="material-symbols-outlined text-outline group-hover:text-primary transition-colors"
                            data-icon="chevron_right" style="">chevron_right</span></div>
                </div>
                <!-- Other Client Cards... -->
                <!-- Client Card 3 -->
                <div
                        class="bg-white border border-surface-container-highest rounded-2xl p-5 grid grid-cols-[280px_1fr_220px] items-center gap-6 hover:shadow-md transition-shadow min-h-[96px] group cursor-pointer">
                    <div class="flex items-start gap-3">
                        <img alt="김지수"
                             class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm shrink-0"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuC08sNQax1ULEbki5pzqf_rE_vPTqKclEeWmRZJOiGe-B-NzLYW1Bql71sz8WU-L3Zr524M78pr-iwHuL3f70pi3GpoxryAu-t0qJVA62bySyMC2XBHH2AJ37NO0lrb7uSoRsmQlASiqbuDcZdS8qM9NcSW3UDjnvhnJBzDv91dGvrxQWBNQRxImCANuuQGbsJz3ViU-68Ffrb7-oZDlxvtWNtENbJSR6J-9B6tIRZk9q5ZKEqmv3mj9w1I9IEAZ2yQDOEqu976IJ4Y"
                             style="" />
                        <div class="flex flex-col gap-1">
                            <h3 class="text-base font-bold text-on-surface leading-none" style="">김지수</h3>
                            <div class="flex gap-2 mt-1"><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">코어 강화</span><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">재활 운동</span></div>
                        </div>
                    </div>
                    <div class="flex justify-between px-6 border-x border-gray-50 items-start">
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">다음 세션</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style=""><span
                                    class="text-xs font-medium text-outline" style=""><span
                                    style="color: rgb(26, 28, 31); font-size: 14px; font-weight: 700;">(수)
                                            4/10</span><br
                                    style="--tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; color: rgb(26, 28, 31); font-size: 14px; font-weight: 700;" />오전
                                        08:00</span></p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">남은 세션 횟수</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style="">8</p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">전 세션</span>
                            </p>
                            <p class="text-sm font-medium text-outline" style="">3/29</p>
                        </div>
                    </div>
                    <div class="flex justify-end items-center gap-2"><span
                            class="material-symbols-outlined text-outline group-hover:text-primary transition-colors"
                            data-icon="chevron_right" style="">chevron_right</span></div>
                </div>
                <!-- Client Card 4 -->
                <div
                        class="bg-white border border-surface-container-highest rounded-2xl p-5 grid grid-cols-[280px_1fr_220px] items-center gap-6 hover:shadow-md transition-shadow min-h-[96px] group cursor-pointer">
                    <div class="flex items-start gap-3">
                        <img alt="이민우"
                             class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm shrink-0"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuDDar7HcGGqpU3-fiVvnL5_9_7dOOzwhKAG3NMg5qNpNGP-qX1T82kdnJuoHH_DfCIaY7d7-8ucKFeYA0qY6dmvfchVuDtKZkrQGHPt34grfI14wiatcbB9uVCx-9WUxND9M82ODOLan-8G_UxX03kipH5tx6TiL1Ji1Cwy0-nWCFaJ6bZ72h1fT7pXD7ikZaXWyQ_EcZkXbzUkxBCTnxQedOIdydjCCXsbHzpfAbGuZNNsHnm5GiRDNBBB9f8t5TTxRdr0ka4ggyVR"
                             style="" />
                        <div class="flex flex-col gap-1">
                            <h3 class="text-base font-bold text-on-surface leading-none" style="">이민우</h3>
                            <div class="flex gap-2 mt-1"><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">바디 프로필</span><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">식단 조절</span></div>
                        </div>
                    </div>
                    <div class="flex justify-between px-6 border-x border-gray-50 items-start">
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">다음 세션</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style="">내일 <br /><span
                                    class="text-xs font-medium text-outline" style="">오후 7:30</span></p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">남은 세션 횟수</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style="">24</p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">전 세션</span>
                            </p>
                            <p class="text-sm font-medium text-outline" style="">3/30</p>
                        </div>
                    </div>
                    <div class="flex justify-end items-center gap-2"><span
                            class="material-symbols-outlined text-outline group-hover:text-primary transition-colors"
                            data-icon="chevron_right" style="">chevron_right</span></div>
                </div>
                <!-- Client Card 5 -->
                <div
                        class="bg-white border border-surface-container-highest rounded-2xl p-5 grid grid-cols-[280px_1fr_220px] items-center gap-6 hover:shadow-md transition-shadow min-h-[96px] group cursor-pointer">
                    <div class="flex items-start gap-3">
                        <img alt="박소연"
                             class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm shrink-0"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuB6oA_vY2zP1iG78vG7p0_V6X2mB_7RzWJ0O_q1-W-Y-M1W7yA-1-F1W-Y-M1W7yA-1-F"
                             style="" />
                        <div class="flex flex-col gap-1">
                            <h3 class="text-base font-bold text-on-surface leading-none" style="">박소연</h3>
                            <div class="flex gap-2 mt-1"><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">기초 체력</span></div>
                        </div>
                    </div>
                    <div class="flex justify-between px-6 border-x border-gray-50 items-start">
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">다음 세션</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style=""><span
                                    class="text-xs font-medium text-outline" style=""><span
                                    style="color: rgb(26, 28, 31); font-size: 14px; font-weight: 700;">(금)
                                            4/5</span><br
                                    style="--tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(59 130 246 / 0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; color: rgb(26, 28, 31); font-size: 14px; font-weight: 700;" />오후
                                        02:00</span></p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">남은 세션 횟수</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style="">4</p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">전 세션</span>
                            </p>
                            <p class="text-sm font-medium text-outline" style="">3/22</p>
                        </div>
                    </div>
                    <div class="flex justify-end items-center gap-2"><span
                            class="material-symbols-outlined text-outline group-hover:text-primary transition-colors"
                            data-icon="chevron_right" style="">chevron_right</span></div>
                </div>
                <!-- Client Card 6 (Park So-hee) -->
                <div
                        class="bg-white border border-surface-container-highest rounded-2xl p-5 grid grid-cols-[280px_1fr_220px] items-center gap-6 hover:shadow-md transition-shadow min-h-[96px] group cursor-pointer">
                    <div class="flex items-start gap-3">
                        <img alt="Park So-hee"
                             class="w-12 h-12 rounded-full object-cover border-2 border-white shadow-sm shrink-0"
                             src="https://lh3.googleusercontent.com/aida-public/AB6AXuAnqB177_Y_N3X09yZ0-n_3-V_9X1W7yA-1-F1W-Y-M1W7yA-1-F"
                             style="" />
                        <div class="flex flex-col gap-1">
                            <h3 class="text-base font-bold text-on-surface leading-none" style="">박서히</h3>
                            <div class="flex gap-2 mt-1"><span
                                    class="text-[10px] bg-surface-container-low text-on-surface-variant font-medium px-2 py-0.5 rounded-full"
                                    style="">체중 감량</span></div>
                        </div>
                    </div>
                    <div class="flex justify-between px-6 border-x border-gray-50 items-start">
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">다음 세션</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style="">(금) 4/5 <br />
                                <font color="#717786"><span style="font-size: 12px; font-weight: 500;">오후
                                            04:00</span></font>
                            </p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">남은 세션 횟수</span>
                            </p>
                            <p class="text-sm font-bold text-on-surface" style="">4</p>
                        </div>
                        <div>
                            <p class="text-[10px] uppercase font-bold text-outline tracking-widest mb-0.5" style="">
                                <span style="background-color: rgba(0, 88, 188, 0.05);">전 세션</span>
                            </p>
                            <p class="text-sm font-medium text-outline" style="">3/22</p>
                        </div>
                    </div>
                    <div class="flex justify-end items-center gap-2"><span
                            class="material-symbols-outlined text-outline group-hover:text-primary transition-colors"
                            data-icon="chevron_right" style="">chevron_right</span></div>
                </div>
            </div>
        </div>
        <div class="flex justify-center items-center py-6 mt-2 border-slate-100 sticky bottom-0">
            <nav aria-label="Pagination" class="flex items-center gap-1">
                <button
                        class="w-9 h-9 flex items-center justify-center rounded-lg text-slate-400 hover:bg-slate-100 hover:text-slate-600 transition-colors"
                        style="">
                    <span class="material-symbols-outlined text-xl" style="">chevron_left</span>
                </button>
                <button
                        class="w-9 h-9 flex items-center justify-center rounded-lg text-sm font-semibold bg-[#007AFF] text-white shadow-sm shadow-blue-200"
                        style="">
                    1
                </button>
                <button
                        class="w-9 h-9 flex items-center justify-center rounded-lg text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors"
                        style="">
                    2
                </button>
                <button
                        class="w-9 h-9 flex items-center justify-center rounded-lg text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors"
                        style="">
                    3
                </button>
                <div class="px-1 text-slate-300 text-sm italic tracking-widest" style="">
                    ...
                </div>
                <button
                        class="w-9 h-9 flex items-center justify-center rounded-lg text-sm font-medium text-slate-600 hover:bg-slate-100 transition-colors"
                        style="">
                    8
                </button>
                <button
                        class="w-9 h-9 flex items-center justify-center rounded-lg text-slate-400 hover:bg-slate-100 hover:text-slate-600 transition-colors"
                        style="">
                    <span class="material-symbols-outlined text-xl" style="">chevron_right</span>
                </button>
            </nav>
        </div>
    </main>
</div>
</body>
</html>
