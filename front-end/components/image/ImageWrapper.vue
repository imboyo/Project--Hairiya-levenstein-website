<script lang="ts" setup>
// Props
interface Props {
  height: string;
  width: string;
  rounded?: string;
  img: string;
}

const props = defineProps<Props>();

const dynamicClass = computed(() => {
  const { height, width, rounded } = props;
  return `h-${height} w-${width} rounded-${rounded}`;
});
</script>

<template>
  <div :class="`overflow-hidden ${dynamicClass}`">
    <img :src="img" alt="img" class="w-full h-full" style="object-fit: cover" />
  </div>
</template>
