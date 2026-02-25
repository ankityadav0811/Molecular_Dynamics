#pair_style meam/c
pair_style meam
pair_coeff * * library-Al.meam Al Al.meam Al

pair_modify shift yes

#min_style adaptglok
#min_style fire
min_style cg
min_modify dmax 0.2 line quadratic
#0.01 quadratic, forcezero, backtrack
#forcezero fastest

thermo_modify   norm no
thermo          100
thermo_modify lost ignore
thermo_modify flush yes


compute csym all centro/atom fcc
compute eng all pe/atom

thermo_style custom step temp pe etotal press vol lx ly  cpuremain spcpu
