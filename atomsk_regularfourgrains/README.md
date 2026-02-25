Aluminum Polycrystal Generation Script
This repository contains a Bash script to generate a 3D polycrystalline Aluminum structure using Atomsk. The script automates the creation of grain seeds, defines orientations, and exports the final geometry to LAMMPS format.

🛠 Prerequisites
To run this script, you must have the following installed on your Linux system:

Atomsk: The core tool for creating and manipulating atomic structures.

bc: Command-line calculator for seed position math.

pigz: Parallel implementation of gzip for fast compression of large output files.

🔬 How the Script Works
The script follows a 4-step process:

Seed Generation (poly.txt): It calculates four "nodes" (grain centers) within a defined simulation box (200×173.2×100 A˚). It applies random spatial dispersion and rotation based on the rozptyl and uhel variables.

Unit Cell Creation: It creates a fundamental Aluminum FCC unit cell with a lattice parameter of 4.05 A˚ and specific crystallographic orientations ([1-10] [001] [110]).

Polycrystal Assembly: Atomsk uses the Voronoi tessellation method to "fill" the simulation box with grains centered at the generated nodes.

Compression: The final .lmp (LAMMPS data) and .cfg (Atomeye) files are compressed using pigz to save disk space.

📂 File Descriptions
- generate_poly.sh	The main bash script.
- poly.txt	The input file for Atomsk containing box size and grain seeds.
- poly.cfg.gz	Compressed configuration file for visualization (Atomeye/OVITO).
- poly.lmp.gz	Compressed LAMMPS data file for MD simulations.
