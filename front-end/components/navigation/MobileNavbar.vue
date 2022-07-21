<script lang="ts" setup>
const { toggleMobileNav } = useMobileNav();
</script>

<template>
  <div class="flex flex-row w-full lg:hidden px-[1rem] py-[1rem] shadow-sm">
    <div class="flex justify-start items-center">
      <h3 class="text-xl">Plagiarism</h3>
    </div>
    <div class="flex justify-end w-full items-center">
      <button @click="toggleMobileNav">
        <span class="material-icons-outlined text-display-xs">menu</span>
      </button>
    </div>
  </div>
</template>
