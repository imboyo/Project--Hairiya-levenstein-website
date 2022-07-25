<script lang="ts" setup>
import FullNavigation from "~/components/navigation/FullNavigation.vue";
import { checkUserRole, verifyLogin } from "~/my_modules/auth";

const initialPageIsLoading = ref(true);

const router = useRouter();

// Initial check for all admin pages and only load sidenav once
onMounted(() => {
  verifyLogin(
    () => {
      initialPageIsLoading.value = false;
      checkUserRole("admin", (data) => console.log(data));
    },
    () => {},
    () => router.push({ path: "/auth/login" })
  );
});

// * Jika ingin check user role ketika page berubah, maka gunakan ini:
// * Masalahnya adalah memberatkan server jadi cukup sekali ajah
// onUpdated(() => {
//   verifyLogin(
//     () => {
//       console.log("success");
//     },
//     () => {},
//     () => router.push({ path: "/auth/login" })
//   );
// });
</script>

<template>
  <FullNavigation v-if="!initialPageIsLoading">
    <slot></slot>
  </FullNavigation>
</template>
