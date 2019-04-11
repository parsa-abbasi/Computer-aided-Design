SetActiveLib -work
comp -include "$dsn\src\InertialTransportReject.vhd" 
comp -include "$dsn\src\TestBench\inertialtransportreject_TB.vhd" 
asim +access +r TESTBENCH_FOR_inertialtransportreject 
wave 
wave -noreg qin
wave -noreg Y1
wave -noreg Y2
wave -noreg Y3
wave -noreg Y4
wave -noreg Y5
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\inertialtransportreject_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_inertialtransportreject 
