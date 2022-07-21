<script lang="ts" setup>
// Props
interface Props {
  to: string;
  label: string;
  icon: string;
}

const props = defineProps<Props>();
</script>

<template>
  <MyNuxtLink
    :to="to"
    class="flex flex-row px-[12px] py-[8px] items-center block text-gray-700 hover:text-primary-700 hover:bg-primary-50 transition duration-200"
  >
    <span
      class="material-icons-outlined text-display-xs inline-block pr-[12px]"
    >
      {{ icon }}
    </span>
    <h4 class="inline-block text-md">{{ label }}</h4>
  </MyNuxtLink>
</template>
