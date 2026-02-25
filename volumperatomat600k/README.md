Molecular Dynamics: Aluminum Equilibrium Volume Calculation
This repository contains LAMMPS input scripts to determine the equilibrium per-atom volume of Aluminum at high temperatures (600K) using the Modified Embedded Atom Method (MEAM) potential.

🔬 Scientific Context
At high temperatures, the lattice of Aluminum expands significantly. To find the true equilibrium volume, we must allow the simulation box to relax at zero pressure. However, thermal fluctuations in an NPT ensemble cause the box volume to oscillate. This script addresses that by using time-averaging to provide a statistically converged result rather than a single-point snapshot.

🛠 Simulation Setup
Material: Aluminum (Al)

Crystal Structure: FCC (Face-Centered Cubic)

Supercell Size: 8×8×8 unit cells (2048 atoms)

Potential: MEAM (Modified Embedded Atom Method) with a 5.0  
A˚ cutoff.

Ensemble: NPT (Isobaric-Isothermal)

Target Pressure: 0.0 bar (Anisotropic relaxation)

Temperature: 600K

📂 File Descriptions
File	Description
in.volume	The primary LAMMPS input script.
potential.mod	Contains the MEAM potential parameters and library references.
README.md	Documentation of the project.

🚀 How to Run
Ensure you have LAMMPS installed with the MEAM and OPENMP packages.

# Navigate to the folder
cd volumperatomat600k

# Run using MPI (e.g., 4 processors)
mpirun -np 4 lmp_mpi -in in.volume
📊 Key Logic: Instantaneous vs. Averaged
The script is designed to output two distinct volume metrics to demonstrate the impact of thermal noise:

Instantaneous Volume: The box volume at the very last timestep (50 ps).

Averaged Volume: A running cumulative average calculated over the stable portion of the trajectory.

Note: The script utilizes fix ave/time with the ave running keyword, synchronized with the thermo output to avoid "illegal variable" substitution errors.

📈 Example Output
Upon successful completion, the script will print a summary block like this:
# Aluminum Equilibrium Volume Calculation (600K)

This project uses LAMMPS to determine the equilibrium lattice properties of Aluminum using the **MEAM** (Modified Embedded Atom Method) potential.

## 🔬 Simulation Methodology
The system consists of a 2048-atom FCC supercell. We utilize an **NPT ensemble** at 0.0 bar to allow the box to relax. To filter out thermal noise and pressure-induced oscillations, we compare the final snapshot against a cumulative running average.

## 📊 Results at 600 K
The following results demonstrate the convergence of the system after a 50ps relaxation period.

| Measurement Type | Total Box Volume ($\text{\AA}^3$) | Volume Per Atom ($\text{\AA}^3/\text{atom}$) |
| :--- | :--- | :--- |
| **Instantaneous (Step 50k)** | 35866.20 | 17.5128 |
| **Averaged (Cumulative)** | **35858.38** | **17.5090** |

### Terminal Summary
```text
---------------------------------------------------------
      VOLUME COMPARISON AT 600.0 K
---------------------------------------------------------
 INSTANTANEOUS (Step 50k):
   - Box Volume:          35866.20 Ang^3
   - Vol/Atom:            17.5128 Ang^3/atom

 AVERAGED (Cumulative):
   - Box Volume:          35858.38 Ang^3
   - Vol/Atom:            17.5090 Ang^3/atom
---------------------------------------------------------

