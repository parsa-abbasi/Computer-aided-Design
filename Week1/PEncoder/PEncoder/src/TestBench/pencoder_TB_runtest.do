SetActiveLib -work
comp -include "$dsn\src\PEncoder.vhd" 
comp -include "$dsn\src\TestBench\pencoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_pencoder 
wave 
wave -noreg Input
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\pencoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_pencoder 
