<script lang="ts" setup>
// Props
import { computed } from "#imports";

interface Props {
  theme: FeaturedThemeProps;
  size: FeaturedSizeProps;
  color: FeaturedTypeProps;
}

const props = defineProps<Props>();

// * Class state for dynamic styling based on props used
const defaultClass = {
  size: {
    circle: {
      xs: "h-[24px] w-[24px]",
      sm: "h-[32px] w-[32px]",
      md: "h-[40px] w-[40px]",
      lg: "h-[48px] w-[48px]",
      xl: "h-[56px] w-[56px]",
    },
    icon: {
      xs: "text-xs",
      sm: "text-md",
      md: "text-xl",
      lg: "text-display-xs",
      xl: "text-[28px]",
    },
  },
};

const featuredIconClassConfig = {
  light: {
    size: {
      circle: defaultClass.size.circle,
      icon: defaultClass.size.icon,
      border: {},
    },
    color: {
      circle: {
        primary: "bg-primary-100",
        gray: "bg-gray-100",
        error: "bg-error-100",
        warning: "bg-warning-100",
        success: "bg-success-100",
      },
      icon: {
        primary: "text-primary-700",
        gray: "text-gray-700",
        error: "text-error-700",
        warning: "text-warning-700",
        success: "text-success-700",
      },
    },
  },
  lightOutline: {
    size: {
      circle: defaultClass.size.circle,
      icon: defaultClass.size.icon,
      border: {
        xs: "border-[2px]",
        sm: "border-[4px]",
        md: "border-[6px]",
        lg: "border-[8px]",
        xl: "border-[10px]",
      },
    },
    color: {
      circle: {
        primary: "bg-primary-100 border-primary-50",
        gray: "bg-gray-100 border-gray-50",
        error: "bg-error-100 border-error-50",
        warning: "bg-warning-100 border-warning-50",
        success: "bg-success-100 border-success-50",
      },
      icon: {
        primary: "text-primary-700",
        gray: "text-gray-700",
        error: "text-error-700",
        warning: "text-warning-700",
        success: "text-success-700",
      },
    },
  },
  dark: {
    size: {
      circle: defaultClass.size.circle,
      icon: defaultClass.size.icon,
      border: {
        xs: "border-[2px]",
        sm: "border-[4px]",
        md: "border-[6px]",
        lg: "border-[8px]",
        xl: "border-[10px]",
      },
    },
    color: {
      circle: {
        primary: "bg-primary-600 border-primary-700",
        gray: "bg-gray-600 border-gray-700",
        error: "bg-error-600 border-error-700",
        warning: "bg-warning-600 border-warning-700",
        success: "bg-success-600 border-success-700",
      },
      icon: {
        primary: "text-white",
        gray: "text-white",
        error: "text-white",
        warning: "text-white",
        success: "text-white",
      },
    },
  },
};

const circleDynamicClass = computed(() => {
  const themeSelected = featuredIconClassConfig[props.theme];
  return `${themeSelected.size.circle[props.size]}
          ${themeSelected.size.border[props.size]}
          ${themeSelected.color.circle[props.color]}`;
});

const spanDynamicClass = computed(() => {
  const themeSelected = featuredIconClassConfig[props.theme];
  return `${themeSelected.size.icon[props.size]}
          ${themeSelected.color.icon[props.color]}`;
});
</script>

<template>
  <div
    :class="`flex justify-center items-center rounded-full transition duration-200 ${circleDynamicClass}`"
  >
    <span
      :class="`material-icons-outlined inline-block transition duration-200 ${spanDynamicClass}`"
    >
      <slot></slot>
    </span>
  </div>
</template>
