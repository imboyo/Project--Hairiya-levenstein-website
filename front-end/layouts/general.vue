<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { checkUserRole, verifyLogin } from "~/my_modules/auth";

const initialPageIsLoading = ref(true);

const router = useRouter();

onBeforeMount(() => {
  verifyLogin(
    () => {
      initialPageIsLoading.value = false;
      checkUserRole((role) => {
        if (!(role === "mahasiswa" || role === "dosen")) {
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
</script>

<template>
  <FullNavigation>
    <slot></slot>
  </FullNavigation>
</template>
