export const isRequired = (value: string): boolean => {
  return value.length > 0;
};

export const minLength = (value: string, length: number): boolean => {
  return value.length > length;
};

export const isEmail = (value: string) => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
};

export const validateField = (value, rules) => {
  let finalValue: string | boolean = null;

  for (let i = 0; i < rules.length; i++) {
    if (!rules[i].validate(value)) {
      finalValue = rules[i].text;
      break;
    }
  }
  return finalValue;
};
