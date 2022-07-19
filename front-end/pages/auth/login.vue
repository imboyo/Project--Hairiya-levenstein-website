<script setup lang="ts">
import {
  checkFormIsError,
  isEmail,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import InputCheckBox from "~/components/inputs/InputCheckBox.vue";
import MyButton from "~/components/buttons/MyButton.vue";

// Page Meta and main data
definePageMeta({
  layout: "auth",
});
useHead({
  titleTemplate: (title) => `Login - ${title}`,
});

// * State
// Form Input Rules
const formInputRules = {
  email: [
    {
      validate: isRequired,
      text: "Tolong masukkan email anda",
    },
    {
      validate: isEmail,
      text: "Tolong massukan email dengan benar",
    },
  ],
  password: [
    {
      validate: isRequired,
      text: "Tolong masukkan password anda",
    },
    {
      validate: (value) => value.length >= 8,
      text: "Minimum password 6 karakter",
    },
  ],
};

// Form Input State
const formValues = reactive({
  email: "",
  password: "",
  checked: false,
});

const formErrorValues = reactive({
  email: true,
  password: true,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const emailField = ref<InstanceType<typeof InputField> | null>(null);
const passwordField = ref<InstanceType<typeof InputField> | null>(null);

// Handle Click
const handleClick = () => {
  emailField.value?.refreshValidation((value) => {
    formErrorValues.email = value;
  });
  passwordField.value?.refreshValidation((value) => {
    formErrorValues.password = value;
  });

  if (!formIsError.value) {
    console.log("Form is valid");
  } else {
    console.log("Form is invalid");
  }
};
</script>

<template>
  <div>
    <!-- * Content Container  -->
    <!-- Header  -->
    <div class="flex flex-col items-center justify-center gap-6">
      <!--   Image wrapper   -->
      <div class="h-12 w-12 rounded-2xl overflow-hidden">
        <!--    TODO : Perbaiki nanti logo imagenya    -->
        <img
          src="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
          alt="header_logo"
          class="w-auto h-full object-cover"
        />
      </div>
      <!--   ! End Image wrapper    -->
      <!--   Text Header   -->
      <div class="text-center flex flex-col gap-2">
        <h3
          class="flex flex-col text-gray-900 text-display-xs font-semibold lg:text-display-sm"
        >
          Silahkan Login
        </h3>
        <h5 class="text-md text-gray-500">Selamat datang kembali!</h5>
      </div>
      <!--  !  End Text Header    -->
    </div>
    <!-- ! End Header  -->
    <!--   Form   -->
    <div class="flex flex-col gap-6">
      <!--   Input Field   -->
      <div class="flex flex-col gap-5">
        <InputField
          placeholder="Email"
          :rules="formInputRules.email"
          type="email"
          label="Email"
          required
          ref="emailField"
          @typing="
            formValues.email = $event.inputValue;
            formErrorValues.email = $event.errorState;
          "
        />
        <InputField
          placeholder="Password"
          :rules="formInputRules.password"
          type="email"
          label="Password"
          required
          ref="passwordField"
          @typing="
            formValues.password = $event.inputValue;
            formErrorValues.password = $event.errorState;
          "
        />
      </div>
      <!--  ! End Input Field   -->
      <!--   Button   -->
      <div class="flex flex-col gap-6">
        <div class="flex flex-row">
          <div class="flex w-6/12 justify-start">
            <InputCheckBox id="remember_me">Ingat Saya</InputCheckBox>
          </div>
          <!--    TODO: Linknya nanti perbaiki      -->
          <div class="flex w-6/12 justify-end">
            <a class="text-primary-700 text-sm font-medium inline-block"
              >Lupa Password</a
            >
          </div>
        </div>
        <MyButton
          hieararchy="primary"
          size="lg"
          width="full"
          :disabled="formIsError"
          @clicked="handleClick"
        >
          <template #text>Login</template>
        </MyButton>
      </div>
      <!--  ! End Button   -->
    </div>
    <!--   ! End Container   -->
  </div>
</template>
