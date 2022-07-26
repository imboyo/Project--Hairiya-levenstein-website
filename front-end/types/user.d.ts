interface Users {
  count: number;
  next: number | null | string;
  previous: number | null | string;
  results: User[];
}

interface User {
  id: number;
  username: string;
  first_name: string;
  last_name: string;
  email: string;
  is_active: boolean;
  last_login: string;
  profile: {
    id: number;
    user: number;
    nomor_induk: string;
    role: "mahasiswa" | "admin" | "dosen";
  };
}
