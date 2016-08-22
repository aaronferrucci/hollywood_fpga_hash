onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {clk, reset}
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_clock_bfm_clk_clk
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_reset_bfm_reset_reset
add wave -noupdate -divider csr
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_csr_bfm/avm_waitrequest
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_csr_bfm/avm_readdata
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_csr_bfm/avm_write
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_csr_bfm/avm_read
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_csr_bfm/avm_address
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst_csr_bfm/avm_writedata
add wave -noupdate -divider out
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/out_channel
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/out_data
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/out_valid
add wave -noupdate -divider req
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/req_valid
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/req_data
add wave -noupdate -divider store
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/store_write
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/store_address
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/store_writedata
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/store_waitrequest
add wave -noupdate -divider internals
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/pw1
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/pw2
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/pw3
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/state
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/p1_state
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/pw1_overflow
add wave -noupdate -radix hexadecimal /sim_top/tb/test_pw_gen_inst/pw_gen_0/pw2_overflow
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1185484 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 329
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
WaveRestoreZoom {0 ps} {225507555 ns}
