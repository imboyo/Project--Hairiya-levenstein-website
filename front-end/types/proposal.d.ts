interface Proposals {
  count: number;
  next: number | null;
  previous: number | null;
  results: Proposal[];
}

interface Proposal {
  id: number;
  title: string;
  file: string;
  created_at: string;
  plagiarism_percentage: number;
}
