# Aluminum Melting Point: Two-Phase Coexistence Method

This repository contains LAMMPS input scripts to determine the melting temperature ($T_m$) of Aluminum using the **Two-Phase (Interface) Coexistence Method**.

## 📂 File Structure

* **`in.melting`**: Standard script using `aniso` pressure coupling. This allows the box to relax in all directions to maintain zero stress.
* **`in.meltingnptinx`**: Script using `x` direction pressure coupling. This keeps the $Y$ and $Z$ dimensions fixed, ensuring the interface remains stable and perpendicular to the X-axis.
* **`potential.mod`**: Includes the MEAM potential parameters for Aluminum.

## 🔬 Scientific Methodology
This method places a solid crystal and a liquid melt in the same simulation box to observe which phase is more stable at a given temperature.

1. **Phase Setup:** The liquid phase is pre-melted at $2500$ K while the solid is kept at $300$ K.
2. **Coexistence Run:** The system is equilibrated at a target temperature (e.g., $935$ K) under NPT conditions.
3. **Data Interpretation:**
    * **Freezing:** If Potential Energy (PE) **decreases**, the target temperature is *below* $T_m$. 
    * **Melting:** If Potential Energy (PE) **increases**, the target temperature is *above* $T_m$.



## 📊 Current Observations (Test @ 935K)
In our recent tests at **935 K**, we observed:
* **Initial PE:** $-3028.6$ eV
* **Final PE:** $-3201.0$ eV
* **Result:** The system is **crystallizing**, meaning the melting point of this Aluminum model is higher than $935$ K.



## 🚀 How to Run
```bash
# For anisotropic relaxation (Standard)
mpirun -np 4 lmp_mpi -in in.melting

# For X-only relaxation
mpirun -np 4 lmp_mpi -in in.meltingnptinx
