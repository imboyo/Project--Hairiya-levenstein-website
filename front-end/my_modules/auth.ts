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

export const getUserById = async (id, successCallback) => {
  await axios
    .get(`${baseApiUrl}user/${id}`, {
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

export const checkUserRole = async (role) => {
  await getMe((user) => {
    const username = user.username;
    getUserDetailsByUsername(username, (userDetails) => {
      role(userDetails[0].profile.role);
    });
  });
};

export const deleteCookieOrSession = (name) => {
  document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;`;
  sessionStorage.removeItem(name);
};

export const loginRoleRedirect = async () => {
  const router = useRouter();
  await checkUserRole((role) => {
    if (role === "admin") {
      router.push({ path: "/admin/dashboard" });
    } else {
      router.push({ path: "/general/dashboard" });
    }
  });
};
