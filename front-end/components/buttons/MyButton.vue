<script lang="ts" setup>
// Props
interface Props {
  size: ButtonSizeProps;
  width: ButtonWidthProps;
  hieararchy: ButtonHierarchyProps;
  destructive?: boolean;
  disabled?: boolean;
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
    md: `px-[16px] py-[10px] text-sm`,
    lg: `px-[18px] py-[10px] text-md`,
    xl: `px-[20px] py-[12px] text-md text-md`,
    "2xl": `px-[28px] py-[16px] text-lg text-lg`,
  },
  type: {
    normal: {
      default: {
        primary:
          "bg-primary-600 text-white " +
          "active:shadow-xs-focused-primary-100 " +
          "hover:bg-primary-700",
        secondary:
          "bg-primary-50 text-primary-700 " +
          "active:shadow-xs-focused-primary-100 " +
          "hover:bg-primary-100",
        "secondary-gray":
          "bg-gray-50 border-gray-300 border text-gray-700 " +
          "active:shadow-xs-focused-grey-100 " +
          "hover:bg-gray-300",
        tertiary: "text-primary-700 " + "hover:bg-primary-50",
        "tertiary-gray": "text-gray-500 " + "hover:bg-gray-50",
        link: "text-primary-700 shadow-none",
        "link-gray": "text-gray-500 shadow-none",
      },
      destructive: {
        primary:
          "bg-error-600 text-white " +
          "active:shadow-xs-focused-error-100 " +
          "hover:bg-error-700",
        secondary:
          "bg-error-50 text-error-700 " +
          "active:shadow-xs-focused-error-100 " +
          "hover:bg-error-100",
        "secondary-gray":
          "bg-white border-error-300 border text-error-700 " +
          "active:shadow-xs-focused-error-100 " +
          "hover:bg-error-50",
        tertiary: "text-error-700 " + "hover:bg-error-50",
        "tertiary-gray": "text-error-700 " + "hover:bg-error-50",
        link: "text-error-700 shadow-none",
        "link-gray": "text-error-700 shadow-none",
      },
    },

    disabled: {
      default: {
        primary: "bg-primary-200 text-white",
        secondary: "bg-primary-25 text-primary-300",
        "secondary-gray": "bg-white border-gray-200 border text-gray-300",
        tertiary: "text-gray-300",
        "tertiary-gray": "text-gray-300",
        link: "text-gray-300 shadow-none",
        "link-gray": "text-gray-300 shadow-none",
      },
      destructive: {
        primary: "bg-error-200 text-white",
        secondary: "bg-error-25 text-error-300",
        "secondary-gray": "bg-white border-error-200 border text-error-300",
        tertiary: "text-error-300",
        "tertiary-gray": "text-error-300",
        link: "text-error-300 shadow-none",
        "link-gray": "text-error-300 shadow-none",
      },
    },
  },
  icon: {
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
  },
};
// * END Class state for dynamic styling based on props and slots used

// Dynamic class based on destructive, disabled and hierarchy props
const buttonTypeClassObject = computed(() => {
  // Check if Normal Button
  if (!props.disabled) {
    // Check if button is not destructive
    if (!props.destructive) {
      return buttonClass.type.normal.default[props.hieararchy];
    } else {
      return buttonClass.type.normal.destructive[props.hieararchy];
    }
  } else {
    // Disabled Button
    if (!props.destructive) {
      return (
        buttonClass.type.disabled.default[props.hieararchy] +
        " cursor-not-allowed"
      );
    } else {
      return (
        buttonClass.type.disabled.destructive[props.hieararchy] +
        " cursor-not-allowed"
      );
    }
  }
});
</script>

<template>
  <button
    :class="[
      `rounded-lg font-medium transition shadow-xs duration-150 ${buttonClass.width[width]} ${buttonClass.size[size]}`,
      buttonTypeClassObject,
    ]"
    @click.prevent="$emit('clicked')"
  >
    <!--  Leading Icon  -->
    <span
      v-if="leading"
      :class="`inline-block align-middle ${buttonClass.icon.leading.size[size]}`"
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
      :class="`inline-block align-middle ${buttonClass.icon.trailling.size[size]}`"
    >
      <slot name="trailling"></slot>
    </span>
    <!--  Only Icon  -->
    <span
      v-if="onlyIcon"
      :class="`inline-block align-middle ${buttonClass.icon.onlyIcon.size[size]}`"
    >
      <slot name="onlyIcon"></slot>
    </span>
  </button>
</template>
