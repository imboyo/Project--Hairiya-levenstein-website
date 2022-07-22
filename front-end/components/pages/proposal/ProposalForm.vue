<script setup lang="ts">
import {
  checkFormIsError,
  isASCII,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import GroupInput from "~/components/inputs/GroupInput.vue";
import FileUpload from "~/components/inputs/FileUpload.vue";
import MyButton from "~/components/buttons/MyButton.vue";
import ImageWrapper from "~/components/image/ImageWrapper.vue";

// * State
// Form Input Rules
const formInputRules = {
  judulProposal: [
    {
      validate: isRequired,
      text: "Tolong masukkan judul proposal",
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
  mahasiswa: [
    {
      validate: isRequired,
      text: "Tolong masukkan nama mahasiswa",
    },
  ],
};

// * Form Input State - Main
const formValues = reactive({
  judulProposal: "",
  fileInput: "",
  mahasiswa: "",
});

const formErrorValues = reactive({
  judulProposal: true,
  fileInput: true,
  mahasiswa: true,
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
const judulProposalFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const fileInputFieldRef = ref<InstanceType<typeof FileUpload> | null>(null);
const mahasiswaFieldRef = ref<InstanceType<typeof GroupInput> | null>(null);

// Handle Click
const handleClick = () => {
  const listRef = [judulProposalFieldRef, fileInputFieldRef, mahasiswaFieldRef];

  // Looping list ref
  listRef.forEach((ref) => {
    ref.value?.refreshValidation((value) => {
      formErrorValues[ref] = value;
    });
  });
  return !formIsError.value;
};

const mahasiswaSearchModal = ref(false);

watch(formValues, (value) => {
  mahasiswaSearchModal.value = value.mahasiswa.length > 0;
});
// ! End Form Main

const emit = defineEmits(["clicked"]);
</script>

<template>
  <!--    First Input    -->
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

  <!--    Second Input    -->
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
  <hr />

  <!-- TODO: Add Mahasiswa -->
  <GroupInput label="Mahasiswa" required>
    <div :class="`${inputContainerClass}`">
      <InputField
        placeholder="Mahasiswa"
        :rules="formInputRules.mahasiswa"
        type="text"
        required
        ref="mahasiswaFieldRef"
        @typing="
          formValues.mahasiswa = $event.inputValue;
          formErrorValues.mahasiswa = $event.errorState;
          mahasiswaSearchModal = true;
        "
        class="lg:w-full"
      />
    </div>
    <!-- Search Mahasiswa Modal -->
    <div class="relative">
      <div
        v-if="mahasiswaSearchModal"
        class="h-[400px] absolute w-full"
        style="z-index: 51; left: 0; top: 0"
      >
        <div class="bg-gray-300 px-2 pt-2 rounded-xl">
          <div class="flex flex-col gap-2">
            <div
              class="flex flex-row cursor-pointer hover:bg-gray-400 transition duration-200"
            >
              <ImageWrapper
                rounded="full"
                img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
                class="mr-[12px] w-12 h-12"
              />
              <div class="flex flex-col">
                <h4 class="text-lg font-medium text-gray-900">
                  Mabrur Syamhur
                </h4>
                <p class="uppercase text-sm text-gray-500">B011171365</p>
              </div>
            </div>
          </div>
        </div>
      </div>
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
