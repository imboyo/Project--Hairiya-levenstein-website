import { checkUserRole, verifyLogin } from "~/my_modules/auth";

export const verifyAdminPageUser = () => {
  const router = useRouter();

  onBeforeMount(async () => {
    await verifyLogin(
      () => {
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
};
