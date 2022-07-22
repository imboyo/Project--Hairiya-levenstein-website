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
import FileUpload from "~/components/inputs/FileUpload.vue";
import MyButton from "~/components/buttons/MyButton.vue";

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
  judulProposal: [
    {
      validate: isRequired,
      text: "Tolong masukkan nama anda",
    },
    {
      validate: (value) => value.length >= 5,
      text: "Minimum nama 5 karakter",
    },
    {
      validate: isASCII,
      text: "Tolong masukkan nama dengan benar",
    },
  ],
  fileUpload: [
    {
      validate: (value) => value > 0,
      text: "Tolong masukkan file",
    },
  ],
};

// Form Input State
const formValues = reactive({
  firstName: "",
  lastName: "",
  judulProposal: "",
  fileInput: "",
});

const formErrorValues = reactive({
  firstName: true,
  lastName: false,
  judulProposal: true,
  fileInput: true,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

const inputContainerClass = computed(() => {
  return "flex flex-col w-full lg:pr-6 gap-2";
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const firstNameFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const lastNameFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const judulProposalFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const fileInputFieldRef = ref<InstanceType<typeof FileUpload> | null>(null);

// Handle Click
const handleClick = () => {
  const listRef = [
    firstNameFieldRef,
    lastNameFieldRef,
    judulProposalFieldRef,
    fileInputFieldRef,
  ];

  // Looping list ref
  listRef.forEach((ref) => {
    ref.value?.refreshValidation((value) => {
      formErrorValues[ref] = value;
    });
  });
  return !formIsError.value;
};

const emit = defineEmits(["clicked"]);
</script>

<template>
  <!--    First Inputs    -->
  <GroupInput label="Nama Lengkap" required>
    <div :class="`${inputContainerClass} lg:gap-5 lg:flex-row`">
      <InputField
        placeholder="Nama Depan"
        :rules="formInputRules.firstName"
        type="text"
        required
        ref="firstNameFieldRef"
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
        ref="lastNameFieldRef"
        @typing="
          formValues.lastName = $event.inputValue;
          formErrorValues.lastName = $event.errorState;
        "
        class="lg:w-6/12"
      />
    </div>
  </GroupInput>
  <hr />

  <!--    Second Input    -->
  <GroupInput label="Judul Proposal" required>
    <div :class="`${inputContainerClass}`">
      <InputField
        placeholder="Judul Proposal"
        :rules="formInputRules.judulProposal"
        type="text"
        required
        ref="judulProposalFieldRef"
        @typing="
          formValues.judulProposal = $event.inputValue;
          formErrorValues.judulProposal = $event.errorState;
        "
        class="lg:w-full"
      />
    </div>
  </GroupInput>
  <hr />

  <!--    Third Input    -->
  <GroupInput label="Proposal File" required>
    <div :class="`${inputContainerClass}`">
      <FileUpload
        :rules="formInputRules.fileUpload"
        ref="fileInputFieldRef"
        @fileChanged="
          formValues.fileInput = $event.file;
          formErrorValues.fileInput = $event.errorState;
        "
      />
    </div>
  </GroupInput>
  <MyButton
    size="lg"
    width="full"
    hieararchy="primary"
    @clicked="$emit('clicked', handleClick())"
    :disabled="formIsError"
  >
    <template #text>Upload Proposal</template>
  </MyButton>
</template>
