// Truncate a string with n length
export const truncate = (str, n) => {
  return str.length > n ? str.slice(0, n - 3) + "..." : str;
};
