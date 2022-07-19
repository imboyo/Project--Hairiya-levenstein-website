<script lang="ts" setup>
// Props
interface Props {
  theme: FeaturedThemeProps;
  size: FeaturedSizeProps;
  type: FeaturedTypeProps;
}

const props = defineProps<Props>();

// * Class state for dynamic styling based on props used
const featuredIconClass = {
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
    border: {
      theme: {
        light: {},
        lightOutline: {
          xs: "border-[2px]",
          sm: "border-[4px]",
          md: "border-[6px]",
          lg: "border-[8px]",
          xl: "border-[10px]",
        },
        dark: {
          xs: "border-[2px]",
          sm: "border-[4px]",
          md: "border-[6px]",
          lg: "border-[8px]",
          xl: "border-[10px]",
        },
      },
    },
  },
  type: {
    theme: {
      light: {
        primary: "bg-primary-100",
        gray: "bg-gray-100",
        error: "bg-error-100",
        warning: "bg-warning-100",
        success: "bg-success-100",
      },
      lightOutline: {
        primary: "bg-primary-100 border-primary-50",
        gray: "bg-gray-100 border-gray-50",
        error: "bg-error-100 border-error-50",
        warning: "bg-warning-100 border-warning-50",
        success: "bg-success-100 border-success-50",
      },
      dark: {
        primary: "bg-primary-600 border-primary-700",
        gray: "bg-gray-600 border-gray-700",
        error: "bg-error-600 border-error-700",
        warning: "bg-warning-600 border-warning-700",
        success: "bg-success-600 border-success-700",
      },
    },
    icon: {
      theme: {
        light: {
          primary: "text-primary-700",
          gray: "text-gray-700",
          error: "text-error-700",
          warning: "text-warning-700",
          success: "text-success-700",
        },
        lightOutline: {
          primary: "text-primary-700",
          gray: "text-gray-700",
          error: "text-error-700",
          warning: "text-warning-700",
          success: "text-success-700",
        },
        dark: {
          primary: "text-white",
          gray: "text-white",
          error: "text-white",
          warning: "text-white",
          success: "text-white",
        },
      },
    },
    materialIcon: {
      primary: "bolt",
      gray: "bolt",
      error: "error_outline",
      warning: "warning_amber",
      success: "check_circle",
    },
  },
};
</script>

<template>
  <div
    :class="`flex justify-center items-center rounded-full ${featuredIconClass.size.circle[size]} ${featuredIconClass.type.theme[theme][type]} ${featuredIconClass.size.border.theme[theme][size]}`"
  >
    <span
      :class="`material-icons-outlined inline-block ${featuredIconClass.size.icon[size]} ${featuredIconClass.type.icon.theme[theme][type]}`"
    >
      {{ featuredIconClass.type.materialIcon[type] }}
    </span>
  </div>
</template>
