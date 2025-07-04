
#pair_style  eam/alloy
#pair_style meam
#pair_coeff * * NiAlRu.eam.alloy Ni Al Ru

pair_style hybrid/overlay zbl 1.0 2.3 eam/alloy
pair_coeff 1 3 zbl 28 44
pair_coeff * * eam/alloy NiAlRu.eam.alloy Ni Al Ru

pair_modify shift yes

#min_style adaptglok
#min_style fire
min_style cg
min_modify dmax 0.2 line quadratic
#0.01 quadratic, forcezero, backtrack
#forcezero fastest


thermo          1000
thermo_style custom step temp press pe ke etotal lx ly lz vol cpuremain
thermo_modify   norm no lost ignore flush yes

#compute        1 all temp
#compute        peratom all stress/atom 1
#compute        p_x all reduce sum c_peratom[1]
#compute        p_y all reduce sum c_peratom[2]
#compute        p_z all reduce sum c_peratom[3]
#variable       sigma_x equal -c_p_x/v_vol0/10
#variable       sigma_y equal -c_p_y/v_vol0/10
#variable       sigma_z equal -c_p_z/v_vol0/10
#variable       epsilon_x equal ln(lx/v_lx0)
#variable       epsilon_y equal ln(ly/v_ly0)
#variable       epsilon_z equal ln(lz/v_lz0)

compute csym all centro/atom fcc
compute eng all pe/atom

#thermo_style custom step temp pe etotal press vol lx ly v_epsilon_x v_sigma_x v_epsilon_y v_sigma_y v_sigma_z


