import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { getOffsetPage } from "~/my_modules/pagination";
import { headers } from "~/my_modules/api_services/auth";

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
