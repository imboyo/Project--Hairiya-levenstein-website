<script lang="ts" setup>
// Props
interface Props {
  type: FeaturedTypeProps;
  size: FeaturedSizeProps;
  color: FeaturedColorProps;
}

const props = defineProps<Props>();

// * Class state for dynamic styling based on props used
const featuredIconClass = {
  type: {
    // TODO: Buat nanti
  },
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
    :class="`flex justify-center items-center rounded-full ${featuredIconClass.size.circle[size]} ${featuredIconClass.color.circle[color]}`"
  >
    <span
      :class="`material-icons-outlined inline-block ${featuredIconClass.size.icon[size]} ${featuredIconClass.color.icon[color]}`"
    >
      {{ featuredIconClass.color.materialIcon[color] }}
    </span>
  </div>
</template>
