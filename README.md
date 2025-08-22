# GC Content Calculator (FASTA)

A simple and efficient **GC content calculator** for FASTA files using `awk`.  
This script calculates the **sequence length** and **GC content (%)** for each sequence in a given FASTA file.

---

## 📌 Features
- Processes FASTA files in a **single pass** using `awk` (no external tools like `wc` or `tr` needed).
- Outputs:
  - Sequence header
  - Sequence length
  - GC content percentage

---

## ⚙️ Usage

```bash
./gc_content_simple.sh input.fasta
