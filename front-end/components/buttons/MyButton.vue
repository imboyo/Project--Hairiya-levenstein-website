<script lang="ts" setup>
// Props
interface Props {
  size: ButtonSizeProps;
  width: ButtonWidthProps;
  hieararchy: ButtonHierarchyProps;
}

const props = defineProps<Props>();

// * Get slot value for checking if empty or not
const { text, leading, trailling, onlyIcon } = useSlots();

// * Class state for dynamic styling based on props and slots used
// Button element class based on props
const buttonClass = {
  width: {
    fit: "w-max",
    full: "w-full",
  },
  size: {
    sm: `px-[14px] py-[8px] text-sm`,
    md: `px-[16px] py-[10px] text-sm"`,
    lg: `px-[18px] py-[10px] text-md`,
    xl: `px-[20px] py-[12px] text-md text-md`,
    "2xl": `px-[28px] py-[16px] text-lg text-lg`,
  },
  hieararchy: {
    primary: "bg-primary-600 text-white",
    secondary: "bg-primary-50 text-primary-700",
    "secondary-gray": "bg-gray-50 border-gray-300 border text-gray-700",
    tertiary: "text-primary-700",
    "tertiary-gray": "text-gray-500",
    link: "text-primary-700 shadow-none",
    "link-gray": "text-gray-500 shadow-none",
    destructive: "bg-error-600 text-white",
  },
};

// Icon General Class
const iconClass = {
  leading: {
    size: {
      sm: "w-[25px] pr-2",
      md: "w-[25px] pr-2",
      lg: "w-[25px] pr-2",
      xl: "w-[25px] pr-2",
      "2xl": "w-[35px] pr-3",
    },
  },
  trailling: {
    size: {
      sm: "w-[25px] pl-2",
      md: "w-[25px] pl-2",
      lg: "w-[25px] pl-2",
      xl: "w-[25px] pl-2",
      "2xl": "w-[35px] pl-3",
    },
  },
  onlyIcon: {
    size: {
      sm: "w-[20px]",
      md: "w-[20px]",
      lg: "w-[20px]",
      xl: "w-[20px]",
      "2xl": "w-[25px]",
    },
  },
};
// * END Class state for dynamic styling based on props and slots used
</script>

<template>
  <button
    :class="`rounded-lg ${buttonClass.width[width]} ${buttonClass.size[size]} ${buttonClass.hieararchy[hieararchy]} shadow-xs font-medium`"
  >
    <!--  Leading Icon  -->
    <span
      v-if="leading"
      :class="`inline-block align-middle ${iconClass.leading.size[size]}`"
    >
      <slot name="leading"></slot>
    </span>
    <!--  Text Button  -->
    <span v-if="text" class="inline-block align-middle">
      <slot name="text"></slot>
    </span>
    <!--  Trailling Icon  -->
    <span
      v-if="trailling"
      :class="`inline-block align-middle ${iconClass.trailling.size[size]}`"
    >
      <slot name="trailling"></slot>
    </span>
    <!--  Only Icon  -->
    <span
      v-if="onlyIcon"
      :class="`inline-block align-middle ${iconClass.onlyIcon.size[size]}`"
    >
      <slot name="onlyIcon"></slot>
    </span>
  </button>
</template>
