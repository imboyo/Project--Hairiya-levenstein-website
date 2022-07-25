export const dynamicSidenavByRoles = (roles: string) => {
  const admin = [
    {
      path: "/admin/dashboard",
      name: "Dashboard",
      icon: "dashboard",
    },
    {
      name: "Proposal",
      icon: "assignment",
      childrens: [
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
      icon: "assignment",
      childrens: [
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
      path: "/general/proposal/",
      name: "Daftar Proposal",
      icon: "list",
    },
    {
      path: "/general/user/",
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
