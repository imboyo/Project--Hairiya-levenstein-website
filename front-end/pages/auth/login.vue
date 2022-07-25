<script setup lang="ts">
import { checkFormIsError, isRequired } from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import InputCheckBox from "~/components/inputs/InputCheckBox.vue";
import MyButton from "~/components/buttons/MyButton.vue";
import AuthTextHeader from "~/components/pages/auth/AuthTextHeader.vue";
import ImageWrapper from "~/components/image/ImageWrapper.vue";
import axios from "axios";
import Swal from "sweetalert2";
import { getDateUntilNYear } from "~/my_modules/date";
import { verifyLogin } from "~/my_modules/auth";
import { baseApiUrl } from "~/my_modules/environment";

// Page Meta and main data
definePageMeta({
  layout: "auth",
});
useHead({
  titleTemplate: (title) => `Login - ${title}`,
});

const router = useRouter();
// Check Logged in or not
onMounted(() =>
  verifyLogin(
    () => router.push({ path: "/" }),
    () => {},
    () => {}
  )
);

// * State
// Form Input Rules
const formInputRules = {
  username: [
    {
      validate: isRequired,
      text: "Tolong masukkan username anda",
    },
    {
      validate: (value) => value.length >= 6,
      text: "Minimum password 6 karakter",
    },
  ],
  password: [
    {
      validate: isRequired,
      text: "Tolong masukkan password anda",
    },
    {
      validate: (value) => value.length >= 8,
      text: "Minimum password 8 karakter",
    },
  ],
};

// Form Input State
const formValues = reactive({
  username: "",
  password: "",
  checked: false,
});

const formErrorValues = reactive({
  username: true,
  password: true,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const usernameField = ref<InstanceType<typeof InputField> | null>(null);
const passwordField = ref<InstanceType<typeof InputField> | null>(null);

const buttonIsLoading = ref(false);

// Cookie function
const cookieToken = useCookie("token", {
  sameSite: "strict",
  expires: getDateUntilNYear(2100),
});

// Handle Click
const handleClick = async () => {
  usernameField.value?.refreshValidation((value) => {
    formErrorValues.username = value;
  });
  passwordField.value?.refreshValidation((value) => {
    formErrorValues.password = value;
  });

  // If form is valid
  if (!formIsError.value) {
    buttonIsLoading.value = true;

    // Connect to api
    await axios
      .post(`${baseApiUrl}auth/jwt/create`, {
        username: formValues.username,
        password: formValues.password,
      })
      .then((response) => {
        const status = response.status;
        // Jika berhasil login
        if (status === 200) {
          Swal.fire({
            title: "Success",
            text: "Login berhasil",
            icon: "success",
            confirmButtonText: "OK",
          });
          // If checkbox is checked make cookie
          if (formValues.checked) {
            cookieToken.value = response.data.access;
            router.push({ path: "/" });
          } else {
            // if checkbox not checked make sessions in browser
            sessionStorage.setItem("token", response.data.access);
          }
        } else {
          // Jika gagal login
          buttonIsLoading.value = false;
          Swal.fire({
            title: "Error",
            text: "Login gagal",
            icon: "error",
            confirmButtonText: "OK",
          });
        }
      })
      .catch((error) => {
        // Jika gagal login lebih umum
        buttonIsLoading.value = false;
        const status = error.response.status;
        if (status === 401) {
          Swal.fire({
            title: "Login Gagal",
            text: "Akun tidak ditemukan - Tolong perhatikan username dan password",
            icon: "error",
            confirmButtonText: "OK",
          });
        } else {
          Swal.fire({
            title: "Error",
            text: "Login gagal",
            icon: "error",
            confirmButtonText: "OK",
          });
        }
      });
  }
};
</script>

<template>
  <div
    class="flex flex-col h-screen justify-center gap-8 w-full md:w-[22.5rem]"
  >
    <!-- * Content Container  -->
    <!-- Header  -->
    <div class="flex flex-col items-center justify-center gap-6">
      <!--   Image wrapper   -->
      <!--    TODO : Perbaiki nanti logo imagenya    -->
      <ImageWrapper
        rounded="2xl"
        img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
        class="w-12 h-12"
      />
      <!--   ! End Image wrapper    -->
      <!--   Text Header   -->
      <AuthTextHeader>
        <template #title>Silahkan login</template>
        <template #subTitle>Selamat datang kembali!</template>
      </AuthTextHeader>
      <!--  !  End Text Header    -->
    </div>
    <!-- ! End Header  -->
    <!--   Form   -->
    <div class="flex flex-col gap-6">
      <!--   Input Field   -->
      <div class="flex flex-col gap-5">
        <InputField
          placeholder="Email"
          :rules="formInputRules.username"
          type="text"
          label="Username"
          required
          ref="usernameField"
          @typing="
            formValues.username = $event.inputValue;
            formErrorValues.username = $event.errorState;
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
            <InputCheckBox
              id="remember_me"
              @change="formValues.checked = $event.target.value"
              >Ingat Saya
            </InputCheckBox>
          </div>
          <!--    TODO: Linknya nanti perbaiki      -->
          <div class="flex w-6/12 justify-end">
            <NuxtLink
              to="forgot-password"
              class="text-primary-700 text-sm font-medium inline-block"
            >
              Lupa Password
            </NuxtLink>
          </div>
        </div>
        <MyButton
          hieararchy="primary"
          size="lg"
          width="full"
          :disabled="formIsError || buttonIsLoading"
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
