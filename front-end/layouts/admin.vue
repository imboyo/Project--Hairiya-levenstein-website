<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { checkUserRole, verifyLogin } from "~/my_modules/auth";

const initialPageIsLoading = ref(true);

const router = useRouter();

onMounted(() => {
  verifyLogin(
    () => {
      initialPageIsLoading.value = false;
      checkUserRole((role) => {
        if (!(role === "admin")) {
          router.push("/auth/login");
        }
      });
    },
    () => {},
    () => {
      router.push({ path: "/auth/login" });
    }
  );
});

provide("role", "admin");
</script>

<template>
  <FullNavigation v-if="!initialPageIsLoading">
    <slot></slot>
  </FullNavigation>
</template>
