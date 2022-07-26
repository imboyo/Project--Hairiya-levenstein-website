<template>
  <div class="px-2 md:px-5 lg:px-10">
    <div class="flex flex-col gap-3 justify-center items-center h-screen">
      <FeaturedIcon class="text-center" color="primary" size="xl" theme="light"
        >error</FeaturedIcon
      >
      <h1 class="text-display-md">Page not found</h1>
    </div>
  </div>
</template>
<script>
import FeaturedIcon from "~/components/icons/FeaturedIcon";
export default {
  components: { FeaturedIcon },
};
</script>
