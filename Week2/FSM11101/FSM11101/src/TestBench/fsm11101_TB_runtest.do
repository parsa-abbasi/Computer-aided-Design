SetActiveLib -work
comp -include "$dsn\src\FSM11101.vhd" 
comp -include "$dsn\src\TestBench\fsm11101_TB.vhd" 
asim +access +r TESTBENCH_FOR_fsm11101 
wave 
wave -noreg Input
wave -noreg Clk
wave -noreg Rst
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fsm11101_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fsm11101 
