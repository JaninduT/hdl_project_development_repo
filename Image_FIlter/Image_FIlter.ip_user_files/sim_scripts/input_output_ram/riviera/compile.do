vlib work
vlib riviera

vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/xil_defaultlib

vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work blk_mem_gen_v8_4_4  -v2k5 \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../Image_FIlter.srcs/sources_1/ip/input_output_ram/sim/input_output_ram.v" \


vlog -work xil_defaultlib \
"glbl.v"

