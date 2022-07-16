<script lang="ts" setup>
import InputField from "~/components/inputs/InputField.vue";
import { isEmail, isRequired, minLength } from "~/my_modules/input_validation";
import InputCheckBox from "~/components/inputs/InputCheckBox.vue";

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
  checked: false,
});
</script>

<template>
  <div class="p-5">
    {{ formValues.checked }}
    <div class="flex flex-col gap-5">
      <InputField
        placeholder="Masukkan email"
        icon="email"
        type="email"
        :rules="rules"
        @typing="formValues.email = $event"
      />
      <InputCheckBox @changed="formValues.checked = $event" id="rememberMe"
        >Ingat Saya
      </InputCheckBox>
    </div>
  </div>
</template>
