# MD_Energy

This folder contains molecular dynamics (MD) scripts and results for calculating the **cohesive energy** and **lattice parameters** of various crystal structures using LAMMPS.

## 📁 Folder Structure

Each subdirectory corresponds to a specific crystal structure:

- `B1` - Rocksalt structure (e.g., NaCl type)
- `B2` - CsCl structure
- `B3` - Zinc blende (e.g., GaAs)
- `D019` - Hexagonal structure (common in intermetallics)
- `D022` - Tetragonal structure
- `diamondSi` - Diamond cubic structure (e.g., Si, Ge)
- `FCC` - Face-Centered Cubic (e.g., Al, Cu, Ni)
- `L12` - Ordered FCC structure (e.g., Ni₃Al)
- `p63mcSiGe` - Hexagonal crystal structure for SiGe alloys

## 📌 Purpose

The purpose of this project is to:

- Simulate different crystalline structures using LAMMPS.
- Calculate their **cohesive energy** by minimizing the total potential energy per atom.
- Determine their **equilibrium lattice parameters** using energy vs. volume or energy vs. lattice constant analysis.

## 🛠️ Tools and Software

- **LAMMPS** for molecular dynamics simulations.

## 📂 Contents of Each Subfolder

Each subfolder typically contains:

- `in.lammps`: LAMMPS input script to run the simulation.
- `data.*`: Structure data files.
- `log.lammps`: Output log with thermodynamic info.

## 📈 Example Results

- Cohesive energy and equilibrium lattice constant are extracted from a fitted curve (e.g., 3rd-order polynomial) of energy vs. lattice constant.
- Example output:
  - **FCC Al**: E_coh ≈ -3.36 eV/atom, a₀ ≈ 4.05 Å
  - **B2 NiAl**: E_coh ≈ -4.25 eV/atom, a₀ ≈ 2.88 Å

## 🧑‍🔬 Applications

These calculations serve as the foundation for:

- Validating interatomic potentials (e.g., EAM, MEAM, NEP).
- Comparing experimental vs. simulated structural properties.
