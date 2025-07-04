# MD_Energy

## Overview

This repository contains LAMMPS input scripts and supporting files to calculate the **cohesive energy** of materials using molecular dynamics simulations.  
Currently, it includes a script to calculate the cohesive energy of aluminum (Al) using the MEAM potential.

## Contents

- `cohesive_energy.lmp` — LAMMPS input script for cohesive energy calculation of Al.
- `potential.mod` — Potential setup file defining the MEAM potential for Al.
- Any additional scripts or data files as needed.

## How to Use

1. Make sure you have LAMMPS installed (tested with version 29 Aug 2024).
2. Place the MEAM potential files (`library-Al.meam` and `Al.meam`) in the working directory.
3. Run the simulation with:
   ```bash
   lmp -in in.energy
