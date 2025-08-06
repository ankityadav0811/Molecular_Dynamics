# Melt-Cool Simulation (No Pressure During Heating/Cooling)

This folder contains a LAMMPS input script to perform a melt-cool simulation of an aluminum system, followed by tensile deformation in the x-direction. The aim is to generate a realistic atomic configuration through thermal cycling and evaluate the mechanical response.

## 🔧 Simulation Overview

- **System**: Pure Aluminum (can be extended to Al-Mg)
- **Initial Structure**: FCC lattice with lattice parameter `a0 = 4.05 Å`
- **Boundary Conditions**: Periodic in x and y; free in z (eventually)
- **Units**: `metal`

## 🧪 Key Stages

1. **Initialization**:
   - FCC lattice created in a thin slab geometry.
   - Initial temperature set to high (`1300 K`) to simulate melting.

2. **Melt Phase**:
   - Run at `1300 K` with `npt` fix and zero pressure (iso 0.0 0.0).

3. **Cooling Phase**:
   - Temperature ramped from `700 K` to `300 K` while maintaining zero pressure.

4. **Equilibration & Replication**:
   - Structure is replicated in the z-direction to build thickness.
   - Further equilibration at `300 K`.

5. **Boundary Modification**:
   - z-direction changed to non-periodic to allow for free surface.

6. **Tensile Deformation**:
   - Uniaxial tension applied along x-direction using `fix deform`.
   - Pressure maintained in y-direction using `npt`.

## 📂 Output Files

- `initial.lmp` — Configuration after atom creation
- `fortensile.lmp` — Configuration after melt-cool and equilibration
- `final.lmp` — Configuration after tensile simulation
- `dump_meltcool.*` — Atomic positions and velocities at intervals

## 📌 Notes

- Includes atom count reporting (`n_al`, `n_mg`)
- Mg atoms not used in current script (group is defined for future extension).
- Pressure is applied only during equilibration and tension phases, not during melt/cool.

## 🧑‍💻 How to Run

```bash
lmp -in in.meltcool
