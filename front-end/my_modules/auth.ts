import axios from "axios";
import { getDateUntilNYear } from "~/my_modules/date";

const config = useRuntimeConfig();

// Cookie function
const cookieToken = useCookie("token", {
  sameSite: "strict",
  expires: getDateUntilNYear(2100),
});

export const verifyLogin = async () => {
  await axios
    .post(`${config.public.baseApiUrl}auth/jwt/verify`, {
      token: sessionStorage.getItem("token") ?? cookieToken.value,
    })
    .then((response) => {
      const status = response.status;
      if (status === 200) {
        console.log("Token is good");
        // If token is good
        // Redirect to dashboard
        // router.push("/dashboard");
      } else {
        console.log("Token is not good");
        // If token is bad
        // Redirect to login
        // router.push("/login");
      }
    })
    .catch((error) => {
      console.log("Token is error");
      // If token is bad
      // Redirect to login
      // router.push("/login");
    });
};
