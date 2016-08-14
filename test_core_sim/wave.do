onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {clk, reset}
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst_clk_bfm/clk
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst_reset_bfm/reset
add wave -noupdate -divider in
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst/in_data
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst/in_channel
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst/in_valid
add wave -noupdate -divider out
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst/out_valid
add wave -noupdate -divider internals
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst/hollywood_hash_core_0/r4
add wave -noupdate -radix hexadecimal /sim_top/tb/test_core_inst/hollywood_hash_core_0/r6
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1185484 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 268
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
WaveRestoreZoom {763258 ps} {1465722 ps}
