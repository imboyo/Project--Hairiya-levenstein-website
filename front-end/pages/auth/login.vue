<script setup lang="ts">
import { isEmail, isRequired } from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import InputCheckBox from "~/components/inputs/InputCheckBox.vue";
import MyButton from "~/components/buttons/MyButton.vue";

useHead({
  titleTemplate: (title) => `Login - ${title}`,
});

// * State
// Form Input Rules
const formInputRules = {
  email: [
    {
      validate: isRequired,
      text: "Please enter your email",
    },
    {
      validate: isEmail,
      text: "Please enter a valid email",
    },
  ],
};
</script>

<template>
  <!-- Page Container -->
  <div class="flex justify-center px-4 sm:px-12 md:p-0">
    <!-- * Item Container -->
    <div
      class="flex flex-col h-screen justify-center gap-8 w-full md:w-[22.5rem]"
    >
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
            placeholder="Email/Nomor Induk"
            :rules="formInputRules.email"
            type="email"
            label="Email/Nomor Induk"
          />
          <InputField
            placeholder="Password"
            :rules="formInputRules.email"
            type="email"
            label="Password"
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
                >Forgot Password</a
              >
            </div>
          </div>
          <MyButton hieararchy="primary" size="lg" width="full">
            <template #text> Login</template>
          </MyButton>
        </div>
        <!--  ! End Button   -->
      </div>
      <!--   ! End Container   -->
    </div>
    <!-- ! End Container -->
  </div>
  <!-- End Page Container -->
</template>
