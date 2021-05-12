onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/clk
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/RSTn
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/key_pluse
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_CS
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_RS
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_WR
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_RD
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_RST
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_DATA
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_BLK
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/IRQ
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/key_interrupt
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/HADDR
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/HTRANS
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/HWDATA
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/HWRITE
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/HRDATA
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/HREADY
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/cpuresetn
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/HSEL
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/LCD_rstn
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/LCD_en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/ini_en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/color_en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/set_sc
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/set_ec
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/set_sp
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/set_ep
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/write_en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/wr_en_reg
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD_Interface/addr_reg
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/rstn
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/lcd_rstn
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/ini_en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/color_en
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/set_sc
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/set_ec
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/set_sp
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/set_ep
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/data_trans
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/addr_or_data
add wave -noupdate /Cortex_M0_tst/CortexM0_SoC/LCD/wr_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3827 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 323
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {2537 ps} {6404 ps}
