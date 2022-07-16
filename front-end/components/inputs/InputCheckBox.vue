<script lang="ts" setup>
interface Props {
  id: string;
}

const props = defineProps<Props>();
</script>

<template>
  <div>
    <input
      class="form-check-input appearance-none h-4 w-4 border border-gray-300 rounded-md bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer"
      type="checkbox"
      :id="id"
      value="option1"
      @change="$emit('changed', $event.target.checked)"
    />
    <label class="form-check-label inline-block text-gray-800" :for="id">
      <slot></slot>
    </label>
  </div>
</template>
