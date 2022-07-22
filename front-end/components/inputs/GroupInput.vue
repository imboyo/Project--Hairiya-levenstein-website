<script lang="ts" setup>
// Props
interface Props {
  label: string;
  required: boolean;
}

const props = defineProps<Props>();
</script>

<template>
  <div class="flex flex-col lg:flex-row lg:gap-6 gap-2">
    <div class="flex lg:w-[18rem] items-center">
      <h3 class="text-sm text-gray-700 font-medium">
        {{ label }} <span class="text-error-600" v-if="required">*</span>
      </h3>
    </div>

    <slot></slot>
  </div>
</template>
