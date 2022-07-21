import { useState } from "nuxt/app";

export const useMobileNav = () => {
  const modalIsOpen = useState("modalIsOpen", () => false);

  const toggleMobileNav = () => {
    modalIsOpen.value = !modalIsOpen.value;
  };

  return {
    modalIsOpen,
    toggleMobileNav,
  };
};
