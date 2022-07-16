<script lang="ts" setup>
import InputField from "~/components/inputs/InputField.vue";
import { isEmail, isRequired, minLength } from "~/my_modules/input_validation";

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

const formValues = reactive({
  email: "",
  password: "",
});
</script>

<template>
  <div class="p-5">
    {{ formValues.email }}
    <div class="flex flex-col gap-5">
      <InputField
        placeholder="Masukkan email"
        icon="email"
        type="email"
        :rules="rules"
        @typing="formValues.email = $event"
      />
    </div>
  </div>
</template>
