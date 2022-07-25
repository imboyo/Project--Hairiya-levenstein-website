<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { checkUserRole, verifyLogin } from "~/my_modules/auth";

const initialPageIsLoading = ref(true);

const router = useRouter();

// Initial check for all admin pages and only load sidenav once
const userRole = ref("");

onMounted(() => {
  verifyLogin(
    () => {
      initialPageIsLoading.value = false;
      checkUserRole((role) => {
        if (!(role === "admin")) {
          router.push("/auth/login");
        }
        userRole.value = role;
      });
    },
    () => {},
    () => {
      router.push({ path: "/auth/login" });
    }
  );
});
</script>

<template>
  <FullNavigation v-if="!initialPageIsLoading" :userRole="userRole">
    <slot></slot>
  </FullNavigation>
</template>
