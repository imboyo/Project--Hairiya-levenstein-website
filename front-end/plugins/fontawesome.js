import { defineNuxtPlugin } from "nuxt/app";
import { library, config } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

/* import specific icons */
import {
  faUserSecret,
  faCircleNotch,
  faBolt,
  faExclamation,
} from "@fortawesome/free-solid-svg-icons";
import { faCircle } from "@fortawesome/free-regular-svg-icons";

/* add icons to the library */
library.add(faUserSecret, faCircleNotch, faCircle, faBolt, faExclamation);

// This is important, we are going to let Nuxt.js worry about the CSS
config.autoAddCss = false;

// Register the component globally
export default defineNuxtPlugin((nuxtApp) => {
  nuxtApp.vueApp.component("font-awesome-icon", FontAwesomeIcon);
});
