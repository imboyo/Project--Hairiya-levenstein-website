<script lang="ts" setup>
// Props
interface Props {
  rounded?: string;
  img: string;
}

const props = defineProps<Props>();

const dynamicClass = computed(() => {
  const { rounded } = props;
  return `rounded-${rounded}`;
});
</script>

<template>
  <div :class="`overflow-hidden ${dynamicClass}`">
    <img :src="img" alt="img" class="w-full h-full object-cover" />
  </div>
</template>
