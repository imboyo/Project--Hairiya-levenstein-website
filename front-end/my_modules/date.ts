export const getDateUntilNYear = (Year: number) => {
  const date = new Date();
  date.setFullYear(Year);
  return date;
};

export const getFullDate = (date: string) => {
  const d = new Date(date);
  return `${d.getDate()}/${d.getMonth() + 1}/${d.getFullYear()}`;
};
