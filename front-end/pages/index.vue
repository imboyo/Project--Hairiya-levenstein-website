<script lang="ts" setup>
import Sidenav from "~/components/navigation/Sidenav.vue";

const modalIsOpen = ref(false);
</script>

<template>
  <div class="flex flex-col">
    <!-- ? Mobile Navbar -->
    <div class="flex flex-row w-full lg:hidden px-[1rem] py-[1rem] shadow-sm">
      <div class="flex justify-start items-center">
        <h3 class="text-xl">Plagiarism</h3>
      </div>
      <div class="flex justify-end w-full items-center">
        <button @click="modalIsOpen = !modalIsOpen">
          <span class="material-icons-outlined text-display-xs">menu</span>
        </button>
      </div>
    </div>
    <!-- ! End Mobile Navbar  -->

    <!-- ?  Mobile Sidenav  -->
    <Transition name="mobile-sidenav" duration="300">
      <div v-if="modalIsOpen" class="flex flex-row h-screen w-screen absolute">
        <div class="w-full h-screen bg-white pl-[1rem] pt-[1rem]">Test</div>
        <div class="w-[3rem] h-screen bg-gray-500 text-center pt-[1rem]">
          <button>
            <span
              class="material-icons-outlined text-display-xs text-white inline-block"
              >close</span
            >
          </button>
        </div>
      </div>
    </Transition>
    <!-- ! End Mobile Sidenav  -->
    <div class="hidden flex-col bg-blue-500 h-screen w-[280px] lg:flex">
      Test
    </div>
    <div class="flex flex-col w-full text-black">
      <h1 class="text-display-lg">Content</h1>
      <p>{{ modalIsOpen }}</p>
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
