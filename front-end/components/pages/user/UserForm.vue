<script lang="ts" setup>
import {
  checkFormIsError,
  isASCII,
  isEmail,
  isNoSpace,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import GroupInput from "~/components/inputs/GroupInput.vue";
import MyButton from "~/components/buttons/MyButton.vue";
import SelectInput from "~/components/inputs/SelectInput.vue";

interface Props {
  value?: {
    username: string;
    name: string;
    nim: string;
    email: string;
    role: string;
  };
}

const props = defineProps<Props>();

const valuePropsComputed = computed(() => {
  if (props.value) {
    return {
      username: props.value.username,
      name: props.value.name,
      nim: props.value.nim,
      email: props.value.email,
      role: props.value.role,
    };
  } else {
    return {
      username: "",
      name: "",
      nim: "",
      email: "",
      role: "",
    };
  }
});

// Form Rules
const formInputRules = {
  username: [
    {
      validate: isRequired,
      text: "Username harus diisi",
    },
    {
      validate: isASCII,
      text: "Username harus berupa karakter ASCII",
    },
    {
      validate: isNoSpace,
      text: "Username tidak boleh mengandung spasi",
    },
    {
      validate: (value) => value.length >= 6,
      text: "Username minimal 6 karakter",
    },
    {
      validate: (value) => value.length <= 20,
      text: "Username maksimal 20 karakter",
    },
  ],
  name: [
    {
      validate: isRequired,
      text: "Tolong masukkan nama",
    },
    {
      validate: (value) => value.length >= 6,
      text: "Minimum nama 6 karakter",
    },
    {
      validate: isASCII,
      text: "Terdapat karakter yang tidak diperbolehkan",
    },
  ],
  nim: [
    {
      validate: isRequired,
      text: "Tolong masukkan nim",
    },
    {
      validate: (value) => value.length >= 5,
      text: "Minimum nim 5 karakter",
    },
    {
      validate: isASCII,
      text: "Tolong masukkan nim dengan benar",
    },
  ],
  email: [
    {
      validate: isRequired,
      text: "Tolong masukkan email",
    },
    {
      validate: (value) => value.length >= 5,
      text: "Minimum email 5 karakter",
    },
    {
      validate: isASCII,
      text: "Terdapat karakter yang tidak diperbolehkan",
    },
    {
      validate: isEmail,
      text: "Tolong masukkan email dengan benar",
    },
  ],
  role: [
    {
      validate: isRequired,
      text: "Tolong Pilih Jenis User",
    },
  ],
};

// Form Input State
const formValues = reactive({
  username: "",
  name: "",
  nim: "",
  email: "",
  role: "",
});

// Form Error State
const formErrorValues = reactive({
  username: true,
  name: true,
  nim: true,
  email: true,
  role: true,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const usernameFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const nameFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const nimFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const emailFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const roleFieldRef = ref<InstanceType<typeof InputField> | null>(null);

const refreshAllValidation = () => {
  const listRef = [
    {
      ref: "username",
      field: usernameFieldRef,
    },
    {
      field: "name",
      ref: nameFieldRef,
    },
    {
      field: "nim",
      ref: nimFieldRef,
    },
    {
      field: "username",
      ref: emailFieldRef,
    },
    {
      field: "role",
      ref: roleFieldRef,
    },
  ];
  //  Looping list ref
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
      username: formValues.username,
      name: formValues.name,
      nim: formValues.nim,
      email: formValues.username,
      role: formValues.role,
    },
    isLoading: isLoading.value,
  };
};

const isLoading = ref(false);
const toggleIsLoading = () => {
  isLoading.value = !isLoading.value;
};

defineExpose({ toggleIsLoading });

const emit = defineEmits(["clicked"]);

// * Class and CSS Binding
const inputContainerClass = computed(() => {
  return "flex flex-col w-full lg:pr-6 gap-2";
});
</script>

<template>
  <GroupInput label="Nama Lengkap" required>
    <div :class="inputContainerClass">
      <InputField
        :rules="formInputRules.username"
        placeholder="Nama Lengkap"
        type="text"
        required
        ref="usernameFieldRef"
        @typing="
          formValues.username = $event.inputValue;
          formErrorValues.username = $event.errorState;
          refreshAllValidation();
        "
        :value="valuePropsComputed.username"
      />
    </div>
  </GroupInput>

  <!-- First Input -->
  <GroupInput label="Nama Lengkap" required>
    <div :class="inputContainerClass">
      <InputField
        :rules="formInputRules.name"
        placeholder="Nama Lengkap"
        type="text"
        required
        ref="nameFieldRef"
        @typing="
          formValues.name = $event.inputValue;
          formErrorValues.name = $event.errorState;
          refreshAllValidation();
        "
        :value="valuePropsComputed.name"
      />
    </div>
  </GroupInput>

  <!-- 2nd Input -->
  <GroupInput label="Nomor Induk" required>
    <div :class="inputContainerClass">
      <InputField
        :rules="formInputRules.nim"
        placeholder="Nomor Induk"
        type="text"
        required
        ref="nimFieldRef"
        @typing="
          formValues.nim = $event.inputValue;
          formErrorValues.nim = $event.errorState;
          refreshAllValidation();
        "
        :value="valuePropsComputed.nim"
      />
    </div>
  </GroupInput>

  <!-- 3rd Input -->
  <GroupInput label="Email" required>
    <div :class="inputContainerClass">
      <InputField
        :rules="formInputRules.email"
        placeholder="Email"
        type="email"
        required
        ref="emailFieldRef"
        @typing="
          formValues.email = $event.inputValue;
          formErrorValues.email = $event.errorState;
        "
        :value="valuePropsComputed.email"
      />
    </div>
  </GroupInput>

  <!-- 4th Input -->
  <GroupInput label="Jenis User" required>
    <SelectInput
      :rules="formInputRules.role"
      @changed="
        formValues.role = $event.inputValue;
        formErrorValues.role = $event.errorState;
      "
      ref="roleFieldRef"
    >
      <option disabled value="">Pilih Jenis User</option>
      <option value="Dosen">Dosen</option>
      <option value="Mahasiswa">Mahasiswa</option>
      <option value="Admin">Admin</option>
    </SelectInput>
  </GroupInput>

  <!-- Button -->
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
    <template #text>Tambahkan User</template>
  </MyButton>
</template>
