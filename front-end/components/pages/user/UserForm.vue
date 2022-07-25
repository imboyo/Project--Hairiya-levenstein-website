<script lang="ts" setup>
import {
  checkFormIsError,
  isASCII,
  isEmail,
  isRequired,
} from "~/my_modules/input_validation";
import InputField from "~/components/inputs/InputField.vue";
import GroupInput from "~/components/inputs/GroupInput.vue";
import MyButton from "~/components/buttons/MyButton.vue";
import SelectInput from "~/components/inputs/SelectInput.vue";

interface Props {
  value?: {
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
      name: props.value.name,
      nim: props.value.nim,
      username: props.value.email,
      role: props.value.role,
    };
  } else {
    return {
      name: "",
      nim: "",
      username: "",
      role: "",
    };
  }
});

// Form Rules
const formInputRules = {
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
  name: "",
  nim: "",
  username: "",
  role: "",
});

const formErrorValues = reactive({
  name: true,
  nim: true,
  username: true,
  role: true,
});

// Check input value is error or validated
const formIsError = computed(() => {
  return checkFormIsError(formErrorValues);
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const nameFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const nimFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const emailFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const roleFieldRef = ref<InstanceType<typeof InputField> | null>(null);

// Handle Click
const handleClick = () => {
  const listRef = [nameFieldRef, nimFieldRef, emailFieldRef, roleFieldRef];
  listRef.forEach((ref) => {
    ref.value?.refreshValidation((value) => {
      return value;
    });
  });

  return !formIsError.value;
};

const emit = defineEmits(["clicked"]);

const isLoading = ref(false);
const toggleIsLoading = () => {
  isLoading.value = !isLoading.value;
};

defineExpose({ toggleIsLoading });

// * Class and CSS Binding
const inputContainerClass = computed(() => {
  return "flex flex-col w-full lg:pr-6 gap-2";
});
</script>

<template>
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
    @clicked="$emit('clicked', handleClick())"
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
