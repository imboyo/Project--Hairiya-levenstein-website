export const getOffsetPage = (page: number, limit: number) => {
  return (page - 1) * limit;
};
