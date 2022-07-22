<template>
  <div class="flex flex-col gap-1">
    <h3 class="text-lg font-medium inline-block">
      <slot name="title"></slot>
    </h3>
    <p class="text-sm text-gray-500 inline-block">
      <slot name="description"></slot>
    </p>
  </div>
</template>
