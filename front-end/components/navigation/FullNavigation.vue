<script lang="ts" setup>
import MobileSidenav from "~/components/navigation/MobileSidenav.vue";
import MobileNavbar from "~/components/navigation/MobileNavbar.vue";
import Sidenav from "~/components/navigation/Sidenav.vue";
</script>

<template>
  <div class="flex flex-col lg:flex-row">
    <!-- ? Mobile Navbar -->
    <MobileNavbar />
    <!-- ?  Mobile Sidenav  -->
    <MobileSidenav />
    <div
      class="hidden flex-col h-screen w-[280px] lg:flex shadow-focus-ring-grey-100 lg:fixed lg:left-0 lg:top-0"
    >
      <Sidenav v-once />
    </div>
    <div class="w-full pt-[32px] px-[32px] lg:ml-[280px]">
      <slot></slot>
    </div>
  </div>
</template>
