<script lang="ts" setup>
// Props
interface Props {
  icon: string;
  label: string;
}

const props = defineProps<Props>();
</script>

<template>
  <div>
    <div
      class="flex flex-row px-[12px] py-[8px] items-center block text-primary-700 font-bold"
    >
      <span
        class="material-icons-outlined text-display-xs inline-block pr-[12px]"
      >
        {{ icon }}
      </span>
      <h4 class="inline-block text-md">{{ label }}</h4>
    </div>
    <div class="flex flex-col pl-10">
      <slot></slot>
    </div>
  </div>
</template>
