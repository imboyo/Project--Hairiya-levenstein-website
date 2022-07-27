interface Proposals {
  count: number;
  next: number | null | string;
  previous: number | null | string;
  results: Proposal[];
}

interface Proposal {
  id: number;
  title: string;
  file: string;
  created_at: string;
  plagiarism_percentage: number;
  dosen: number[];
  mahsiswa: number[];
}

interface userPicked {
  id: string;
  first_name: string;
  last_name: string;
}
