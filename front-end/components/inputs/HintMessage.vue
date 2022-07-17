<script lang="ts" setup>
interface Props {
  hints: string[];
}
const props = defineProps<Props>();
</script>

<template>
  <div class="flex flex-col">
    <span v-for="item in hints" class="text-sm text-gray-500">{{ item }}</span>
  </div>
</template>
