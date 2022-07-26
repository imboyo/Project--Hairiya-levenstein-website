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
}
