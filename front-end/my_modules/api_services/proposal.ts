// Get Plagiarism List
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import { headers } from "~/my_modules/api_services/auth";

// Ambil data list plagiarism tiap document dari API berdasarkan 1 file di analisis
export const getPlagiarismList = async (file_name, successCb, errorCb) => {
  await axios
    .post(
      `${baseApiUrl}check-plagiarism/`,
      { file_name: file_name },
      { headers: headers() }
    )
    .then((response) => {
      successCb(response.data);
    })
    .catch((error) => {
      errorCb(error);
    });
};

// Get Proposal Detail
export const getProposalDetail = async (proposalId, successCb, errorCb) => {
  await axios
    .get(`${baseApiUrl}proposal/${proposalId}`, {
      headers: headers(),
    })
    .then((res) => {
      successCb(res.data);
    })
    .catch((error) => {
      errorCb(error);
    });
};
