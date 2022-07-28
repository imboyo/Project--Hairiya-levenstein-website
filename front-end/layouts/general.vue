<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { checkUserRole, verifyLogin } from "~/my_modules/api_services/auth";

const initialPageIsLoading = ref(true);

const router = useRouter();

onBeforeMount(() => {
  verifyLogin(
    () => {
      checkUserRole((role) => {
        if (!(role === "mahasiswa" || role === "dosen")) {
          router.push("/auth/login");
        } else {
          initialPageIsLoading.value = false;
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
    <template v-if="!initialPageIsLoading">
      <slot></slot>
    </template>
  </FullNavigation>
</template>
