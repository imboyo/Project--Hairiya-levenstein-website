<script lang="ts" setup>
import {
  checkFormIsError,
  isASCII,
  isEmail,
  isRequired,
} from "~/my_modules/input_validation";
import { computed } from "#imports";
import InputField from "~/components/inputs/InputField.vue";
import GroupInput from "~/components/inputs/GroupInput.vue";
import MyButton from "~/components/buttons/MyButton.vue";

interface Props {
  value: {
    name: string;
    email: string;
  };
}

const props = defineProps<Props>();

const valuePropsComputed = computed(() => {
  if (props.value) {
    return {
      name: props.value.name,
      email: props.value.email,
    };
  } else {
    return {
      name: "",
      email: "",
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
  email: [
    {
      validate: isRequired,
      text: "Tolong masukkan email",
    },
    {
      validate: isEmail,
      text: "Email tidak valid",
    },
    {
      validate: isASCII,
      text: "Terdapat karakter yang tidak diperbolehkan",
    },
  ],
};

// Form Input State
const formInputState = {
  name: "",
  email: "",
};

const formErrorValues = reactive({
  name: "",
  email: "",
});

const formIsError = computed(() => {
  return checkFormIsError(formInputState);
});

// * Child Ref Component for accesing child funciton
// ? Note : Buat Ref di component html di template sesaui dengan nama const disini
const nameFieldRef = ref<InstanceType<typeof InputField> | null>(null);
const emailFieldRef = ref<InstanceType<typeof InputField> | null>(null);

// Handle Click
const handleClick = () => {
  const listRef = [nameFieldRef, emailFieldRef];
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
          formInputState.name = $event.inputValue;
          formErrorValues.name = $event.errorState;
        "
        :value="valuePropsComputed.name"
      />
    </div>
  </GroupInput>

  <!-- 2nd Input -->
  <GroupInput label="Email" required>
    <div :class="inputContainerClass">
      <InputField
        :rules="formInputRules.email"
        placeholder="Email"
        type="email"
        required
        ref="emailFieldRef"
        @typing="
          formInputState.email = $event.inputValue;
          formErrorValues.email = $event.errorState;
        "
        :value="valuePropsComputed.email"
      />
    </div>
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
    <template #text>Edit Profil Saya</template>
  </MyButton>
</template>
