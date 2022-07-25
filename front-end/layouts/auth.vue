<script setup lang="ts">
import {
  checkUserRole,
  loginRoleRedirect,
  verifyLogin,
} from "~/my_modules/auth";
const initialPageIsLoading = ref(true);

const router = useRouter();
// Check Logged in or not
onBeforeMount(() => {
  verifyLogin(
    () => {
      loginRoleRedirect();
    },
    () => {},
    () => {
      initialPageIsLoading.value = false;
    }
  );
});
</script>

<template>
  <div
    class="flex justify-center px-4 sm:px-12 md:p-0"
    v-if="!initialPageIsLoading"
  >
    <slot></slot>
  </div>
</template>
