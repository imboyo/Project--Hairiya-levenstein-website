// Truncate a string with n length
export const truncate = (str, n) => {
  return str.length > n ? str.slice(0, n - 3) + "..." : str;
};

export const splitStringBySpace = (string) => {
  return string.split(" ");
};

// changet this ["Mabrur", "Syamhur", "Ikhsan"]
export const splitArrayInto2Array = (array) => {
  const newArray = [];
  array.map((item, index) => {
    // Masukkan array pertama langsung
    if (index === 0) {
      newArray.push(item);
    } else {
      // Gabungkan array index 1 dan seterusnya dan berikan space
      if (newArray[1]) {
        newArray[1] += " " + item;
      } else {
        // Jika belum ada array index 1, langsung saja push
        newArray.push(item);
      }
    }
    return newArray;
  });
};
