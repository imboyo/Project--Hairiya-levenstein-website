import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";

const getCookie = (name) => {
  const value = "; " + document.cookie;
  const parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
};

export const getAccessToken = () => {
  return sessionStorage.getItem("token") ?? getCookie("token");
};

export const verifyLogin = async (
  successCallback,
  badTokenCallback,
  errorCallback
) => {
  await axios
    .post(`${baseApiUrl}auth/jwt/verify`, {
      token: getAccessToken(),
    })
    .then((response) => {
      const status = response.status;
      if (status === 200) {
        const token = sessionStorage.getItem("token") ?? getCookie("token");
        successCallback(response);
      } else {
        badTokenCallback(response);
      }
    })
    .catch((error) => {
      errorCallback(error);
    });
};

const headers = () => {
  return { Authorization: `Bearer ${getAccessToken()}` };
};

export const getMe = async (successCallback) => {
  await axios
    .get(`${baseApiUrl}auth/users/me`, {
      headers: headers(),
    })
    .then((response) => {
      successCallback(response.data);
    });
};

export const getUserDetailsByUsername = async (username, successCallback) => {
  await axios
    .get(`${baseApiUrl}user?username=${username}`, {
      headers: headers(),
    })
    .then((response) => {
      successCallback(response.data);
    });
};

export const checkUserRole = async (role, data) => {
  await getMe((user) => {
    const username = user.username;
    getUserDetailsByUsername(username, (userDetails) => {
      data(userDetails[0].profile.role === role);
    });
  });
};
