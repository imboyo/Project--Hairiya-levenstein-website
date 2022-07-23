<script lang="ts" setup>
// Props
import MyButton from "~/components/buttons/MyButton.vue";

interface Props {
  title: string;
  header: string[];
  body: TableBody[];
  isLoading: boolean;
  pagination?: {
    currentPage: number;
    totalPage: number;
    perPage: number;
  };
}

const props = defineProps<Props>();

const slot = useSlots();

const getSlotValue = (name) => {
  try {
    return slot[name]()[0].children.length > 0;
  } catch (e) {
    return false;
  }
};
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
          <th scope="col" class="py-3 px-6" v-for="item in header" :key="item">
            {{ item }}
          </th>
          <th scope="col" class="py-3 px-6 text-center">Action</th>
        </tr>
      </thead>
      <tbody v-if="!isLoading">
        <slot name="body"></slot>
      </tbody>
    </table>
    <div class="px-4 py-4" v-if="pagination">
      <div class="flex flex-row justify-between">
        <div>
          <MyButton
            size="sm"
            width="fit"
            hieararchy="secondary"
            :disabled="pagination.currentPage === 1"
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
            :disabled="pagination.currentPage === pagination.totalPage"
          >
            <template #text>Selanjutnya</template>
          </MyButton>
        </div>
      </div>
    </div>
  </div>
</template>
