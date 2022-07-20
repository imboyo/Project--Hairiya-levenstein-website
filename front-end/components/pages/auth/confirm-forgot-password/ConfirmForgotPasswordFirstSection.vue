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
import MyButton from "~/components/buttons/MyButton.vue";

// Form Input State
const formValues = reactive({
  password1: "",
  password2: "",
});

const formErrorValues = reactive({
  password1: true,
  password2: true,
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
        validate: (password1) => minLength(password1, 6),
        text: "Password minimal 6 karakter",
      },
    ],
    password2: [
      {
        validate: isRequired,
        text: "Tolong masukkan password anda",
      },
      {
        validate: (password2) => isMatching(formValues.password1, password2),
        text: "Password tidak sesuai",
      },
    ],
  };
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const password1Field = ref<InstanceType<typeof InputField> | null>(null);
const password2Field = ref<InstanceType<typeof InputField> | null>(null);

const handleClick = () => {
  password1Field.value?.refreshValidation((value) => {
    formErrorValues.password1 = value;
  });
  password2Field.value?.refreshValidation((value) => {
    formErrorValues.password2 = value;
  });
};
</script>

<template>
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
      ref="password1Field"
      @typing="
        formValues.password1 = $event.inputValue;
        formErrorValues.password1 = $event.errorState;
        password2Field.refreshValidation((value) => {
          formErrorValues.password2 = value;
        });
      "
    />
    <InputField
      placeholder="Konfirmasi kata sandi"
      :rules="formInputRules.password2"
      type="password"
      label="Konfirmasi kata sandi"
      required
      ref="password2Field"
      @typing="
        formValues.password2 = $event.inputValue;
        formErrorValues.password2 = $event.errorState;
      "
    />
    <!-- ! End Form -->
    <!--  Button    -->
    <MyButton
      hieararchy="primary"
      size="lg"
      width="full"
      :disabled="formIsError"
      @clicked="
        handleClick();
        $emit('btn-clicked', formIsError);
      "
    >
      <template #text>Reset Kata Sandi</template>
    </MyButton>
  </div>
</template>
