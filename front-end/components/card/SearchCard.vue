<script setup lang="ts">
import ImageWrapper from "~/components/image/ImageWrapper.vue";

interface Props {
  title: string;
  subTitle: string;
}

const props = defineProps<Props>();
</script>

<template>
  <ImageWrapper
    rounded="full"
    img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
    class="mr-[12px] w-12 h-12"
  />
  <div class="flex flex-col">
    <h4 class="text-lg font-medium text-gray-900">{{ title }}</h4>
    <p class="uppercase text-sm text-gray-500">{{ subTitle }}</p>
  </div>
</template>
