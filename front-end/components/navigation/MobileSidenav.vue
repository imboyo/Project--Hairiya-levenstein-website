<script lang="ts" setup>
import NavItem from "~/components/navigation/NavItem.vue";
import ImageWrapper from "~/components/image/ImageWrapper.vue";
import DropdownNavItem from "~/components/navigation/DropdownNavItem.vue";

const { modalIsOpen, toggleMobileNav } = useMobileNav();
</script>

<template>
  <Transition name="mobile-sidenav" duration="300">
    <div v-if="modalIsOpen" class="flex flex-row h-screen w-screen absolute">
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
          <NavItem to="/" label="Home" icon="home" />
          <NavItem to="/auth/login" label="Login" icon="person" />
          <DropdownNavItem label="Login" icon="person">
            <NavItem to="/auth/login" label="Login" icon="person" />
            <NavItem to="/auth/login" label="Login" icon="person" />
          </DropdownNavItem>
        </div>
        <!--   2nd Section     -->
        <div class="flex flex-col justify-end h-full">
          <hr class="mb-4" />
          <div class="px-[12px] flex flex-row">
            <div class="flex basis-2/12 items-center">
              <ImageWrapper
                height="[40px]"
                width="[40px]"
                rounded="full"
                img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
                class="block"
              />
            </div>
            <div class="flex flex-col basis-9/12">
              <h3 class="inline-block text-gray-700">Mabrur Syamhur</h3>
              <h5 class="inline-block text-gray-500">
                mabrursyamhur@gmail.com
              </h5>
            </div>
            <div class="flex justify-end items-center text-gray-500">
              <button>
                <span class="material-icons-outlined"> logout </span>
              </button>
            </div>
          </div>
        </div>
        <!--  End 2nd Section     -->
      </div>
      <!--  ! End Content   -->

      <!-- ?  Close Button   -->
      <div class="w-[3rem] h-screen bg-gray-500 text-center pt-[1rem]">
        <button @click="toggleMobileNav">
          <span
            class="material-icons-outlined text-display-xs text-white inline-block"
            >close</span
          >
        </button>
      </div>
      <!-- ! End Close Button -->
    </div>
  </Transition>
</template>
