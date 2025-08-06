# Estimation of Cutoff Radius (`r_cut`) from Pair Potentials

This repository provides a simple method to estimate the **cutoff radius** (`r_cut`) for interatomic potentials using a combination of Bash and Python tools.

---

## 📁 Files

### `rcut.sh`

This is a **Bash script** that processes the input potential file (usually `.eam.alloy`) and extracts the pair potential data for a specific element pair.

**Features:**
- Extracts distance and energy values from a potential file.
- Saves the processed output as `pair_potential.txt` for plotting.

**Usage:**
```bash
bash rcut.sh 
