import { checkUserRole, verifyLogin } from "~/my_modules/auth";

export const verifyRolePageUser = (userRole, initialPageIsLoading) => {
  const router = useRouter();

  onBeforeMount(async () => {
    await verifyLogin(
      () => {
        initialPageIsLoading.value = false;
        checkUserRole((role) => {
          if (!(role === userRole)) {
            router.push({ path: "/auth/login" });
          }
        });
      },
      () => {},
      () => {
        router.push({ path: "/auth/login" });
      }
    );
  });
};
