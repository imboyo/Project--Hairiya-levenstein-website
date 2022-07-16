<script lang="ts" setup>
import {
  isEmail,
  isRequired,
  minLength,
  validateField,
} from "~/my_modules/input_validation";

interface Props {
  disabled?: boolean;
  icon?: string;
  label?: string;
  validation?: Function;
  hints?: string[];
  placeholder: string;
}

const rules = [
  {
    text: "This field is required",
    validate: isRequired,
  },
  {
    text: "Minimum characters is 6",
    validate: (value) => minLength(value, 6),
  },
  {
    text: "Insert a valid email",
    validate: (value) => isEmail(value),
  },
];

const inputValue = ref("");

const errorState = ref<boolean | string>(false);

watch(inputValue, (newInputValue) => {
  errorState.value = validateField(newInputValue, rules);
});

const props = defineProps<Props>();
</script>

<template>
  <div class="flex flex-col gap-1">
    <label v-if="label" class="mb-1 text-sm font-medium text-gray-700"
      >Email</label
    >
    <div class="flex flex-row relative">
      <span
        v-if="icon"
        class="material-icons-outlined absolute left-3 top-1.5 text-xl text-gray-500"
      >
        {{ icon }}
      </span>
      <input
        type="text"
        class="py-2 px-3 rounded-lg border shadow-xs border-gray-300 w-full focus:border-primary-300 focus:shadow-xs-focused-primary-100"
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
    <!--  Error Message  -->
    <span class="block text-sm text-error-500" v-if="errorState">{{
      errorState
    }}</span>
    <!--  Hint Message  -->
    <div v-if="hints" class="flex flex-col">
      <span v-for="item in hints" class="text-sm text-gray-500">{{
        item
      }}</span>
    </div>
  </div>
</template>
