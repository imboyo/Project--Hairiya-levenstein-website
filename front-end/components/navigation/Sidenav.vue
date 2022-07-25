<script lang="ts" setup>
import NavItem from "~/components/navigation/NavItem.vue";
import ImageWrapper from "~/components/image/ImageWrapper.vue";
import DropdownNavItem from "~/components/navigation/DropdownNavItem.vue";
import { truncate } from "~/my_modules/string";
import { dynamicSidenavByRoles } from "~/my_modules/sidenav";

interface Props {
  userRole: string;
}

const props = defineProps<Props>();

const dynamicSidenav = computed(() => dynamicSidenavByRoles(props.userRole));
</script>

<template>
  <!--  ? Nav Content  -->
  <div class="flex flex-col w-full h-screen bg-white py-[1rem] gap-[4px] z-50">
    <!--  ? First Section     -->
    <div class="flex flex-col">
      <!--    Logo Hero    -->
      <NuxtLink class="flex flex-row items-center px-[12px] py-[20px]" to="/">
        <ImageWrapper
          rounded="lg"
          img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
          class="mr-[12px] w-8 h-8"
        />
        <div>
          <h3 class="font-bold text-gray-700 text-xl">Plagiarism</h3>
        </div>
      </NuxtLink>
      <!--   End Logo Hero  -->

      <!--  Nav Items  -->
      <template v-for="item in dynamicSidenav">
        <template v-if="!item.childrens">
          <NavItem :to="item.path" :label="item.name" :icon="item.icon" />
        </template>
        <template v-if="item.childrens">
          <DropdownNavItem :label="item.name" :icon="item.icon">
            <NavItem
              v-for="children in item.childrens"
              :to="children.path"
              :label="children.name"
              :icon="children.icon"
            />
          </DropdownNavItem>
        </template>
      </template>
    </div>
    <!--   2nd Section     -->
    <div class="flex flex-col justify-end h-full">
      <hr class="mb-4" />
      <div class="px-[12px] flex flex-row lg:gap-3">
        <div class="flex basis-2/12 items-center">
          <ImageWrapper
            rounded="full"
            img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
            class="block w-[40px] h-[40px]"
          />
        </div>
        <div class="flex flex-col basis-9/12 text-sm">
          <h3 class="inline-block text-gray-700 font-medium">
            {{ truncate("Mabrur Syamhur", 16) }}
          </h3>
          <h5 class="inline-block text-gray-500">
            {{ truncate("imbomabrur84@gmail.com", 16) }}
          </h5>
        </div>
        <div class="flex justify-end items-center text-gray-500">
          <button @click="() => alert('terlogout')">
            <span class="material-icons-outlined text-display-xs">
              logout
            </span>
          </button>
        </div>
      </div>
    </div>
    <!--  End 2nd Section     -->
  </div>
  <!--  ! End Content   -->
</template>
