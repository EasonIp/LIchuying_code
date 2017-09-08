
	#set_global_assignment -name FAMILY "Cyclone II"
	#set_global_assignment -name DEVICE EP2C35F672C6

set_location_assignment PIN_N2		-to		clk 	
	
# LED

set_location_assignment PIN_W26		-to		rst_n	
# KEY Çá´¥°´¼ü
set_location_assignment PIN_G26		-to		key[0]          
set_location_assignment PIN_N23		-to		key[1]          
# set_location_assignment PIN_P23		-to		key[2]          
# set_location_assignment PIN_W26		-to		key[3]            
         
# SEG7 x 8 Æß¶ÎÊýÂë¹Ü
set_location_assignment PIN_AF10	-to		hex0[0]     
set_location_assignment PIN_AB12	-to		hex0[1]    
set_location_assignment PIN_AC12	-to		hex0[2]     
set_location_assignment PIN_AD11	-to		hex0[3]     
set_location_assignment PIN_AE11	-to		hex0[4]     
set_location_assignment PIN_V14		-to		hex0[5]     
set_location_assignment PIN_V13		-to		hex0[6]     

set_location_assignment PIN_V20		-to		hex1[0]     
set_location_assignment PIN_V21		-to		hex1[1]    
set_location_assignment PIN_W21		-to		hex1[2]     
set_location_assignment PIN_Y22		-to		hex1[3]     
set_location_assignment PIN_AA24	-to		hex1[4]     
set_location_assignment PIN_AA23	-to		hex1[5]     
set_location_assignment PIN_AB24	-to		hex1[6]     
   
set_location_assignment PIN_AB23	-to		hex2[0]     
set_location_assignment PIN_V22		-to		hex2[1]    
set_location_assignment PIN_AC25	-to		hex2[2]     
set_location_assignment PIN_AC26	-to		hex2[3]     
set_location_assignment PIN_AB26	-to		hex2[4]     
set_location_assignment PIN_AB25	-to		hex2[5]     
set_location_assignment PIN_Y24		-to		hex2[6]     

set_location_assignment PIN_Y23		-to		hex3[0]     
set_location_assignment PIN_AA25	-to		hex3[1]    
set_location_assignment PIN_AA26	-to		hex3[2]     
set_location_assignment PIN_Y26		-to		hex3[3]     
set_location_assignment PIN_Y25		-to		hex3[4]     
set_location_assignment PIN_U22		-to		hex3[5]     
set_location_assignment PIN_W24		-to		hex3[6]     

set_location_assignment PIN_U9		-to		hex4[0]     
set_location_assignment PIN_U1		-to		hex4[1]    
set_location_assignment PIN_U2		-to		hex4[2]     
set_location_assignment PIN_T4		-to		hex4[3]     
set_location_assignment PIN_R7		-to		hex4[4]     
set_location_assignment PIN_R6		-to		hex4[5]     
set_location_assignment PIN_T3		-to		hex4[6]     

set_location_assignment PIN_T2		-to		hex5[0]     
set_location_assignment PIN_P6		-to		hex5[1]    
set_location_assignment PIN_P7		-to		hex5[2]     
set_location_assignment PIN_T9		-to		hex5[3]     
set_location_assignment PIN_R5		-to		hex5[4]     
set_location_assignment PIN_R4		-to		hex5[5]     
set_location_assignment PIN_R3		-to		hex5[6]     

set_location_assignment PIN_R2		-to		hex6[0]     
set_location_assignment PIN_P4		-to		hex6[1]    
set_location_assignment PIN_P3		-to		hex6[2]     
set_location_assignment PIN_M2		-to		hex6[3]     
set_location_assignment PIN_M3		-to		hex6[4]     
set_location_assignment PIN_M5		-to		hex6[5]     
set_location_assignment PIN_M4		-to		hex6[6]     

set_location_assignment PIN_L3		-to		hex7[0]     
set_location_assignment PIN_L2		-to		hex7[1]    
set_location_assignment PIN_L9		-to		hex7[2]     
set_location_assignment PIN_L6		-to		hex7[3]     
set_location_assignment PIN_L7		-to		hex7[4]     
set_location_assignment PIN_P9		-to		hex7[5]     
set_location_assignment PIN_N9		-to		hex7[6]     

# 1602 LCD
set_location_assignment PIN_K4 -to LCD_RW
set_location_assignment PIN_K3 -to LCD_EN
set_location_assignment PIN_K1 -to LCD_RS
set_location_assignment PIN_J1 -to LCD_DATA[0]
set_location_assignment PIN_J2 -to LCD_DATA[1]
set_location_assignment PIN_H1 -to LCD_DATA[2]
set_location_assignment PIN_H2 -to LCD_DATA[3]
set_location_assignment PIN_J4 -to LCD_DATA[4]
set_location_assignment PIN_J3 -to LCD_DATA[5]
set_location_assignment PIN_H4 -to LCD_DATA[6]
set_location_assignment PIN_H3 -to LCD_DATA[7]
set_location_assignment PIN_L4 -to LCD_ON
set_location_assignment PIN_K2 -to LCD_BLON

# VGA
set_location_assignment PIN_C8	-to r[0]
set_location_assignment PIN_F10	-to r[1]
set_location_assignment PIN_G10	-to r[2]
set_location_assignment PIN_D9	-to r[3]
set_location_assignment PIN_C9	-to r[4]
set_location_assignment PIN_A8	-to r[5]
set_location_assignment PIN_H11	-to r[6]
set_location_assignment PIN_H12	-to r[7]
set_location_assignment PIN_F11	-to r[8]
set_location_assignment PIN_E10	-to r[9]
set_location_assignment PIN_B9	-to g[0]
set_location_assignment PIN_A9	-to g[1]
set_location_assignment PIN_C10 -to g[2]
set_location_assignment PIN_D10 -to g[3]
set_location_assignment PIN_B10 -to g[4]
set_location_assignment PIN_A10 -to g[5]
set_location_assignment PIN_G11 -to g[6]
set_location_assignment PIN_D11 -to g[7]
set_location_assignment PIN_E12 -to g[8]
set_location_assignment PIN_D12 -to g[9]
set_location_assignment PIN_J13 -to b[0]
set_location_assignment PIN_J14 -to b[1]
set_location_assignment PIN_F12 -to b[2]
set_location_assignment PIN_G12 -to b[3]
set_location_assignment PIN_J10 -to b[4]
set_location_assignment PIN_J11 -to b[5]
set_location_assignment PIN_C11 -to b[6]
set_location_assignment PIN_B11 -to b[7]
set_location_assignment PIN_C12 -to b[8]
set_location_assignment PIN_B12 -to b[9]
set_location_assignment PIN_A7	-to hsync
set_location_assignment PIN_D8	-to vsync
set_location_assignment PIN_B8	-to VGA_CLK
set_location_assignment PIN_D6	-to VGA_BLANK
set_location_assignment PIN_B7	-to VGA_SYNC


