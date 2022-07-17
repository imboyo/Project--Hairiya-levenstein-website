<script lang="ts" setup>
const file = ref(null);
</script>

<template>
  <input
    class="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
    id="file_input"
    type="file"
    ref="file"
    @change="$emit('fileChanged', file.files[0])"
    required
  />
</template>
