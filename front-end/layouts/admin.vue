<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { verifyRolePageUser } from "~/my_modules/reusable_component";

const initialPageIsLoading = ref(true);

// For redirecting user is not have permission in this page then redirect them.
onMounted(() => verifyRolePageUser("admin", initialPageIsLoading));

provide("role", "admin");
</script>

<template>
  <FullNavigation>
    <slot></slot>
  </FullNavigation>
</template>
