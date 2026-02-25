# NOTE: This script can be modified for different atomic structures, 
# units, etc. See in.elastic for more info.
#

# Define the finite deformation size. Try several values of this
# variable to verify that results do not depend on it.
variable up equal 1.0e-6
 
# Define the amount of random jiggle for atoms
# This prevents atoms from staying on saddle points
variable atomjiggle equal 1.0e-5

# Uncomment one of these blocks, depending on what units
# you are using in LAMMPS and for output

# metal units, elastic constants in eV/A^3
#units		metal
#variable cfac equal 6.2414e-7
#variable cunits string eV/A^3

# metal units, elastic constants in GPa
units		metal
variable cfac equal 1.0e-4
variable cunits string GPa

# real units, elastic constants in GPa
#units		real
#variable cfac equal 1.01325e-4
#variable cunits string GPa

# Define minimization parameters
variable etol equal 0.0 
variable ftol equal 1.0e-10
variable maxiter equal 100000
variable maxeval equal 1000000
variable dmax equal 1.0e-2

# generate the box and atom positions using a diamond lattice
variable a equal 4.05

boundary	p p p


lattice        fcc $a
region         box prism 0 10.0 0 10.0 0 10.0 0.0 0.0 0.0
create_box     1 box
create_atoms   1 box

change_box all triclinic

#read_data poly.lmp
mass 1 26.981539
#mass 2 24.305
#variable scale equal ${a}/4.045
#change_box all x scale ${scale} y scale ${scale} z scale ${scale} remap
timestep 0.001
variable ftol equal 1.0e-4
include potential.mod
min_style  fire
minimize ${etol} ${ftol} ${maxiter} ${maxeval}
variable ftol equal 1.0e-10
min_style  cg
minimize ${etol} ${ftol} ${maxiter} ${maxeval}

fix 3 all box/relax  iso 0.0
minimize ${etol} ${ftol} ${maxiter} ${maxeval}
unfix 3


#change_box all triclinic

#lattice         fcc $a
#region		box prism 0 4.0 0 4.0 0 4.0 0.0 0.0 0.0
#create_box	2 box
#create_atoms	1 box

# Need to set mass to something, just to satisfy LAMMPS
#mass 1 1.0e-20

