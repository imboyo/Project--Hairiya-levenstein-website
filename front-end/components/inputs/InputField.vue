<script lang="ts" setup>
import { validateField } from "~/my_modules/input_validation";
import MyErrorMessage from "~/components/inputs/MyErrorMessage.vue";
import HintMessage from "~/components/inputs/HintMessage.vue";

// Props
interface Props {
  type: string;
  disabled?: boolean;
  icon?: string;
  label?: string;
  rules: rule[];
  hints?: string[];
  placeholder: string;
  required?: boolean;
  value?: string;
}

const props = defineProps<Props>();

// state
const inputValue = ref("");
const errorState = ref<boolean | string>(false);

// Pass this function to parent as ref
const refreshValidation = (callback = null) => {
  errorState.value = validateField(inputValue.value, props.rules);
  if (callback) callback(errorState.value);
};
defineExpose({ refreshValidation });

const propsValue = ref(" ");

watch(inputValue, (value) => {
  propsValue.value = value;
});
</script>

<template>
  <div class="flex flex-col gap-1">
    <label v-if="label" class="mb-1 text-sm font-medium">
      <span class="text-gray-700">{{ label }}</span>
      <span v-if="required" class="text-red-700"> *</span>
    </label>
    <div class="flex flex-row relative">
      <span
        v-if="icon"
        class="material-icons-outlined absolute left-3 top-1.5 text-xl text-gray-500"
      >
        {{ icon }}
      </span>
      <input
        :type="type"
        class="py-2 px-3 rounded-lg border shadow-xs border-gray-300 w-full focus:border-primary-300 focus:ring-0 focus:shadow-xs-focused-primary-100"
        :placeholder="placeholder"
        :disabled="disabled"
        :class="[
          disabled ? 'bg-gray-50' : '',
          icon ? 'pl-10' : '',
          errorState
            ? 'border-error-300 focus:shadow-xs-focused-error-100'
            : '',
        ]"
        v-model="inputValue"
        :value="propsValue"
        @keyup="
          refreshValidation();
          $emit('typing', { inputValue, errorState });
        "
      />
      <span
        v-if="errorState"
        class="material-icons-outlined absolute text-error-500 mb-1 text-xl right-3 top-1.5"
      >
        info
      </span>
      <span
        v-if="!errorState && inputValue.length > 0"
        class="material-icons-outlined absolute text-primary-500 mb-1 text-xl right-3 top-1.5"
        >done</span
      >
    </div>
    <!--  Message  -->
    <MyErrorMessage v-if="errorState" :errorState="errorState" />
    <HintMessage v-if="hints" :hints="hints" />
  </div>
</template>
