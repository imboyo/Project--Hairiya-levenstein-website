<script lang="ts" setup>
import NavItem from "~/components/navigation/NavItem.vue";
import ImageWrapper from "~/components/image/ImageWrapper.vue";
import DropdownNavItem from "~/components/navigation/DropdownNavItem.vue";
import { truncate } from "~/my_modules/string";
</script>

<template>
  <!--  ? Nav Content  -->
  <div class="flex flex-col w-full h-screen bg-white py-[1rem] gap-[4px]">
    <!--  ? First Section     -->
    <div class="flex flex-col">
      <!--    Logo Hero    -->
      <NuxtLink
        class="flex flex-row items-center px-[12px] py-[20px]"
        to="/mabrur"
      >
        <ImageWrapper
          height="8"
          width="8"
          rounded="lg"
          img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
          class="mr-[12px]"
        />
        <div>
          <h3 class="font-bold text-gray-700 text-xl">Plagiarism</h3>
        </div>
      </NuxtLink>
      <!--   End Logo Hero  -->

      <!--  Nav Items  -->
      <NavItem to="/" label="Dashboard" icon="signal_cellular_alt" />
      <DropdownNavItem label="Proposal" icon="folder">
        <NavItem to="/auth/login" label="Upload Proposal" icon="file_upload" />
        <NavItem
          to="/auth/login"
          label="Daftar Proposal"
          icon="format_list_bulleted"
        />
      </DropdownNavItem>
      <DropdownNavItem label="User" icon="folder">
        <NavItem to="/auth/login" label="Tambah User" icon="person_add" />
        <NavItem
          to="/auth/login"
          label="Daftar User"
          icon="format_list_bulleted"
        />
      </DropdownNavItem>
    </div>
    <!--   2nd Section     -->
    <div class="flex flex-col justify-end h-full">
      <hr class="mb-4" />
      <div class="px-[12px] flex flex-row lg:gap-3">
        <div class="flex basis-2/12 items-center">
          <ImageWrapper
            height="[40px]"
            width="[40px]"
            rounded="full"
            img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
            class="block"
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
