<script lang="ts" setup>
import { validateField } from "~/my_modules/input_validation";
import MyErrorMessage from "~/components/inputs/MyErrorMessage.vue";

// Props
interface Props {
  rules: rule[];
}

const props = defineProps<Props>();

// Ref templates
const file = ref(null);

// State
const errorState = ref<boolean | string>(false);

// Pass this function to parent as ref
const refreshValidation = () => {
  errorState.value = validateField(file.value.files.length, props.rules);
};

defineExpose({ refreshValidation });
</script>

<template>
  <div class="flex flex-col gap-1">
    <input
      class="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
      :class="[errorState ? 'border-error-300' : '']"
      id="file_input"
      type="file"
      ref="file"
      @change="
        $emit('fileChanged', { file, errorState });
        refreshValidation();
        file = $event.target;
      "
    />
    <MyErrorMessage v-if="errorState" :errorState="errorState" />
  </div>
</template>