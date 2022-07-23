<script lang="ts" setup>
import { validateField } from "~/my_modules/input_validation";
import MyErrorMessage from "~/components/inputs/MyErrorMessage.vue";
import HintMessage from "~/components/inputs/HintMessage.vue";

interface Props {
  rules: rule[];
  hints?: string[];
}

const props = defineProps<Props>();
// State

const selectedValue = ref("");
const errorState = ref<boolean | string>(false);

// Pass this function to parent as ref
const refreshValidation = (callback = null) => {
  errorState.value = validateField(selectedValue.value, props.rules);
  if (callback) callback(errorState.value);
};
defineExpose({ refreshValidation });

const emit = defineEmits(["changed"]);
</script>

<template>
  <div class="flex flex-col gap-2 w-full">
    <select
      class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
      v-model="selectedValue"
      @change="$emit('changed', { inputValue: selectedValue, errorState })"
    >
      <slot></slot>
    </select>
    <!--  Message  -->
    <MyErrorMessage v-if="errorState" :errorState="errorState" />
    <HintMessage v-if="hints" :hints="hints" />
  </div>
</template>
