<script lang="ts" setup>
// Props
import MyButton from "~/components/buttons/MyButton.vue";
import { computed } from "#imports";

interface Props {
  title: string;
  header: string[];
  pagination?: {
    currentPage: number;
    totalPage: number;
    perPage: number;
  };
}

const props = defineProps<Props>();

const isPrevPage = computed(() => {
  return props.pagination.currentPage !== 1;
});

const isNextPage = computed(() => {
  return props.pagination.currentPage !== props.pagination.totalPage;
});
</script>

<template>
  <div class="overflow-x-auto relative shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
      <caption
        class="p-5 text-lg font-semibold text-left text-gray-900 bg-white dark:text-white dark:bg-gray-800"
      >
        {{
          title
        }}
      </caption>
      <thead
        class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400"
      >
        <tr>
          <template v-for="(item, index) in header" :key="index">
            <th scope="col" class="py-3 px-6">
              {{ item }}
            </th>
          </template>
        </tr>
      </thead>
      <tbody>
        <slot></slot>
      </tbody>
    </table>
    <div class="px-4 py-4" v-if="pagination">
      <div class="flex flex-row justify-between">
        <div>
          <MyButton
            size="sm"
            width="fit"
            hieararchy="secondary"
            :disabled="!isPrevPage"
            @clicked="$emit('prevClicked', isPrevPage)"
          >
            <template #text>Sebelumnya</template>
          </MyButton>
        </div>
        <div class="flex items-center">
          <h5 class="text-gray-700 text-sm">
            Halaman {{ pagination.currentPage }} dari {{ pagination.totalPage }}
          </h5>
        </div>
        <div>
          <MyButton
            size="sm"
            width="fit"
            hieararchy="secondary"
            :disabled="!isNextPage"
            @Clicked="$emit('nextClicked', isNextPage)"
          >
            <template #text>Selanjutnya</template>
          </MyButton>
        </div>
      </div>
    </div>
  </div>
</template>
