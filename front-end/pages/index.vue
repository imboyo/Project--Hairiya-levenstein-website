<script lang="ts" setup>
import { isEmail, isRequired, minLength } from "~/my_modules/input_validation";
import FileUpload from "~/components/inputs/FileUpload.vue";
import InputField from "~/components/inputs/InputField.vue";

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

const fileInput = ref();
</script>

<template>
  <div class="p-5">
    <div class="flex flex-col gap-5">
      <form>
        <InputField :rules="rules" placeholder="Masukkan Email" type="email" />
        <FileUpload @fileChanged="fileInput = $event" />
        <button class="border py-2 px-3" @click.prevent="">Submit</button>
      </form>
    </div>
  </div>
</template>
