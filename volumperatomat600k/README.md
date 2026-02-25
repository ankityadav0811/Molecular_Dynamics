Molecular Dynamics: Aluminum Equilibrium Volume Calculation
This repository contains LAMMPS input scripts to determine the equilibrium per-atom volume of Aluminum at high temperatures (600K) using the Modified Embedded Atom Method (MEAM) potential.

🔬 Scientific Context
At high temperatures, the lattice of Aluminum expands significantly. To find the true equilibrium volume, we must allow the simulation box to relax at zero pressure. However, thermal fluctuations in an NPT ensemble cause the box volume to oscillate. This script addresses that by using time-averaging to provide a statistically converged result rather than a single-point snapshot.

🛠 Simulation Setup
Material: Aluminum (Al)

Crystal Structure: FCC (Face-Centered Cubic)

Supercell Size: 8×8×8 unit cells (2048 atoms)

Potential: MEAM (Modified Embedded Atom Method) with a 5.0  
A
˚
  cutoff.

Ensemble: NPT (Isobaric-Isothermal)

Target Pressure: 0.0 bar (Anisotropic relaxation)

Temperature: 600K

📂 File Descriptions
File	Description
in.vol_calc	The primary LAMMPS input script.
potential.mod	Contains the MEAM potential parameters and library references.
README.md	Documentation of the project.
￼
Export to Sheets
￼
🚀 How to Run
Ensure you have LAMMPS installed with the MEAM and OPENMP packages.

Bash
￼
# Navigate to the folder
cd volumperatomat600k

# Run using MPI (e.g., 4 processors)
mpirun -np 4 lmp_mpi -in in.vol_calc
📊 Key Logic: Instantaneous vs. Averaged
The script is designed to output two distinct volume metrics to demonstrate the impact of thermal noise:

Instantaneous Volume: The box volume at the very last timestep (50 ps).

Averaged Volume: A running cumulative average calculated over the stable portion of the trajectory.

Note: The script utilizes fix ave/time with the ave running keyword, synchronized with the thermo output to avoid "illegal variable" substitution errors.

📈 Example Output
Upon successful completion, the script will print a summary block like this:


      # Volume Comparison Results

### 🌡️ Simulation Results at 600.0 K

> **Note:** The following data was extracted after a 50ps NPT relaxation of an FCC Aluminum supercell (2048 atoms).

---

#### 1. Instantaneous (Snapshot at Step 50,000)
* **Vol/Atom:** `17.5127 Ang^3/atom`

#### 2. Averaged (Cumulative Running Average)
* **Box Volume:** `35866.1 Ang^3`
* **Vol/Atom:** `17.5128 Ang^3/atom`

---

### 📝 Summary Table
| Metric | Volume Per Atom ($\text{\AA}^3$) | Total Volume ($\text{\AA}^3$) |
| :--- | :--- | :--- |
| **Instantaneous** | 17.5127 | 35866.0 |
| **Averaged** | **17.5128** | **35866.1** |

---
