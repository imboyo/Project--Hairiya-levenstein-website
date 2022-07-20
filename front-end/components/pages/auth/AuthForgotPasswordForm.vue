<script lang="ts" setup>
// Form Input Rules
import {
  checkFormIsError,
  isEmail,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import MyButton from "~/components/buttons/MyButton.vue";

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
};

// Form input state
const emailState = ref("");
const emailErrorState = ref("");

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError({ emailErrorState: emailErrorState.value });
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const emailField = ref<InstanceType<typeof InputField> | null>(null);

const handleClick = () => {
  emailField.value?.refreshValidation((value) => {
    emailErrorState.value = value;
  });
};
</script>

<template>
  <!--   Form   -->
  <div class="flex flex-col gap-6">
    <InputField
      placeholder="Email"
      :rules="formInputRules.email"
      type="email"
      label="Email"
      required
      ref="emailField"
      @typing="
        emailState = $event.inputValue;
        emailErrorState = $event.errorState;
        $emit('typing', $event.inputValue);
      "
    />
    <!--  Button    -->
    <MyButton
      hieararchy="primary"
      size="lg"
      width="full"
      :disabled="formIsError"
      @clicked="
        handleClick;
        $emit('btnClicked', formIsError);
      "
    >
      <template #text>Reset Password</template>
    </MyButton>
  </div>
</template>
