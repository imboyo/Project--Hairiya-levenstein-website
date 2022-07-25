<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";

// TODO: Check is admin or not then redirect if not admin
</script>

<template>
  <FullNavigation>
    <slot></slot>
  </FullNavigation>
</template>
