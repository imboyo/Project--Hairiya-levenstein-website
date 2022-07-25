import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";

const getCookie = (name) => {
  const value = "; " + document.cookie;
  const parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
};

export const verifyLogin = async (
  successCallback,
  badTokenCallback,
  errorCallback
) => {
  await axios
    .post(`${baseApiUrl}auth/jwt/verify`, {
      token: sessionStorage.getItem("token") ?? getCookie("token"),
    })
    .then((response) => {
      const status = response.status;
      if (status === 200) {
        successCallback(response);
      } else {
        badTokenCallback(response);
      }
    })
    .catch((error) => {
      errorCallback(error);
    });
};
