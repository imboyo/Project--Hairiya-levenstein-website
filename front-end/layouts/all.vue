<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { checkUserRole, verifyLogin } from "~/my_modules/api_services/auth";

const initialPageIsLoading = ref(true);
const router = useRouter();

// For redirecting user is not have permission in this page then redirect them.
onBeforeMount(async () => {
  await verifyLogin(
    () => {
      initialPageIsLoading.value = false;
    },
    () => {},
    () => {
      router.push({ path: "/auth/login" });
    }
  );
});
</script>

<template>
  <FullNavigation>
    <slot></slot>
  </FullNavigation>
</template>
