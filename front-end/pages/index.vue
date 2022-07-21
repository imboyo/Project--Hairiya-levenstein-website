<script lang="ts" setup>
import MobileSidenav from "~/components/navigation/MobileSidenav.vue";
import MobileNavbar from "~/components/navigation/MobileNavbar.vue";
</script>

<template>
  <div class="flex flex-col">
    <!-- ? Mobile Navbar -->
    <MobileNavbar />
    <!-- ?  Mobile Sidenav  -->
    <MobileSidenav />
    <div class="hidden flex-col bg-blue-500 h-screen w-[280px] lg:flex">
      Test
    </div>
    <div class="flex flex-col w-full text-black">
      <h1 class="text-display-lg">Content</h1>
    </div>
  </div>
</template>

<style scoped>
.mobile-sidenav-enter-active,
.mobile-sidenav-leave-active {
  transition: all 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
}

.mobile-sidenav-enter-from,
.mobile-sidenav-leave-to {
  opacity: 0;
  transform: translateX(-100%);
}
</style>
