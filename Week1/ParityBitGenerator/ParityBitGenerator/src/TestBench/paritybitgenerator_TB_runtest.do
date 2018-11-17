SetActiveLib -work
comp -include "$dsn\src\ParityBitGenerator.vhd" 
comp -include "$dsn\src\TestBench\paritybitgenerator_TB.vhd" 
asim +access +r TESTBENCH_FOR_paritybitgenerator 
wave 
wave -noreg Input
wave -noreg Parity_odd
wave -noreg Parity_even
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\paritybitgenerator_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_paritybitgenerator 
