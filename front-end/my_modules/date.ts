export const getDateUntilNYear = (Year: number) => {
  const date = new Date();
  date.setFullYear(Year);
  return date;
};
