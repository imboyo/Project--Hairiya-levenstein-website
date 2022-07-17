<script lang="ts" setup>
// Props
interface Props {
  size: ButtonSizeProps;
  width: ButtonWidthProps;
  hieararchy: ButtonHierarchyProps;
}

const props = defineProps<Props>();

const { text, leading } = useSlots();

const textClass = {
  sm: "text-sm",
  md: "text-sm",
  lg: "text-md",
  xl: "text-md",
  "2xl": "text-lg",
};

// state
const filterClass = {
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
</script>

<template>
  <button
    :class="`rounded-lg ${filterClass.width[width]} ${filterClass.size[size]} ${filterClass.hieararchy[hieararchy]} shadow-xs font-medium`"
  >
    <!--  Leading Icon  -->
    <i class="fa-solid fa-circle-notch"></i>
    <!--  Text Button  -->
    <span v-if="text" class="inline-block">
      <slot name="text"></slot>
    </span>
  </button>
</template>
