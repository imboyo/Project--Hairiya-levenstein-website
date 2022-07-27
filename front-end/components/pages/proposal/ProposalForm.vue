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
import SearchCard from "~/components/card/SearchCard.vue";
import SearchCardWrapper from "~/components/card/SearchCardWrapper.vue";
import { getAccessToken } from "~/my_modules/api_services/auth";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import InputPickedCard from "~/components/card/InputPickedCard.vue";
import { findIndexArray } from "~/my_modules/array";
import { pushObjectPickedInModalUser } from "~/my_modules/proposal";

interface Props {
  value?: {
    title: string;
    dosen: userPicked[];
    mahasiswa: userPicked[];
  };
}

const props = defineProps<Props>();

// Computed to check is there is default value in form or not. Used in edit page
const valuePropsComputed = computed(() => {
  if (props.value) {
    return {
      title: props.value.title,
      dosen: props.value.dosen,
      mahasiswa: props.value.mahasiswa,
    };
  } else {
    return {
      title: "",
      dosen: [],
      mahasiswa: [],
    };
  }
});

// * State
// * Form Input State - Main ------------------
const formValues = reactive({
  judulProposal: valuePropsComputed.value.title ?? "",
  fileInput: "",
  mahasiswa: "",
  dosen: "",
});

const formErrorValues = reactive({
  judulProposal: true,
  fileInput: true,
  mahasiswa: true,
  dosen: true,
});

const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// ? Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const judulProposalFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const fileInputFieldRef = ref<InstanceType<typeof FileUpload> | null>(null);
const mahasiswaFieldRef = ref<InstanceType<typeof GroupInput> | null>(null);
const dosenFieldRef = ref<InstanceType<typeof GroupInput> | null>(null);

// * Modal Dosen------------------------
const dosenSearchModal = ref(false);
const dosenListModal = ref<User[]>();
const dosenPicked = ref<userPicked[]>(valuePropsComputed.value.dosen ?? []);

watch(
  () => formValues.dosen,
  (value) => {
    // Hilangkan jika kosong
    dosenSearchModal.value = value.length > 0;

    if (value.length > 0) {
      axios
        .get(
          `${baseApiUrl}user?profile__role=dosen&limit=15&search=${formValues.dosen}`,
          {
            headers: {
              Authorization: `Bearer ${getAccessToken()}`,
            },
          }
        )
        .then((res) => {
          dosenListModal.value = res.data.results;
        });
    }
  }
);

const handleClickDosenPickedInModal = (
  userId: string,
  first_name: string,
  last_name: string
) => {
  pushObjectPickedInModalUser(
    userId,
    first_name,
    last_name,
    dosenSearchModal,
    dosenPicked,
    dosenFieldRef,
    formErrorValues.dosen
  );

  dosenFieldRef.value?.refreshValidation((value) => {
    formErrorValues.dosen = value;
  });
};

watch(
  () => dosenPicked.value,
  (value) => {
    refreshAllValidation();
  },
  { deep: true }
);

const dosenHandleClickDeleteModalItemPicked = (userId) => {
  const index = findIndexArray(dosenPicked.value, "id", userId);
  dosenPicked.value.splice(index, 1);
};

// ! End Modal Dosen

// ? Modal Mahasiswa
const mahasiswaSearchModal = ref(false);
const mahasiswaListModal = ref<User[]>([]);
const mahasiswaPicked = ref<userPicked[]>(
  valuePropsComputed.value.mahasiswa ?? []
);

watch(
  () => formValues.mahasiswa,
  (value) => {
    // Hilangkan modal jika kosong
    mahasiswaSearchModal.value = value.length > 0;

    if (value.length > 0) {
      axios
        .get(
          `${baseApiUrl}user?profile__role=mahasiswa&limit=15&search=${formValues.mahasiswa}`,
          {
            headers: {
              Authorization: `Bearer ${getAccessToken()}`,
            },
          }
        )
        .then((res) => {
          mahasiswaListModal.value = res.data.results;
        });
    }
  }
);

const handleClickMahasiswaPickedInModal = (
  userId: string,
  first_name: string,
  last_name: string
) => {
  pushObjectPickedInModalUser(
    userId,
    first_name,
    last_name,
    mahasiswaSearchModal,
    mahasiswaPicked,
    mahasiswaFieldRef,
    formErrorValues.mahasiswa
  );
  mahasiswaFieldRef.value?.refreshValidation((value) => {
    formErrorValues.mahasiswa = value;
  });
};

watch(
  () => mahasiswaPicked.value,
  (value) => {
    refreshAllValidation();
  },
  { deep: true }
);

const mahasiswaHandleClickDeleteModalItemPicked = (userId) => {
  const index = findIndexArray(mahasiswaPicked.value, "id", userId);
  mahasiswaPicked.value.splice(index, 1);
};
//! End Modal Mahasiswa

// IsLoading Button and pass it to parent
const isLoading = ref(false);
const toggleIsLoading = () => {
  isLoading.value = !isLoading.value;
};
defineExpose({ toggleIsLoading });

