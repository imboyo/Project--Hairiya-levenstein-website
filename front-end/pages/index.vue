<script lang="ts" setup>
import FeaturedIcon from "~/components/icons/FeaturedIcon.vue";

const iconReactive = reactive({
  theme: "light",
  size: "md",
  type: "primary",
});
</script>

<template>
  <div>
    <FeaturedIcon
      :theme="iconReactive.theme"
      :size="iconReactive.size"
      :type="iconReactive.type"
    />

    <button @click="iconReactive.theme = 'dark'">Click Me</button>
  </div>
</template>
