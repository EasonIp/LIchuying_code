
	#set_global_assignment -name FAMILY "Cyclone IV"
	#set_global_assignment -name DEVICE ep4ce6e22c8n

set_location_assignment PIN_23 -to    clk 	

# KEY Çá´¥°´¼ü
set_location_assignment PIN_69 -to   rst_n         

# AD
set_location_assignment PIN_99 -to  adc_clk
set_location_assignment PIN_87 -to  adc_in 
set_location_assignment PIN_98 -to  cs_n 		 
		        
         
# SEG7 x 8 Æß¶ÎÊýÂë¹Ü
set_location_assignment PIN_119 -to   sel[2]
set_location_assignment PIN_115 -to   sel[1]
set_location_assignment PIN_114 -to   sel[0] 
set_location_assignment PIN_127 -to   seg[0]     
set_location_assignment PIN_128 -to   seg[1]    
set_location_assignment PIN_124 -to   seg[2]     
set_location_assignment PIN_121 -to   seg[3]     
set_location_assignment PIN_120 -to   seg[4]     
set_location_assignment PIN_126 -to   seg[5]     
set_location_assignment PIN_129 -to   seg[6]     
set_location_assignment PIN_125 -to   seg[7] 