const inputContainerClass = computed(() => {
  return "flex flex-col w-full lg:pr-6 gap-2";
});
const emit = defineEmits(["clicked"]);

// ? FORM INPUT RULES-----------------------------------------
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
      validate: () => mahasiswaPicked.value.length > 0,
      text: "Tolong masukkan nama mahasiswa",
    },
  ],
  dosen: [
    {
      validate: () => dosenPicked.value.length > 0,
      text: "Tolong Pilih dosen",
    },
  ],
};

const refreshAllValidation = () => {
  const listRef = [
    {
      field: "judulProposal",
      ref: judulProposalFieldRef,
    },
    {
      field: "fileInput",
      ref: fileInputFieldRef,
    },
    {
      field: "mahasiswa",
      ref: mahasiswaFieldRef,
    },
    {
      field: "dosen",
      ref: dosenFieldRef,
    },
  ];
  // Looping list ref
  listRef.forEach(({ field, ref }) => {
    ref.value?.refreshValidation((value) => {
      formErrorValues[field] = value;
    });
  });
};

// Handle Click
const handleFormClick = () => {
  refreshAllValidation();
  return {
    isError: formIsError.value,
    formData: {
      title: formValues.judulProposal,
      file: formValues.fileInput,
      dosen: dosenPicked.value,
      mahasiswa: mahasiswaPicked.value,
    },
    isLoading: isLoading.value,
  };
};
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
          refreshAllValidation();
        "
        :value="formValues.judulProposal"
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
          refreshAllValidation();
        "
        accept=".pdf"
      />
    </div>
  </GroupInput>
  <hr />

  <!-- Search Dosen -->
  <GroupInput label="Dosen Pembimbing" required>
    <div :class="`${inputContainerClass}`">
      <InputField
        placeholder="Dosen Pembimbing"
        :rules="formInputRules.dosen"
        type="text"
        required
        ref="dosenFieldRef"
        @typing="
          formValues.dosen = $event.inputValue;
          formErrorValues.dosen = $event.errorState;
          dosenSearchModal = true;
          mahasiswaSearchModal = false;
        "
      />
      <InputPickedCard
        v-for="(item, index) in dosenPicked"
        :key="index"
        v-if="dosenPicked.length > 0"
        @deleteClicked="dosenHandleClickDeleteModalItemPicked(item.id)"
      >
        <div class="flex flex-col justify-center">
          <p>{{ item.first_name }} {{ item.last_name }}</p>
        </div>
      </InputPickedCard>
    </div>
  </GroupInput>
  <!-- Search Dosen Modal -->
  <div class="flex relative" v-if="dosenSearchModal">
    <div
      class="h-[400px] absolute w-full overflow-y-auto left-0 top-0 lg:w-[400px] lg:left-[16rem]"
      style="z-index: 51"
    >
      <div
        class="flex flex-col bg-primary-50 rounded-2xl shadow-focus-ring-grey-100"
      >
        <SearchCardWrapper
          v-for="item in dosenListModal"
          @click="
            handleClickDosenPickedInModal(
              item.id,
              item.first_name,
              item.last_name
            )
          "
        >
          <SearchCard
            :title="`${item.first_name} ${item.last_name}`"
            :sub-title="item.profile.nomor_induk"
          />
        </SearchCardWrapper>
      </div>
    </div>
  </div>
  <!-- End Search Dosen Modal -->
  <hr />

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
          dosenSearchModal = false;
        "
      />
      <InputPickedCard
        v-for="(item, index) in mahasiswaPicked"
        :key="index"
        v-if="mahasiswaPicked.length > 0"
        @deleteClicked="mahasiswaHandleClickDeleteModalItemPicked(item.id)"
      >
        <div class="flex flex-col justify-center">
          <p>{{ item.first_name }} {{ item.last_name }}</p>
        </div>
      </InputPickedCard>
    </div>
  </GroupInput>
  <!-- Search Mahasiswa Modal -->
  <div class="flex relative" v-if="mahasiswaSearchModal">
    <div
      class="h-[400px] absolute w-full overflow-y-auto left-0 top-0 lg:w-[400px] lg:left-[16rem]"
      style="z-index: 51"
    >
      <div
        class="flex flex-col bg-primary-50 rounded-2xl shadow-focus-ring-grey-100"
      >
        <SearchCardWrapper
          v-for="item in mahasiswaListModal"
          @click="
            handleClickMahasiswaPickedInModal(
              item.id,
              item.first_name,
              item.last_name
            )
          "
        >
          <SearchCard
            :title="`${item.first_name} ${item.last_name}`"
            :sub-title="item.profile.nomor_induk"
          />
        </SearchCardWrapper>
      </div>
    </div>
  </div>
  <!-- End Search Mahasiswa Modal -->

  <MyButton
    size="lg"
    width="full"
    hieararchy="primary"
    @clicked="$emit('clicked', handleFormClick())"
    :disabled="formIsError"
  >
    <template #onlyIcon>
      <img
        src="/website/Rolling-1s-200px.svg"
        alt=""
        class="animate-spin ml-2"
        v-if="isLoading"
      />
    </template>
    <template #text>Submit</template>
  </MyButton>
</template>
