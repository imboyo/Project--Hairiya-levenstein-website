import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { getOffsetPage } from "~/my_modules/pagination";
import { getAccessToken } from "~/my_modules/auth";

export const fetchProposal = async (
  proposal,
  limit: number,
  currPage: number,
  searchState,
  tableIsLoading,
  proposalPagination
) => {
  await axios
    .get(
      `${baseApiUrl}proposal?limit=${limit}&offset=${getOffsetPage(
        currPage,
        limit
      )}&search=${searchState.value}`,
      {
        headers: { Authorization: `Bearer ${getAccessToken()}` },
      }
    )
    .then((response) => {
      const data = response.data;
      proposal.value = data.results;
      // Round to higher

      proposalPagination.totalPage = Math.ceil(data.count / limit);
      tableIsLoading.value = false;
    })
    .catch((error) => {
      console.log(error);
    });
};
