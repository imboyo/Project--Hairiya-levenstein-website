import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { getOffsetPage } from "~/my_modules/pagination";
import { getAccessToken, headers } from "~/my_modules/api_services/auth";

export const getUsersService = (
  limit,
  page,
  searchState,
  typeSelectState,
  isSuccess,
  isError
) => {
  axios
    .get(
      `${baseApiUrl}user/?limit=${limit}&offset=${getOffsetPage(
        page,
        limit
      )}&search=${searchState}&profile__role=${typeSelectState}`,
      { headers: headers() }
    )
    .then((res) => {
      isSuccess(res.data);
    })
    .catch((err) => {
      isError(err);
    });
};

export const checkIsUserExist = async (username, cbSucces, cbError) => {
  await axios
    .get(`${baseApiUrl}user/check-username/${username}/`, {
      headers: headers(),
    })
    .then((res) => {
      cbSucces(res);
    })
    .catch((err) => {
      cbError(err);
    });
};
