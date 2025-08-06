# Cluster Performance Benchmarking with NEP Potentials

This directory contains benchmarking scripts and data for evaluating the **computational performance** of molecular dynamics simulations using **NEP (Neural Equivariant Potential)** machine learning interatomic potentials on an HPC cluster.

## 🎯 Objective

The purpose of this analysis is to estimate how many **timesteps can be simulated in 24 hours** for a given:

- System size (number of atoms)
- Number of CPU cores

This allows us to understand the scalability and efficiency of NEP potentials in large-scale simulations.

---

## 📁 Contents

- `in.energy` – LAMMPS input script used for energy minimization or time integration benchmarks.
- `potential.mod` – NEP machine learning potential file used in the simulations.
- `speed.ipynb` – Jupyter Notebook to compute and visualize:
  - **Simulation speed per CPU** (`spcpu`: timesteps/second/core)
  - **Estimated timesteps/day** for different CPU/atom configurations

---

## 📊 Measured Data

From the simulations, we collect the following:

- `no_of_cpus`: Number of CPU cores used.
- `no_of_atoms`: Total number of atoms in the system.
- `spcpu`: Simulation speed per CPU (timesteps/second/core), extracted from the LAMMPS log file using:
