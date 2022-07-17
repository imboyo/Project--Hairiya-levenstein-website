<script lang="ts" setup>
// Props
interface Props {
  size: ButtonSizeProps;
  width: ButtonWidthProps;
  hieararchy: ButtonHierarchyProps;
}

const props = defineProps<Props>();

// * Get slot value for checking if empty or not
const { text, leading, trailling } = useSlots();

// * Class state--------------------
const textClass = {
  sm: "text-sm",
  md: "text-sm",
  lg: "text-md",
  xl: "text-md",
  "2xl": "text-lg",
};

// Button element class based on props
const buttonClass = {
  width: {
    fit: "w-max",
    full: "w-full",
  },
  size: {
    sm: `px-[14px] py-[8px] ${textClass.sm}`,
    md: `px-[16px] py-[10px] ${textClass.md}`,
    lg: `px-[18px] py-[10px] ${textClass.lg}`,
    xl: `px-[20px] py-[12px] text-md ${textClass.xl}`,
    "2xl": `px-[28px] py-[16px] text-lg ${textClass["2xl"]}`,
  },
  hieararchy: {
    primary: "bg-primary-600 text-white",
    secondary: "bg-primary-50 text-primary-700",
    "secondary-gray": "bg-gray-50 border-gray-300 border text-gray-700",
    tertiary: "text-primary-700",
    "tertiary-gray": "text-gray-500",
    link: "text-primary-700 shadow-none",
    "link-gray": "text-gray-500 shadow-none p-0",
  },
};

// Icon General Class
const iconClass = {
  size: {
    sm: "w-[25px] pr-2",
    md: "w-[25px] pr-2",
    lg: "w-[25px] pr-2",
    xl: "w-[25px] pr-2",
    "2xl": "w-35px pr-3",
  },
};
</script>

<template>
  <button
    :class="`rounded-lg ${buttonClass.width[width]} ${buttonClass.size[size]} ${buttonClass.hieararchy[hieararchy]} shadow-xs font-medium`"
  >
    <!--  Leading Icon  -->
    <span
      v-if="leading"
      :class="`inline-block align-middle ${iconClass.size[size]}`"
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
      :class="`inline-block align-middle ${iconClass.size[size]}`"
    >
      <slot name="trailling"></slot>
    </span>
  </button>
</template>
