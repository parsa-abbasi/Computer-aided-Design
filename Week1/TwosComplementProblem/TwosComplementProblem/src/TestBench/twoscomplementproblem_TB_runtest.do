SetActiveLib -work
comp -include "$dsn\src\TwosComplementProblem.vhd" 
comp -include "$dsn\src\TestBench\twoscomplementproblem_TB.vhd" 
asim +access +r TESTBENCH_FOR_twoscomplementproblem 
wave 
wave -noreg Input
wave -noreg Output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\twoscomplementproblem_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_twoscomplementproblem 
