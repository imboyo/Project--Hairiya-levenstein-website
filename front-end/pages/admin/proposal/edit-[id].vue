<script setup lang="ts">
import PageHeader from "~/components/header/PageHeader.vue";
import PageSubHeader from "~/components/header/PageSubHeader.vue";
import ProposalForm from "~/components/pages/proposal/ProposalForm.vue";
import NotFoundComponent from "~/components/NotFoundComponent.vue";
import { baseApiUrl } from "~/my_modules/environment";
import axios from "axios";
import { getAccessToken, getUserById } from "~/my_modules/auth";
import Swal from "sweetalert2";

const route = useRoute();

useHead({
  titleTemplate: (title) => `Edit Proposal - ${title}`,
});

const router = useRouter();
const proposalFormRef = ref<InstanceType<typeof ProposalForm> | null>(null);

// State
const isLoading = ref(true);
const proposalValue = ref();

const dosenValue = ref<userPicked[]>([]);
const mahasiswa = ref<userPicked[]>([]);

const fetchDetailProposal = () => {
  const id = route.params.id;
  axios
    .get(`${baseApiUrl}proposal/${id}`, {
      headers: { Authorization: `Bearer ${getAccessToken()}` },
    })
    .then((response) => {
      proposalValue.value = response.data;
      isLoading.value = false;
      response.data.mahasiswa.forEach((item) => {
        getUserById(item, (user) => {
          const currMhs: userPicked = {
            id: user.id,
            first_name: user.first_name,
            last_name: user.last_name,
          };
          mahasiswa.value.push(currMhs);
        });
      });
      response.data.dosen.forEach((item) => {
        getUserById(item, (user) => {
          const currDsn: userPicked = {
            id: user.id,
            first_name: user.first_name,
            last_name: user.last_name,
          };
          dosenValue.value.push(currDsn);
        });
      });
    })
    .catch((error) => {
      console.log(error);
    });
};

onBeforeMount(() => {
  fetchDetailProposal();
});

const handleClick = async ({ isError, formData, isLoading }) => {
  if (!isError && !isLoading) {
    proposalFormRef.value?.toggleIsLoading();
    const authorization = `Bearer ${getAccessToken()}`;
    await axios
      .put(
        `${baseApiUrl}proposal/${route.params.id}/`,
        {
          title: formData.title,
          file: formData.file.files[0],
        },
        { headers: { authorization, "Content-Type": "multipart/form-data" } }
      )
      .then((response) => {
        // add dosen pembimbing
        formData.dosen.forEach(async (item) => {
          await axios.post(
            `${baseApiUrl}proposal/mahasiswa/`,
            {
              proposal_id: response.data.id,
              mahasiswa: item.id,
            },
            { headers: { authorization } }
          );
        });
        // add mahasiswa
        formData.mahasiswa.forEach(async (item) => {
          await axios
            .post(
              `${baseApiUrl}proposal/dosen/`,
              {
                proposal_id: response.data.id,
                dosen: item.id,
              },
              { headers: { authorization } }
            )
            .then(() => {
              Swal.fire("Berhasil", "Proposal berhasil diubah", "success");
              router.push("/admin/proposal/list");
            });
        });
      });
  } else {
    console.log("form is not valid");
  }
};
</script>
<template>
  <NuxtLayout name="admin">
    <div class="pb-10">
      <div v-if="!isLoading">
        <section class="flex flex-col gap-8" v-if="proposalValue">
          <!-- * Header Section    -->
          <PageHeader>Edit Proposal</PageHeader>
          <!--   ! End Header Section -->
          <div class="flex flex-col gap-5">
            <!--    Header Form    -->
            <PageSubHeader>
              <template #title>
                File proposal yang diupload hanya berisi BAB 2 & 3
              </template>
              <template #description
                >Untuk lainnya silahkan dihapus terlebih dahulu agar hasil yang
                didapatkan sesua dengan yang diharapkan
              </template>
            </PageSubHeader>
            <!--   End Header Form    -->
            <hr />
            <ProposalForm
              @clicked="handleClick($event)"
              ref="proposalFormRef"
              :value="{
                title: proposalValue.title,
                dosen: dosenValue,
                mahasiswa: mahasiswa,
              }"
            />
          </div>
        </section>
        <NotFoundComponent v-else />
      </div>
    </div>
  </NuxtLayout>
</template>
