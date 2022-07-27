export const getOffsetPage = (page: number, limit: number) => {
  return (page - 1) * limit;
};

// Function panigation from data like this:
// [{},{},{}] with limit , page and total then change data output from page value
export const getPagination = (data: any, limit: number, page: number) => {
  const offset = getOffsetPage(page, limit);
  const total = data.length;
  const totalPage = Math.ceil(total / limit);
  const dataPagination = data.slice(offset, offset + limit);
  return {
    dataPagination,
    totalPage,
    total,
  };
};
