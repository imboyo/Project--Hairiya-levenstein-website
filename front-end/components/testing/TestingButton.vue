<script lang="ts" setup>
import MyButton from "~/components/buttons/MyButton.vue";
</script>

<template>
  <div class="flex flex-col p-10 gap-2">
    <!--  * Size  -->
    <h1 class="text-display-md font-bold">Horizontal Size</h1>
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
    <hr />
    <br />

    <!-- * Hiearchy -->
    <h1 class="text-display-md font-bold">Hiearchy</h1>
    <div class="flex flex-row flex-wrap">
      <!--   Primary   -->
      <div class="flex flex-col">
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
      </div>
      <div class="flex flex-col">
        <!--  ! Destructive   -->
        <MyButton size="md" width="fit" hieararchy="primary" destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--  Secondary  -->
        <MyButton size="md" width="fit" hieararchy="secondary" destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--  secondary gray  -->
        <MyButton size="md" width="fit" hieararchy="secondary-gray" destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   tertiary   -->
        <MyButton size="md" width="fit" hieararchy="tertiary" destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   tertiary gray   -->
        <MyButton size="md" width="fit" hieararchy="tertiary-gray" destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   link   -->
        <MyButton size="md" width="fit" hieararchy="link" destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   link-gray   -->
        <MyButton size="md" width="fit" hieararchy="link-gray" destructive>
          <template #text> Button CTA</template>
        </MyButton>
      </div>
    </div>
    <hr />

    <!--  * Icon  -->
    <h1 class="text-display-md font-bold">Type Icon</h1>
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
    <hr />

    <!--  * Disabled  -->
    <h1 class="text-display-md font-bold">Disabled Button</h1>
    <div class="flex flex-row">
      <!--   Default   -->
      <div class="flex flex-col">
        <!--   Primary   -->
        <MyButton size="md" width="fit" hieararchy="primary" disabled>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   Secondary   -->
        <MyButton size="md" width="fit" hieararchy="secondary" disabled>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   secondary gray   -->
        <MyButton size="md" width="fit" hieararchy="secondary-gray" disabled>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   tertiary   -->
        <MyButton size="md" width="fit" hieararchy="tertiary" disabled>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   tertiary-gray   -->
        <MyButton size="md" width="fit" hieararchy="tertiary-gray" disabled>
          <template #text> Button CTA</template>
        </MyButton>
        <!--   link   -->
        <MyButton size="md" width="fit" hieararchy="link" disabled>
          <template #text> Button CTA</template>
        </MyButton>
        <!--  link-gray  -->
        <MyButton size="md" width="fit" hieararchy="link-gray" disabled>
          <template #text> Button CTA</template>
        </MyButton>
      </div>
      <!--   Destructive   -->
      <div class="flex flex-col">
        <!--   Primary   -->
        <MyButton
          size="md"
          width="fit"
          hieararchy="primary"
          disabled
          destructive
        >
          <template #text> Button CTA</template>
        </MyButton>
        <!--   Secondary   -->
        <MyButton
          size="md"
          width="fit"
          hieararchy="secondary"
          disabled
          destructive
        >
          <template #text> Button CTA</template>
        </MyButton>
        <!--   secondary gray   -->
        <MyButton
          size="md"
          width="fit"
          hieararchy="secondary-gray"
          disabled
          destructive
        >
          <template #text> Button CTA</template>
        </MyButton>
        <!--   tertiary   -->
        <MyButton
          size="md"
          width="fit"
          hieararchy="tertiary"
          disabled
          destructive
        >
          <template #text> Button CTA</template>
        </MyButton>
        <!--   tertiary-gray   -->
        <MyButton
          size="md"
          width="fit"
          hieararchy="tertiary-gray"
          disabled
          destructive
        >
          <template #text> Button CTA</template>
        </MyButton>
        <!--   link   -->
        <MyButton size="md" width="fit" hieararchy="link" disabled destructive>
          <template #text> Button CTA</template>
        </MyButton>
        <!--  link-gray  -->
        <MyButton
          size="md"
          width="fit"
          hieararchy="link-gray"
          disabled
          destructive
        >
          <template #text> Button CTA</template>
        </MyButton>
      </div>
    </div>
  </div>
</template>
