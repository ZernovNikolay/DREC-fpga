set_time_format -unit ns -decimal_places 3  		
create_clock -name {clk} -period 20.800 -waveform { 0.000 10.400 } [get_ports {clk}]
create_generated_clock --divide_by 29019607 -source [get_ports {clk}] -name clk_ms [get_registers {clk}]

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
	
set_false_path -from [get_clocks {clk}] -to [get_clocks {clk_ms}]
set_false_path -from [get_clocks {clk_ms}] -to  [get_clocks {clk}]

set_false_path -from [get_clocks {clk}] -to [get_ports {DS_EN1 DS_EN2 DS_EN3 DS_EN4 DS_A DS_B DS_C DS_D DS_E DS_F DS_G DS_DP}] 