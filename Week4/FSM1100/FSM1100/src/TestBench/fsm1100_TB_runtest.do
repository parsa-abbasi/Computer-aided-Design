SetActiveLib -work
comp -include "$dsn\src\FSM1100.vhd" 
comp -include "$dsn\src\TestBench\fsm1100_TB.vhd" 
asim +access +r TESTBENCH_FOR_fsm1100 
wave 
wave -noreg X
wave -noreg Clk
wave -noreg Start
wave -noreg Stop
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\fsm1100_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_fsm1100 
