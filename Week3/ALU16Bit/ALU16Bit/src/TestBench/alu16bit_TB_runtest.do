SetActiveLib -work
comp -include "$dsn\src\ALU16Bit.vhd" 
comp -include "$dsn\src\TestBench\alu16bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_alu16bit 
wave 
wave -noreg InputA
wave -noreg InputB
wave -noreg Command
wave -noreg Clk
wave -noreg ALUEn
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\alu16bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_alu16bit 
