<script setup lang="ts">
import {
  checkFormIsError,
  isASCII,
  isNoSpace,
  isNoNumber,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import GroupInput from "~/components/inputs/GroupInput.vue";

useHead({
  titleTemplate: (title) => `Upload Proposal - ${title}`,
});

// * State
// Form Input Rules
const formInputRules = {
  firstName: [
    {
      validate: isRequired,
      text: "Tolong masukkan nama anda",
    },
    {
      validate: (value) => value.length >= 3,
      text: "Minimum nama 3 karakter",
    },
    {
      validate: isASCII,
      text: "Tolong masukkan nama dengan benar",
    },
    {
      validate: isNoSpace,
      text: "Tidak boleh menggunakan spasi",
    },
    {
      validate: isNoNumber,
      text: "Angka tidak diperbolehkan",
    },
  ],
  lastName: [
    {
      validate: isASCII,
      text: "Tolong masukkan nama dengan benar",
    },
    {
      validate: isNoNumber,
      text: "Angka tidak diperbolehkan",
    },
  ],
};

// Form Input State
const formValues = reactive({
  firstName: "",
  lastName: "",
});

const formErrorValues = reactive({
  firstName: true,
  lastName: false,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

const inputContainerClass = computed(() => {
  return "flex flex-col w-full lg:pr-6 gap-2";
});
</script>

<template>
  <div>
    <section class="flex flex-col gap-8">
      <!-- * Header Section    -->
      <section>
        <h1 class="text-display-sm font-medium">Upload Proposal</h1>
      </section>
      <!--   ! End Header Section -->
      <!-- Form Section   -->
      <div class="flex flex-col gap-5">
        <!--    Header Form    -->
        <div class="flex flex-col gap-1">
          <h3 class="text-lg font-medium inline-block">
            File proposal yang diupload hanya berisi BAB 2 & 3
          </h3>
          <p class="text-sm text-gray-500 inline-block">
            Untuk lainnya silahkan dihapus terlebih dahulu agar hasil yang
            didapatkan sesua dengan yang diharapkan
          </p>
        </div>
        <!--   End Header Form    -->
        <hr />
        <!--    First Inputs    -->
        <GroupInput label="Nama Lengkap" required>
          <div :class="`${inputContainerClass} lg:gap-5 lg:flex-row`">
            <InputField
              placeholder="Nama Depan"
              :rules="formInputRules.firstName"
              type="text"
              required
              ref="firstName"
              @typing="
                formValues.firstName = $event.inputValue;
                formErrorValues.firstName = $event.errorState;
              "
              class="lg:w-6/12"
            />
            <InputField
              placeholder="Nama Belakang"
              :rules="formInputRules.lastName"
              type="text"
              ref="lastName"
              @typing="
                formValues.lastName = $event.inputValue;
                formErrorValues.lastName = $event.errorState;
              "
              class="lg:w-6/12"
            />
          </div>
        </GroupInput>

        <!--    End First Input    -->
        <hr />
        <!--    Second Input    -->
        <GroupInput label="Judul Proposal" required>
          <div :class="`${inputContainerClass}`">
            <InputField
              placeholder="Judul Proposal"
              :rules="formInputRules.firstName"
              type="text"
              required
              ref="firstName"
              @typing="
                formValues.firstName = $event.inputValue;
                formErrorValues.firstName = $event.errorState;
              "
              class="lg:w-full"
            />
          </div>
        </GroupInput>
      </div>
    </section>
  </div>
</template>
