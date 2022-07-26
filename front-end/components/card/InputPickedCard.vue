<template>
  <div
    class="px-4 py-2 bg-gray-200 rounded-md flex flex-row w-full text-gray-700"
  >
    <div class="flex justify-start w-full">
      <slot></slot>
    </div>
    <div class="flex justify-end w-full" @click="$emit('deleteClicked')">
      <button><span class="material-icons-outlined"> clear </span></button>
    </div>
  </div>
</template>
