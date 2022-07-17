<script lang="ts" setup>
import MyButton from "~/components/buttons/MyButton.vue";
</script>

<template>
  <div class="flex flex-col p-10 gap-2">
    <!--  * Size  -->
    <!--  Fit  -->
    <MyButton size="sm" width="fit" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="lg" width="fit" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="xl" width="fit" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="2xl" width="fit" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <!--  Full  -->
    <MyButton size="sm" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="lg" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="xl" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="2xl" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>

    <!-- * Hiearchy -->
    <br />
    <MyButton size="md" width="fit" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="secondary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="secondary-gray">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="tertiary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="tertiary-gray">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="link">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="fit" hieararchy="link-gray">
      <template #text> Button CTA</template>
    </MyButton>

    <!--  Icon  -->
    <MyButton size="md" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
    </MyButton>
    <MyButton size="md" width="full" hieararchy="primary">
      <template #text> Button CTA</template>
      <template #leading>circle</template>
    </MyButton>
  </div>
</template>
