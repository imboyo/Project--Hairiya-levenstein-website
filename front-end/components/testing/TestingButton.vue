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
    <div class="flex flex-row flex-wrap">
      <!--   Primary   -->
      <MyButton size="md" width="fit" hieararchy="primary">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   Secondary   -->
      <MyButton size="md" width="fit" hieararchy="secondary">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   secondary gray   -->
      <MyButton size="md" width="fit" hieararchy="secondary-gray">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   tertiary   -->
      <MyButton size="md" width="fit" hieararchy="tertiary">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   tertiary-gray   -->
      <MyButton size="md" width="fit" hieararchy="tertiary-gray">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   link   -->
      <MyButton size="md" width="fit" hieararchy="link">
        <template #text> Button CTA</template>
      </MyButton>
      <!--  link-gray  -->
      <MyButton size="md" width="fit" hieararchy="link-gray">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   Destructive   -->
      <MyButton size="md" width="fit" hieararchy="destructive">
        <template #text> Button CTA</template>
      </MyButton>
    </div>

    <!--  * Icon  -->
    <div class="flex flex-row gap-2">
      <!--   Default   -->
      <MyButton size="md" width="fit" hieararchy="primary">
        <template #text> Button CTA</template>
      </MyButton>
      <!--   Leading   -->
      <MyButton size="md" width="fit" hieararchy="primary">
        <template #text> Button CTA</template>
        <template #leading>
          <font-awesome-icon icon="fa-regular fa-circle" />
        </template>
      </MyButton>
      <!--   Trailling   -->
      <MyButton size="md" width="fit" hieararchy="primary">
        <template #text> Button CTA</template>
        <template #trailling>
          <font-awesome-icon icon="fa-regular fa-circle" />
        </template>
      </MyButton>
      <!--   Only Icon   -->
      <MyButton size="md" width="fit" hieararchy="primary">
        <template #onlyIcon>
          <font-awesome-icon icon="fa-regular fa-circle" />
        </template>
      </MyButton>
    </div>
  </div>
</template>
