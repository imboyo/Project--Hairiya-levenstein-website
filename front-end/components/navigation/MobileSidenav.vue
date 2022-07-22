<script lang="ts" setup>
import Sidenav from "~/components/navigation/Sidenav.vue";

const { modalIsOpen, toggleMobileNav } = useMobileNav();
</script>

<template>
  <Transition name="mobile-sidenav" duration="300">
    <div
      v-if="modalIsOpen"
      class="flex flex-row h-screen w-screen absolute z-50"
    >
      <Sidenav />

      <!-- ?  Close Button   -->
      <div class="w-[3rem] h-screen bg-gray-500 text-center pt-[1rem]">
        <button @click="toggleMobileNav">
          <span
            class="material-icons-outlined text-display-xs text-white inline-block"
            >close</span
          >
        </button>
      </div>
      <!-- ! End Close Button -->
    </div>
  </Transition>
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
