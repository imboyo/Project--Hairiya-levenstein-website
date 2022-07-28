<script setup lang="ts">
import PageSubHeader from "~/components/header/PageSubHeader.vue";
import PageHeader from "~/components/header/PageHeader.vue";
import ProposalForm from "~/components/pages/proposal/ProposalForm.vue";
import { getAccessToken } from "~/my_modules/api_services/auth";
import axios from "axios";
import { baseApiUrl } from "~/my_modules/environment";
import Swal from "sweetalert2";
import { verifyRolePageUser } from "~/my_modules/reusable_component";

useHead({
  titleTemplate: (title) => `Upload Proposal - ${title}`,
});

// For redirecting user is not have permission in this page then redirect them.
const initialPageIsLoading = ref(true);
verifyRolePageUser("admin", initialPageIsLoading);

const router = useRouter();
const proposalFormRef = ref<InstanceType<typeof ProposalForm> | null>(null);

const handleClick = async ({ isError, formData, isLoading }) => {
  if (!isError && !isLoading) {
    proposalFormRef.value?.toggleIsLoading();
    const authorization = `Bearer ${getAccessToken()}`;
    await axios
      .post(
        `${baseApiUrl}proposal/`,
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
              Swal.fire("Berhasil", "Proposal berhasil diupload", "success");
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
  <div>
    <div class="mb-10" v-if="!initialPageIsLoading">
      <section class="flex flex-col gap-8">
        <!-- * Header Section    -->
        <PageHeader>Upload Proposal</PageHeader>
        <!--   ! End Header Section -->
        <!-- Form Section   -->
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
          <ProposalForm @clicked="handleClick($event)" ref="proposalFormRef" />
        </div>
      </section>
    </div>
  </div>
</template>
