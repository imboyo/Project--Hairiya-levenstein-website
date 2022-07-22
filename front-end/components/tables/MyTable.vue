<script lang="ts" setup>
// Props
interface Props {
  title: string;
  header: string[];
  body: TableBody[];
  isLoading: boolean;
}

const props = defineProps<Props>();
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
        <tr
          v-for="(item, index) in body"
          :key="index"
          class="bg-white border-b dark:bg-gray-800 dark:border-gray-700"
        >
          <th
            scope="row"
            class="py-4 px-6 font-medium text-gray-900 whitespace-nowrap dark:text-white"
          >
            {{ item.proposal }}
          </th>
          <td class="py-4 px-6">{{ item.percentage }}</td>
          <td class="py-4 px-6">{{ item.date }}</td>
          <td class="py-4 px-6 text-right flex flex-row gap-4 justify-center">
            <NuxtLink
              :to="`/proposal/edit/${item.id}`"
              class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
              >Edit</NuxtLink
            >
            <a
              href="#"
              class="font-medium text-blue-600 dark:text-blue-500 hover:underline inline-block"
              >Delete</a
            >
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
