export const isRequired = (value: string): boolean => {
  return value.length > 0;
};

export const minLength = (value: string, length: number): boolean => {
  return value.length >= length;
};

export const isEmail = (value: string) => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
};

export const isMatching = (value1, value2): boolean => {
  return value1 === value2;
};

export const isStrongPassword = (value: string): boolean => {
  return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(
    value
  );
};

export const validateField = (value, rules) => {
  let finalValue: string | boolean = false;

  for (let i = 0; i < rules.length; i++) {
    if (!rules[i].validate(value)) {
      finalValue = rules[i].text;
      break;
    }
  }
  return finalValue;
};

export const checkFormIsError = (formErrorValues) => {
  // Check if formValues is empty or not
  for (const key in formErrorValues) {
    if (formErrorValues[key] !== false) {
      return true;
    }
  }

  return false;
};
