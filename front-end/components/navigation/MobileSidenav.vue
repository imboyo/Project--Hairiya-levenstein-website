<script lang="ts" setup>
import NavItem from "~/components/navigation/NavItem.vue";
import ImageWrapper from "~/components/image/ImageWrapper.vue";
import DropdownNavItem from "~/components/navigation/DropdownNavItem.vue";

const { modalIsOpen, toggleMobileNav } = useMobileNav();
</script>

<template>
  <Transition name="mobile-sidenav" duration="300">
    <div v-if="modalIsOpen" class="flex flex-row h-screen w-screen absolute">
      <!--   Content   -->
      <div class="flex flex-col w-full h-screen bg-white pt-[1rem] gap-[4px]">
        <!--    Logo Hero    -->
        <div class="flex flex-row items-center px-[12px] py-[20px]">
          <ImageWrapper
            height="8"
            width="8"
            rounded="lg"
            img="/img/64ff580d4559faeaf7fc7e1ffd13cb5a.jpg"
            class="w-8 mr-[12px]"
          />
          <div>
            <h3 class="font-bold text-gray-700 text-xl">Plagiarism</h3>
          </div>
        </div>
        <!--  Nav Items  -->
        <NavItem to="/" label="Home" icon="home" />
        <NavItem to="/auth/login" label="Login" icon="person" />
        <DropdownNavItem label="Login" icon="person">
          <NavItem to="/auth/login" label="Login" icon="person" />
          <NavItem to="/auth/login" label="Login" icon="person" />
        </DropdownNavItem>
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
