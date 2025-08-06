#!/bin/bash

# Output file
echo "#Distance (Å)    Energy (eV)" > energy_vs_distance.txt

for d in $(seq 0 0.1 1000.0); do
    echo "Testing distance: $d Å"

    # Replace atom position in LAMMPS input
    cat > in.rcut << EOF
clear
units metal
atom_style atomic
boundary p p p


neighbor        2.0 bin 
neigh_modify    every 10 delay 0 check no


region box block 0 1000 0 1000 0 1000
create_box 1 box
mass 1 26.98
create_atoms 1 single 0 0 0
create_atoms 1 single ${d} 0 0

include potential.mod
pair_modify shift yes



compute pe all pe
thermo_style custom step c_pe

#dump 101 all custom 1 dump_energy_${d}.txt id type x y z c_csym c_eng
thermo 1
run 0
EOF

    # Run LAMMPS and extract energy
    energy=$(lammps -in in.rcut | grep -A1 "Step" | tail -n 1 | awk '{print $2}')
    echo "$d    $energy" >> energy_vs_distance.txt
done
