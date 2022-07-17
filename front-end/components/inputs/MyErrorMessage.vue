<script lang="ts" setup>
interface Props {
  errorState: string | boolean | any;
}
const props = defineProps<Props>();
</script>

<template>
  <!--  Error Message  -->
  <span class="block text-sm text-error-500">{{ errorState }}</span>
</template>
