SetActiveLib -work
comp -include "$dsn\src\Counter12Bit.vhd" 
comp -include "$dsn\src\TestBench\counter12bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_counter12bit 
wave 
wave -noreg CountEn
wave -noreg Clk
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\counter12bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_counter12bit 
