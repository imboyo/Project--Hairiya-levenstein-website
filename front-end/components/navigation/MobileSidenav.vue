<script lang="ts" setup>
import NavItem from "~/components/navigation/NavItem.vue";

const { modalIsOpen, toggleMobileNav } = useMobileNav();
</script>

<template>
  <Transition name="mobile-sidenav" duration="300">
    <div v-if="modalIsOpen" class="flex flex-row h-screen w-screen absolute">
      <!--   Content   -->
      <div class="flex flex-col w-full h-screen bg-white pt-[1rem] gap-[4px]">
        <!--    Logo Hero    -->
        <div></div>
        <!--  Nav Item  -->
        <NavItem to="/" label="Home" icon="home" />
        <NavItem to="/auth/login" label="Login" icon="person" />
        <NavItem to="/auth/login" label="Login" icon="person" />
        <NavItem to="/auth/login" label="Login" icon="person" />
        <NavItem to="/auth/login" label="Login" icon="person" />
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
