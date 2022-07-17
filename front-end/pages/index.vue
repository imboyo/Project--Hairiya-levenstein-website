<script lang="ts" setup>
import { isEmail, isRequired, minLength } from "~/my_modules/input_validation";
import FileUpload from "~/components/inputs/FileUpload.vue";
import InputField from "~/components/inputs/InputField.vue";

// Rules for email input
const emailRules = [
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

// Form Input State
const formValues = reactive({
  email: "",
  password: "",
  checked: false,
  fileInput: "",
});

// Child Ref Component for accesing child funciton
const inputField = ref<InstanceType<typeof InputField> | null>(null);
const refreshInpuFieldValidation = () => {
  inputField.value?.refreshValidation();
};
</script>

<template>
  <div class="p-5">
    <div class="flex flex-col gap-5">
      <form>
        <InputField
          :rules="emailRules"
          placeholder="Masukkan Email"
          type="email"
          ref="inputField"
        />
        <FileUpload @fileChanged="formValues.fileInput = $event" />
        <button
          class="border py-2 px-3"
          @click.prevent="refreshInpuFieldValidation"
        >
          Submit
        </button>
      </form>
    </div>
  </div>
</template>
