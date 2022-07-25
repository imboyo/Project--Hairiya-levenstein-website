export const dynamicSidenavByRoles = (roles: string) => {
  const admin = [
    {
      path: "/admin/dashboard",
      name: "Dashboard",
      icon: "dashboard",
    },
    {
      name: "Proposal",
      children: [
        {
          path: "/admin/proposal/list",
          name: "Daftar Proposal",
          icon: "list",
        },
        {
          path: "/admin/proposal/create",
          name: "Upload Proposal",
          icon: "upload",
        },
      ],
    },
    {
      name: "User",
      children: [
        {
          path: "/admin/user/list",
          name: "Daftar User",
          icon: "list",
        },
        {
          path: "/admin/user/create",
          name: "Tambah User",
          icon: "add",
        },
      ],
    },
  ];

  const dosen_mahasiswa = [
    {
      path: "/general/dashboard",
      name: "Dashboard",
      icon: "dashboard",
    },
    {
      path: "/general/proposal/list",
      name: "Daftar Proposal",
      icon: "list",
    },
    {
      path: "/general/user/list",
      name: "Daftar User",
      icon: "list",
    },
  ];

  if (roles === "admin") {
    return admin;
  } else {
    return dosen_mahasiswa;
  }
};
