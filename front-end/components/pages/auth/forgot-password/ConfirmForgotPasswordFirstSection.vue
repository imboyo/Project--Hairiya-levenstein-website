<script lang="ts" setup>
import FeaturedIcon from "~/components/icons/FeaturedIcon.vue";
import AuthTextHeader from "~/components/pages/auth/AuthTextHeader.vue";
import InputField from "~/components/inputs/InputField.vue";
import {
  checkFormIsError,
  isMatching,
  isRequired,
  minLength,
} from "~/my_modules/input_validation";

// Form Input State
const formValues = reactive({
  password1: "",
  password2: "",
});

const formErrorValues = reactive({
  password1: true,
  password2: true,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// Form Input Rules
const formInputRules = computed(() => {
  return {
    password1: [
      {
        validate: isRequired,
        text: "Tolong masukkan password anda",
      },
      {
        validate: (value) => minLength(value, 6),
        text: "Password minimal 6 karakter",
      },
    ],
    password2: [
      {
        validate: isRequired,
        text: "Tolong masukkan password anda",
      },
      {
        validate: () => isMatching(formValues.password1, formValues.password2),
        text: "Password tidak sesuai",
      },
    ],
  };
});
</script>

<template>
  {{ formInputRules.password2[1].validate() }}
  <!-- * Header -->
  <div class="flex flex-col gap-6 items-center">
    <!--  FeaturedIcon  -->
    <FeaturedIcon size="xl" theme="lightOutline" color="primary">
      vpn_key
    </FeaturedIcon>
    <!--  Text Header  -->
    <AuthTextHeader>
      <template #title>Atur kata sandi baru</template>
      <template #subTitle
        >Kata sandi baru Anda harus berbeda dengan kata sandi yang digunakan
        sebelumnya
      </template>
    </AuthTextHeader>
  </div>
  <!-- ! End Header -->

  <!-- * Form -->
  <div class="flex flex-col gap-6">
    <InputField
      placeholder="Password"
      :rules="formInputRules.password1"
      type="password"
      label="Kata sandi"
      required
      ref="emailField"
      @typing="
        formValues.password1 = $event.inputValue;
        formErrorValues.password1 = $event.errorState;
      "
    />
    <InputField
      placeholder="Konfirmasi kata sandi"
      :rules="formInputRules.password2"
      type="password"
      label="Konfirmasi kata sandi"
      required
      ref="emailField"
      @typing="
        formValues.password2 = $event.inputValue;
        formErrorValues.password2 = $event.errorState;
      "
    />
  </div>
  <!-- ! End Form -->
</template>
