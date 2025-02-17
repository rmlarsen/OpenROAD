# init_floorplan
source "helpers.tcl"
read_lef Nangate45/Nangate45.lef
read_liberty Nangate45/Nangate45_typ.lib
read_verilog tiecells.v
link_design top
initialize_floorplan -die_area "0 0 1000 1000" \
  -core_area "100 100 900 900" 

insert_tiecells LOGIC0_X1/Z -prefix "TIE_ZERO_"
insert_tiecells LOGIC1_X1/Z

set def_file [make_result_file tiecells.def]
write_def $def_file
diff_files tiecells.defok $def_file
