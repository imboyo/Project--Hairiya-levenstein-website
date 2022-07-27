export const findIndexArray = (array, key, value) => {
  return array.findIndex((item) => item[key] === value);
};

export const parseLatestFileName = (fileName) => {
  const fileNameArray = fileName.split("/");
  return fileNameArray[fileNameArray.length - 1];
};

export const removeExtensionFile = (fileName) => {
  const fileNameArray = fileName.split(".");
  return fileNameArray[0];
};
