<template>
  <div class="text-center flex flex-col gap-2">
    <h3
      class="flex flex-col text-gray-900 text-display-xs font-semibold lg:text-display-sm"
    >
      <slot name="title"></slot>
    </h3>
    <h5 class="text-md text-gray-500">
      <slot name="subTitle"></slot>
    </h5>
  </div>
</template>
