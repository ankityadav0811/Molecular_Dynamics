#!/bin/bash
rozptyl_xy=0.00
rozptyl_z=0.00
uhel_x=0
uhel_y=0
uhel_z=360
echo "box 200 173.2051 100" > poly.txt
echo node `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}+0.25 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}     | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_z} + 0.5 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${uhel_x} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_y} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_z} | bc -l`>> poly.txt
echo node `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}+0.75 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}     | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_z} + 0.5 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${uhel_x} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_y} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_z} | bc -l`>> poly.txt
echo node `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}+0.5  | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}+0.5 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_z} + 0.5 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${uhel_x} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_y} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_z} | bc -l`>> poly.txt
echo node `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}      | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_xy}+0.5 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${rozptyl_z} + 0.5 | bc -l`*box `echo \( $RANDOM / 32768 -0.5 \) *${uhel_x} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_y} | bc -l` `echo \( $RANDOM / 32768 -0.5 \) *${uhel_z} | bc -l`>> poly.txt

rm poly*.cfg* poly*.lmp* *.xsf poly*_id-size.txt poly*_size-dist.txt poly*_param.txt tmp.cfg 2>/dev/null
atomsk --create fcc 4.04999918095267 Al orient [1-10] [001] [110] xsf -v 0 #orient [1-10] [001] [110]#[1-10] [112] [-1-11]
#atomsk Al_supercell.cfg -select out box 2 2 2 51.5 44.5 148 -select rm random 90% any -substitute Al Mg AlMg.cfg -v 0
atomsk --polycrystal Al.xsf poly.txt poly.cfg -wrap -v 0 #-duplicate 1 1 20
#atomsk polyx.cfg -select random 3% Al -substitute Al Mg poly.cfg -v 0
#atomsk poly00.cfg -select out cylinder z 200 200 100 -select rm out cylinder z 200 200 110 -select rm random 95% Al -rmatom select poly1.cfg -v 0
#atomsk poly1.cfg -select out cylinder z 100 0 100 -select rm out cylinder z 100 0 110 -select rm random 95% Al -rmatom select poly2.cfg -v 0
#atomsk poly2.cfg -select out cylinder z 0 0 90 -select rm out cylinder z 0 0 110 -select rm random 80% Al -rmatom select poly3.cfg -v 0
#atomsk poly3.cfg -select out cylinder z 26 93 24 -select rm out cylinder z 26 93 28 -select rm random 80% Al -substitute Al Mg poly4.cfg -v 0
#atomsk poly4.cfg -select out cylinder z 80 93 24 -select rm out cylinder z 80 93 28 -select rm random 80% Al -substitute Al Mg poly.cfg -v 0
#atomsk polyx.cfg -select out cylinder z 53.5 46.5 27 -rmatom select poly.cfg
atomsk poly.cfg poly.lmp -v 0
pigz -9 poly.lmp poly.cfg

