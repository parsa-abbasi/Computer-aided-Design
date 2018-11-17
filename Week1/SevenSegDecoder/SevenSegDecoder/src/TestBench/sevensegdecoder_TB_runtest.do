SetActiveLib -work
comp -include "$dsn\src\SevenSegDecoder.vhd" 
comp -include "$dsn\src\TestBench\sevensegdecoder_TB.vhd" 
asim +access +r TESTBENCH_FOR_sevensegdecoder 
wave 
wave -noreg In7seg
wave -noreg Out7seg
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\sevensegdecoder_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sevensegdecoder 
