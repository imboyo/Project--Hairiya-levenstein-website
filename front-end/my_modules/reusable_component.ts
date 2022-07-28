import { checkUserRole, verifyLogin } from "~/my_modules/api_services/auth";

export const verifyRolePageUser = (pageRole, initialPageIsLoading) => {
  const router = useRouter();

  onBeforeMount(async () => {
    await verifyLogin(
      () => {
        console.log(pageRole);
        checkUserRole((role) => {
          if (!(role === pageRole)) {
            router.push({ path: "/" });
          } else {
            initialPageIsLoading.value = false;
          }
        });
      },
      () => {},
      () => {
        router.push({ path: "/" });
      }
    );
  });
};
