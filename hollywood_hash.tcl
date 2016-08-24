# qsys scripting (.tcl) file for hollywood_hash
package require -exact qsys 16.0

create_system {hollywood_hash}

set_project_property DEVICE_FAMILY {MAX 10}
set_project_property DEVICE {10M50DAF484C6GES}
set_project_property HIDE_FROM_IP_CATALOG {false}

# Instances and instance parameters
# (disabled instances are intentionally culled)
add_instance clk_50 altera_clock_bridge 16.0
set_instance_parameter_value clk_50 {EXPLICIT_CLOCK_RATE} {50.0}
set_instance_parameter_value clk_50 {NUM_CLOCK_OUTPUTS} {1}

add_instance jtag_uart altera_avalon_jtag_uart 16.0
set_instance_parameter_value jtag_uart {allowMultipleConnections} {0}
set_instance_parameter_value jtag_uart {hubInstanceID} {0}
set_instance_parameter_value jtag_uart {readBufferDepth} {64}
set_instance_parameter_value jtag_uart {readIRQThreshold} {8}
set_instance_parameter_value jtag_uart {simInputCharacterStream} {}
set_instance_parameter_value jtag_uart {simInteractiveOptions} {INTERACTIVE_ASCII_OUTPUT}
set_instance_parameter_value jtag_uart {useRegistersForReadBuffer} {0}
set_instance_parameter_value jtag_uart {useRegistersForWriteBuffer} {0}
set_instance_parameter_value jtag_uart {useRelativePathForSimFile} {0}
set_instance_parameter_value jtag_uart {writeBufferDepth} {64}
set_instance_parameter_value jtag_uart {writeIRQThreshold} {8}

add_instance leds altera_avalon_pio 16.0
set_instance_parameter_value leds {bitClearingEdgeCapReg} {0}
set_instance_parameter_value leds {bitModifyingOutReg} {0}
set_instance_parameter_value leds {captureEdge} {0}
set_instance_parameter_value leds {direction} {Output}
set_instance_parameter_value leds {edgeType} {RISING}
set_instance_parameter_value leds {generateIRQ} {0}
set_instance_parameter_value leds {irqType} {LEVEL}
set_instance_parameter_value leds {resetValue} {0.0}
set_instance_parameter_value leds {simDoTestBenchWiring} {0}
set_instance_parameter_value leds {simDrivenValue} {0.0}
set_instance_parameter_value leds {width} {5}

add_instance mem altera_avalon_onchip_memory2 16.0
set_instance_parameter_value mem {allowInSystemMemoryContentEditor} {0}
set_instance_parameter_value mem {blockType} {AUTO}
set_instance_parameter_value mem {dataWidth} {32}
set_instance_parameter_value mem {dataWidth2} {32}
set_instance_parameter_value mem {dualPort} {0}
set_instance_parameter_value mem {enableDiffWidth} {0}
set_instance_parameter_value mem {initMemContent} {1}
set_instance_parameter_value mem {initializationFileName} {onchip_mem.hex}
set_instance_parameter_value mem {instanceID} {NONE}
set_instance_parameter_value mem {memorySize} {65536.0}
set_instance_parameter_value mem {readDuringWriteMode} {DONT_CARE}
set_instance_parameter_value mem {simAllowMRAMContentsFile} {0}
set_instance_parameter_value mem {simMemInitOnlyFilename} {0}
set_instance_parameter_value mem {singleClockOperation} {0}
set_instance_parameter_value mem {slave1Latency} {1}
set_instance_parameter_value mem {slave2Latency} {1}
set_instance_parameter_value mem {useNonDefaultInitFile} {0}
set_instance_parameter_value mem {copyInitFile} {0}
set_instance_parameter_value mem {useShallowMemBlocks} {0}
set_instance_parameter_value mem {writable} {1}
set_instance_parameter_value mem {ecc_enabled} {0}
set_instance_parameter_value mem {resetrequest_enabled} {1}

add_instance nios2 altera_nios2_gen2 16.0
set_instance_parameter_value nios2 {tmr_enabled} {0}
set_instance_parameter_value nios2 {setting_disable_tmr_inj} {0}
set_instance_parameter_value nios2 {setting_showUnpublishedSettings} {0}
set_instance_parameter_value nios2 {setting_showInternalSettings} {0}
set_instance_parameter_value nios2 {setting_preciseIllegalMemAccessException} {0}
set_instance_parameter_value nios2 {setting_exportPCB} {0}
set_instance_parameter_value nios2 {setting_exportdebuginfo} {0}
set_instance_parameter_value nios2 {setting_clearXBitsLDNonBypass} {1}
set_instance_parameter_value nios2 {setting_bigEndian} {0}
set_instance_parameter_value nios2 {setting_export_large_RAMs} {0}
set_instance_parameter_value nios2 {setting_asic_enabled} {0}
set_instance_parameter_value nios2 {setting_asic_synopsys_translate_on_off} {0}
set_instance_parameter_value nios2 {setting_asic_third_party_synthesis} {0}
set_instance_parameter_value nios2 {setting_asic_add_scan_mode_input} {0}
set_instance_parameter_value nios2 {setting_oci_version} {1}
set_instance_parameter_value nios2 {setting_fast_register_read} {0}
set_instance_parameter_value nios2 {setting_exportHostDebugPort} {0}
set_instance_parameter_value nios2 {setting_oci_export_jtag_signals} {0}
set_instance_parameter_value nios2 {setting_avalonDebugPortPresent} {0}
set_instance_parameter_value nios2 {setting_alwaysEncrypt} {1}
set_instance_parameter_value nios2 {io_regionbase} {0}
set_instance_parameter_value nios2 {io_regionsize} {0}
set_instance_parameter_value nios2 {setting_support31bitdcachebypass} {1}
set_instance_parameter_value nios2 {setting_activateTrace} {0}
set_instance_parameter_value nios2 {setting_allow_break_inst} {0}
set_instance_parameter_value nios2 {setting_activateTestEndChecker} {0}
set_instance_parameter_value nios2 {setting_ecc_sim_test_ports} {0}
set_instance_parameter_value nios2 {setting_disableocitrace} {0}
set_instance_parameter_value nios2 {setting_activateMonitors} {1}
set_instance_parameter_value nios2 {setting_HDLSimCachesCleared} {1}
set_instance_parameter_value nios2 {setting_HBreakTest} {0}
set_instance_parameter_value nios2 {setting_breakslaveoveride} {0}
set_instance_parameter_value nios2 {mpu_useLimit} {0}
set_instance_parameter_value nios2 {mpu_enabled} {0}
set_instance_parameter_value nios2 {mmu_enabled} {0}
set_instance_parameter_value nios2 {mmu_autoAssignTlbPtrSz} {1}
set_instance_parameter_value nios2 {cpuReset} {0}
set_instance_parameter_value nios2 {resetrequest_enabled} {1}
set_instance_parameter_value nios2 {setting_removeRAMinit} {0}
set_instance_parameter_value nios2 {setting_tmr_output_disable} {0}
set_instance_parameter_value nios2 {setting_shadowRegisterSets} {0}
set_instance_parameter_value nios2 {mpu_numOfInstRegion} {8}
set_instance_parameter_value nios2 {mpu_numOfDataRegion} {8}
set_instance_parameter_value nios2 {mmu_TLBMissExcOffset} {0}
set_instance_parameter_value nios2 {resetOffset} {0}
set_instance_parameter_value nios2 {exceptionOffset} {32}
set_instance_parameter_value nios2 {cpuID} {0}
set_instance_parameter_value nios2 {breakOffset} {32}
set_instance_parameter_value nios2 {userDefinedSettings} {}
set_instance_parameter_value nios2 {tracefilename} {}
set_instance_parameter_value nios2 {resetSlave} {mem.s1}
set_instance_parameter_value nios2 {mmu_TLBMissExcSlave} {None}
set_instance_parameter_value nios2 {exceptionSlave} {mem.s1}
set_instance_parameter_value nios2 {breakSlave} {mem.s1}
set_instance_parameter_value nios2 {setting_interruptControllerType} {Internal}
set_instance_parameter_value nios2 {setting_branchpredictiontype} {Dynamic}
set_instance_parameter_value nios2 {setting_bhtPtrSz} {8}
set_instance_parameter_value nios2 {cpuArchRev} {1}
set_instance_parameter_value nios2 {mul_shift_choice} {0}
set_instance_parameter_value nios2 {mul_32_impl} {2}
set_instance_parameter_value nios2 {mul_64_impl} {1}
set_instance_parameter_value nios2 {shift_rot_impl} {1}
set_instance_parameter_value nios2 {dividerType} {srt2}
set_instance_parameter_value nios2 {mpu_minInstRegionSize} {12}
set_instance_parameter_value nios2 {mpu_minDataRegionSize} {12}
set_instance_parameter_value nios2 {mmu_uitlbNumEntries} {4}
set_instance_parameter_value nios2 {mmu_udtlbNumEntries} {6}
set_instance_parameter_value nios2 {mmu_tlbPtrSz} {7}
set_instance_parameter_value nios2 {mmu_tlbNumWays} {16}
set_instance_parameter_value nios2 {mmu_processIDNumBits} {8}
set_instance_parameter_value nios2 {impl} {Tiny}
set_instance_parameter_value nios2 {icache_size} {16384}
set_instance_parameter_value nios2 {fa_cache_line} {2}
set_instance_parameter_value nios2 {fa_cache_linesize} {0}
set_instance_parameter_value nios2 {icache_tagramBlockType} {Automatic}
set_instance_parameter_value nios2 {icache_ramBlockType} {Automatic}
set_instance_parameter_value nios2 {icache_numTCIM} {0}
set_instance_parameter_value nios2 {icache_burstType} {Sequential}
set_instance_parameter_value nios2 {dcache_bursts} {true}
set_instance_parameter_value nios2 {dcache_victim_buf_impl} {ram}
set_instance_parameter_value nios2 {dcache_size} {4096}
set_instance_parameter_value nios2 {dcache_tagramBlockType} {Automatic}
set_instance_parameter_value nios2 {dcache_ramBlockType} {Automatic}
set_instance_parameter_value nios2 {dcache_numTCDM} {0}
set_instance_parameter_value nios2 {setting_exportvectors} {0}
set_instance_parameter_value nios2 {setting_usedesignware} {0}
set_instance_parameter_value nios2 {setting_ecc_present} {0}
set_instance_parameter_value nios2 {setting_ic_ecc_present} {1}
set_instance_parameter_value nios2 {setting_rf_ecc_present} {1}
set_instance_parameter_value nios2 {setting_mmu_ecc_present} {1}
set_instance_parameter_value nios2 {setting_dc_ecc_present} {1}
set_instance_parameter_value nios2 {setting_itcm_ecc_present} {1}
set_instance_parameter_value nios2 {setting_dtcm_ecc_present} {1}
set_instance_parameter_value nios2 {regfile_ramBlockType} {Automatic}
set_instance_parameter_value nios2 {ocimem_ramBlockType} {Automatic}
set_instance_parameter_value nios2 {ocimem_ramInit} {0}
set_instance_parameter_value nios2 {mmu_ramBlockType} {Automatic}
set_instance_parameter_value nios2 {bht_ramBlockType} {Automatic}
set_instance_parameter_value nios2 {cdx_enabled} {0}
set_instance_parameter_value nios2 {mpx_enabled} {0}
set_instance_parameter_value nios2 {debug_enabled} {1}
set_instance_parameter_value nios2 {debug_triggerArming} {1}
set_instance_parameter_value nios2 {debug_debugReqSignals} {0}
set_instance_parameter_value nios2 {debug_assignJtagInstanceID} {0}
set_instance_parameter_value nios2 {debug_jtagInstanceID} {0}
set_instance_parameter_value nios2 {debug_OCIOnchipTrace} {_128}
set_instance_parameter_value nios2 {debug_hwbreakpoint} {0}
set_instance_parameter_value nios2 {debug_datatrigger} {0}
set_instance_parameter_value nios2 {debug_traceType} {none}
set_instance_parameter_value nios2 {debug_traceStorage} {onchip_trace}
set_instance_parameter_value nios2 {master_addr_map} {0}
set_instance_parameter_value nios2 {instruction_master_paddr_base} {0}
set_instance_parameter_value nios2 {instruction_master_paddr_size} {0.0}
set_instance_parameter_value nios2 {flash_instruction_master_paddr_base} {0}
set_instance_parameter_value nios2 {flash_instruction_master_paddr_size} {0.0}
set_instance_parameter_value nios2 {data_master_paddr_base} {0}
set_instance_parameter_value nios2 {data_master_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_0_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_0_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_1_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_1_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_2_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_2_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_3_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_instruction_master_3_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_0_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_0_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_1_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_1_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_2_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_2_paddr_size} {0.0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_3_paddr_base} {0}
set_instance_parameter_value nios2 {tightly_coupled_data_master_3_paddr_size} {0.0}
set_instance_parameter_value nios2 {instruction_master_high_performance_paddr_base} {0}
set_instance_parameter_value nios2 {instruction_master_high_performance_paddr_size} {0.0}
set_instance_parameter_value nios2 {data_master_high_performance_paddr_base} {0}
set_instance_parameter_value nios2 {data_master_high_performance_paddr_size} {0.0}

add_instance pll altpll 16.0
set_instance_parameter_value pll {HIDDEN_CUSTOM_ELABORATION} {altpll_avalon_elaboration}
set_instance_parameter_value pll {HIDDEN_CUSTOM_POST_EDIT} {altpll_avalon_post_edit}
set_instance_parameter_value pll {INTENDED_DEVICE_FAMILY} {MAX 10}
set_instance_parameter_value pll {WIDTH_CLOCK} {5}
set_instance_parameter_value pll {WIDTH_PHASECOUNTERSELECT} {}
set_instance_parameter_value pll {PRIMARY_CLOCK} {}
set_instance_parameter_value pll {INCLK0_INPUT_FREQUENCY} {20000}
set_instance_parameter_value pll {INCLK1_INPUT_FREQUENCY} {}
set_instance_parameter_value pll {OPERATION_MODE} {NORMAL}
set_instance_parameter_value pll {PLL_TYPE} {AUTO}
set_instance_parameter_value pll {QUALIFY_CONF_DONE} {}
set_instance_parameter_value pll {COMPENSATE_CLOCK} {CLK0}
set_instance_parameter_value pll {SCAN_CHAIN} {}
set_instance_parameter_value pll {GATE_LOCK_SIGNAL} {}
set_instance_parameter_value pll {GATE_LOCK_COUNTER} {}
set_instance_parameter_value pll {LOCK_HIGH} {}
set_instance_parameter_value pll {LOCK_LOW} {}
set_instance_parameter_value pll {VALID_LOCK_MULTIPLIER} {}
set_instance_parameter_value pll {INVALID_LOCK_MULTIPLIER} {}
set_instance_parameter_value pll {SWITCH_OVER_ON_LOSSCLK} {}
set_instance_parameter_value pll {SWITCH_OVER_ON_GATED_LOCK} {}
set_instance_parameter_value pll {ENABLE_SWITCH_OVER_COUNTER} {}
set_instance_parameter_value pll {SKIP_VCO} {}
set_instance_parameter_value pll {SWITCH_OVER_COUNTER} {}
set_instance_parameter_value pll {SWITCH_OVER_TYPE} {}
set_instance_parameter_value pll {FEEDBACK_SOURCE} {}
set_instance_parameter_value pll {BANDWIDTH} {}
set_instance_parameter_value pll {BANDWIDTH_TYPE} {AUTO}
set_instance_parameter_value pll {SPREAD_FREQUENCY} {}
set_instance_parameter_value pll {DOWN_SPREAD} {}
set_instance_parameter_value pll {SELF_RESET_ON_GATED_LOSS_LOCK} {}
set_instance_parameter_value pll {SELF_RESET_ON_LOSS_LOCK} {}
set_instance_parameter_value pll {CLK0_MULTIPLY_BY} {1}
set_instance_parameter_value pll {CLK1_MULTIPLY_BY} {1}
set_instance_parameter_value pll {CLK2_MULTIPLY_BY} {2}
set_instance_parameter_value pll {CLK3_MULTIPLY_BY} {6}
set_instance_parameter_value pll {CLK4_MULTIPLY_BY} {2}
set_instance_parameter_value pll {CLK5_MULTIPLY_BY} {}
set_instance_parameter_value pll {CLK6_MULTIPLY_BY} {}
set_instance_parameter_value pll {CLK7_MULTIPLY_BY} {}
set_instance_parameter_value pll {CLK8_MULTIPLY_BY} {}
set_instance_parameter_value pll {CLK9_MULTIPLY_BY} {}
set_instance_parameter_value pll {EXTCLK0_MULTIPLY_BY} {}
set_instance_parameter_value pll {EXTCLK1_MULTIPLY_BY} {}
set_instance_parameter_value pll {EXTCLK2_MULTIPLY_BY} {}
set_instance_parameter_value pll {EXTCLK3_MULTIPLY_BY} {}
set_instance_parameter_value pll {CLK0_DIVIDE_BY} {5}
set_instance_parameter_value pll {CLK1_DIVIDE_BY} {1}
set_instance_parameter_value pll {CLK2_DIVIDE_BY} {1}
set_instance_parameter_value pll {CLK3_DIVIDE_BY} {1}
set_instance_parameter_value pll {CLK4_DIVIDE_BY} {5}
set_instance_parameter_value pll {CLK5_DIVIDE_BY} {}
set_instance_parameter_value pll {CLK6_DIVIDE_BY} {}
set_instance_parameter_value pll {CLK7_DIVIDE_BY} {}
set_instance_parameter_value pll {CLK8_DIVIDE_BY} {}
set_instance_parameter_value pll {CLK9_DIVIDE_BY} {}
set_instance_parameter_value pll {EXTCLK0_DIVIDE_BY} {}
set_instance_parameter_value pll {EXTCLK1_DIVIDE_BY} {}
set_instance_parameter_value pll {EXTCLK2_DIVIDE_BY} {}
set_instance_parameter_value pll {EXTCLK3_DIVIDE_BY} {}
set_instance_parameter_value pll {CLK0_PHASE_SHIFT} {0}
set_instance_parameter_value pll {CLK1_PHASE_SHIFT} {0}
set_instance_parameter_value pll {CLK2_PHASE_SHIFT} {0}
set_instance_parameter_value pll {CLK3_PHASE_SHIFT} {0}
set_instance_parameter_value pll {CLK4_PHASE_SHIFT} {5000}
set_instance_parameter_value pll {CLK5_PHASE_SHIFT} {}
set_instance_parameter_value pll {CLK6_PHASE_SHIFT} {}
set_instance_parameter_value pll {CLK7_PHASE_SHIFT} {}
set_instance_parameter_value pll {CLK8_PHASE_SHIFT} {}
set_instance_parameter_value pll {CLK9_PHASE_SHIFT} {}
set_instance_parameter_value pll {EXTCLK0_PHASE_SHIFT} {}
set_instance_parameter_value pll {EXTCLK1_PHASE_SHIFT} {}
set_instance_parameter_value pll {EXTCLK2_PHASE_SHIFT} {}
set_instance_parameter_value pll {EXTCLK3_PHASE_SHIFT} {}
set_instance_parameter_value pll {CLK0_DUTY_CYCLE} {50}
set_instance_parameter_value pll {CLK1_DUTY_CYCLE} {50}
set_instance_parameter_value pll {CLK2_DUTY_CYCLE} {50}
set_instance_parameter_value pll {CLK3_DUTY_CYCLE} {50}
set_instance_parameter_value pll {CLK4_DUTY_CYCLE} {50}
set_instance_parameter_value pll {CLK5_DUTY_CYCLE} {}
set_instance_parameter_value pll {CLK6_DUTY_CYCLE} {}
set_instance_parameter_value pll {CLK7_DUTY_CYCLE} {}
set_instance_parameter_value pll {CLK8_DUTY_CYCLE} {}
set_instance_parameter_value pll {CLK9_DUTY_CYCLE} {}
set_instance_parameter_value pll {EXTCLK0_DUTY_CYCLE} {}
set_instance_parameter_value pll {EXTCLK1_DUTY_CYCLE} {}
set_instance_parameter_value pll {EXTCLK2_DUTY_CYCLE} {}
set_instance_parameter_value pll {EXTCLK3_DUTY_CYCLE} {}
set_instance_parameter_value pll {PORT_clkena0} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clkena1} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clkena2} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clkena3} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clkena4} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clkena5} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_extclkena0} {}
set_instance_parameter_value pll {PORT_extclkena1} {}
set_instance_parameter_value pll {PORT_extclkena2} {}
set_instance_parameter_value pll {PORT_extclkena3} {}
set_instance_parameter_value pll {PORT_extclk0} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_extclk1} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_extclk2} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_extclk3} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_CLKBAD0} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_CLKBAD1} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clk0} {PORT_USED}
set_instance_parameter_value pll {PORT_clk1} {PORT_USED}
set_instance_parameter_value pll {PORT_clk2} {PORT_USED}
set_instance_parameter_value pll {PORT_clk3} {PORT_USED}
set_instance_parameter_value pll {PORT_clk4} {PORT_USED}
set_instance_parameter_value pll {PORT_clk5} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_clk6} {}
set_instance_parameter_value pll {PORT_clk7} {}
set_instance_parameter_value pll {PORT_clk8} {}
set_instance_parameter_value pll {PORT_clk9} {}
set_instance_parameter_value pll {PORT_SCANDATA} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANDATAOUT} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANDONE} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCLKOUT1} {}
set_instance_parameter_value pll {PORT_SCLKOUT0} {}
set_instance_parameter_value pll {PORT_ACTIVECLOCK} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_CLKLOSS} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_INCLK1} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_INCLK0} {PORT_USED}
set_instance_parameter_value pll {PORT_FBIN} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_PLLENA} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_CLKSWITCH} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_ARESET} {PORT_USED}
set_instance_parameter_value pll {PORT_PFDENA} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANCLK} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANACLR} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANREAD} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANWRITE} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_ENABLE0} {}
set_instance_parameter_value pll {PORT_ENABLE1} {}
set_instance_parameter_value pll {PORT_LOCKED} {PORT_USED}
set_instance_parameter_value pll {PORT_CONFIGUPDATE} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_FBOUT} {}
set_instance_parameter_value pll {PORT_PHASEDONE} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_PHASESTEP} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_PHASEUPDOWN} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_SCANCLKENA} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_PHASECOUNTERSELECT} {PORT_UNUSED}
set_instance_parameter_value pll {PORT_VCOOVERRANGE} {}
set_instance_parameter_value pll {PORT_VCOUNDERRANGE} {}
set_instance_parameter_value pll {DPA_MULTIPLY_BY} {}
set_instance_parameter_value pll {DPA_DIVIDE_BY} {}
set_instance_parameter_value pll {DPA_DIVIDER} {}
set_instance_parameter_value pll {VCO_MULTIPLY_BY} {}
set_instance_parameter_value pll {VCO_DIVIDE_BY} {}
set_instance_parameter_value pll {SCLKOUT0_PHASE_SHIFT} {}
set_instance_parameter_value pll {SCLKOUT1_PHASE_SHIFT} {}
set_instance_parameter_value pll {VCO_FREQUENCY_CONTROL} {}
set_instance_parameter_value pll {VCO_PHASE_SHIFT_STEP} {}
set_instance_parameter_value pll {USING_FBMIMICBIDIR_PORT} {}
set_instance_parameter_value pll {SCAN_CHAIN_MIF_FILE} {}
set_instance_parameter_value pll {AVALON_USE_SEPARATE_SYSCLK} {NO}
set_instance_parameter_value pll {HIDDEN_CONSTANTS} {CT#CLK2_DIVIDE_BY 1 CT#PORT_clk5 PORT_UNUSED CT#PORT_clk4 PORT_USED CT#PORT_clk3 PORT_USED CT#PORT_clk2 PORT_USED CT#PORT_clk1 PORT_USED CT#PORT_clk0 PORT_USED CT#CLK0_MULTIPLY_BY 1 CT#PORT_SCANWRITE PORT_UNUSED CT#PORT_SCANACLR PORT_UNUSED CT#PORT_PFDENA PORT_UNUSED CT#CLK3_DUTY_CYCLE 50 CT#CLK3_DIVIDE_BY 1 CT#PORT_PLLENA PORT_UNUSED CT#PORT_SCANDATA PORT_UNUSED CT#CLK3_PHASE_SHIFT 0 CT#PORT_SCANCLKENA PORT_UNUSED CT#CLK4_DIVIDE_BY 5 CT#WIDTH_CLOCK 5 CT#PORT_SCANDATAOUT PORT_UNUSED CT#CLK4_MULTIPLY_BY 2 CT#LPM_TYPE altpll CT#PLL_TYPE AUTO CT#CLK0_PHASE_SHIFT 0 CT#CLK1_DUTY_CYCLE 50 CT#PORT_PHASEDONE PORT_UNUSED CT#OPERATION_MODE NORMAL CT#PORT_CONFIGUPDATE PORT_UNUSED CT#CLK1_MULTIPLY_BY 1 CT#COMPENSATE_CLOCK CLK0 CT#PORT_CLKSWITCH PORT_UNUSED CT#CLK4_PHASE_SHIFT 5000 CT#INCLK0_INPUT_FREQUENCY 20000 CT#CLK4_DUTY_CYCLE 50 CT#PORT_SCANDONE PORT_UNUSED CT#PORT_CLKLOSS PORT_UNUSED CT#PORT_INCLK1 PORT_UNUSED CT#AVALON_USE_SEPARATE_SYSCLK NO CT#PORT_INCLK0 PORT_USED CT#PORT_clkena5 PORT_UNUSED CT#PORT_clkena4 PORT_UNUSED CT#PORT_clkena3 PORT_UNUSED CT#PORT_clkena2 PORT_UNUSED CT#PORT_clkena1 PORT_UNUSED CT#PORT_clkena0 PORT_UNUSED CT#CLK1_PHASE_SHIFT 0 CT#PORT_ARESET PORT_USED CT#BANDWIDTH_TYPE AUTO CT#CLK2_MULTIPLY_BY 2 CT#INTENDED_DEVICE_FAMILY {MAX 10} CT#PORT_SCANREAD PORT_UNUSED CT#CLK2_DUTY_CYCLE 50 CT#PORT_PHASESTEP PORT_UNUSED CT#PORT_SCANCLK PORT_UNUSED CT#PORT_CLKBAD1 PORT_UNUSED CT#PORT_CLKBAD0 PORT_UNUSED CT#PORT_FBIN PORT_UNUSED CT#PORT_PHASEUPDOWN PORT_UNUSED CT#PORT_extclk3 PORT_UNUSED CT#PORT_extclk2 PORT_UNUSED CT#PORT_extclk1 PORT_UNUSED CT#PORT_PHASECOUNTERSELECT PORT_UNUSED CT#PORT_extclk0 PORT_UNUSED CT#PORT_ACTIVECLOCK PORT_UNUSED CT#CLK2_PHASE_SHIFT 0 CT#CLK0_DUTY_CYCLE 50 CT#CLK0_DIVIDE_BY 5 CT#CLK1_DIVIDE_BY 1 CT#CLK3_MULTIPLY_BY 6 CT#PORT_LOCKED PORT_USED}
set_instance_parameter_value pll {HIDDEN_PRIVATES} {PT#GLOCKED_FEATURE_ENABLED 0 PT#SPREAD_FEATURE_ENABLED 0 PT#BANDWIDTH_FREQ_UNIT MHz PT#CUR_DEDICATED_CLK c0 PT#INCLK0_FREQ_EDIT 50.000 PT#BANDWIDTH_PRESET Low PT#PLL_LVDS_PLL_CHECK 0 PT#BANDWIDTH_USE_PRESET 0 PT#AVALON_USE_SEPARATE_SYSCLK NO PT#OUTPUT_FREQ_UNIT4 MHz PT#OUTPUT_FREQ_UNIT3 MHz PT#PLL_ENHPLL_CHECK 0 PT#OUTPUT_FREQ_UNIT2 MHz PT#OUTPUT_FREQ_UNIT1 MHz PT#OUTPUT_FREQ_UNIT0 MHz PT#PHASE_RECONFIG_FEATURE_ENABLED 1 PT#CREATE_CLKBAD_CHECK 0 PT#CLKSWITCH_CHECK 0 PT#INCLK1_FREQ_EDIT 100.000 PT#NORMAL_MODE_RADIO 1 PT#SRC_SYNCH_COMP_RADIO 0 PT#PLL_ARESET_CHECK 1 PT#LONG_SCAN_RADIO 1 PT#SCAN_FEATURE_ENABLED 1 PT#USE_CLK4 1 PT#USE_CLK3 1 PT#USE_CLK2 1 PT#PHASE_RECONFIG_INPUTS_CHECK 0 PT#USE_CLK1 1 PT#USE_CLK0 1 PT#PRIMARY_CLK_COMBO inclk0 PT#BANDWIDTH 1.000 PT#GLOCKED_COUNTER_EDIT_CHANGED 1 PT#PLL_FASTPLL_CHECK 0 PT#SPREAD_FREQ_UNIT KHz PT#LVDS_PHASE_SHIFT_UNIT4 deg PT#LVDS_PHASE_SHIFT_UNIT3 deg PT#PLL_AUTOPLL_CHECK 1 PT#OUTPUT_FREQ_MODE4 0 PT#LVDS_PHASE_SHIFT_UNIT2 deg PT#OUTPUT_FREQ_MODE3 1 PT#LVDS_PHASE_SHIFT_UNIT1 deg PT#OUTPUT_FREQ_MODE2 0 PT#LVDS_PHASE_SHIFT_UNIT0 deg PT#OUTPUT_FREQ_MODE1 0 PT#SWITCHOVER_FEATURE_ENABLED 0 PT#MIG_DEVICE_SPEED_GRADE Any PT#OUTPUT_FREQ_MODE0 0 PT#BANDWIDTH_FEATURE_ENABLED 1 PT#INCLK0_FREQ_UNIT_COMBO MHz PT#ZERO_DELAY_RADIO 0 PT#OUTPUT_FREQ4 100.00000000 PT#OUTPUT_FREQ3 300.00000000 PT#OUTPUT_FREQ2 100.00000000 PT#OUTPUT_FREQ1 100.00000000 PT#OUTPUT_FREQ0 100.00000000 PT#SHORT_SCAN_RADIO 0 PT#LVDS_MODE_DATA_RATE_DIRTY 0 PT#CUR_FBIN_CLK c0 PT#PLL_ADVANCED_PARAM_CHECK 0 PT#CLKBAD_SWITCHOVER_CHECK 0 PT#PHASE_SHIFT_STEP_ENABLED_CHECK 0 PT#DEVICE_SPEED_GRADE Any PT#PLL_FBMIMIC_CHECK 0 PT#LVDS_MODE_DATA_RATE {Not Available} PT#PHASE_SHIFT4 5.00000000 PT#LOCKED_OUTPUT_CHECK 1 PT#SPREAD_PERCENT 0.500 PT#PHASE_SHIFT3 0.00000000 PT#DIV_FACTOR4 5 PT#PHASE_SHIFT2 0.00000000 PT#DIV_FACTOR3 5 PT#PHASE_SHIFT1 0.00000000 PT#DIV_FACTOR2 1 PT#PHASE_SHIFT0 0.00000000 PT#DIV_FACTOR1 1 PT#DIV_FACTOR0 5 PT#CNX_NO_COMPENSATE_RADIO 0 PT#USE_CLKENA4 0 PT#USE_CLKENA3 0 PT#USE_CLKENA2 0 PT#USE_CLKENA1 0 PT#USE_CLKENA0 0 PT#CREATE_INCLK1_CHECK 0 PT#GLOCK_COUNTER_EDIT 1048575 PT#INCLK1_FREQ_UNIT_COMBO MHz PT#EFF_OUTPUT_FREQ_VALUE4 20.000000 PT#EFF_OUTPUT_FREQ_VALUE3 300.000000 PT#EFF_OUTPUT_FREQ_VALUE2 100.000000 PT#EFF_OUTPUT_FREQ_VALUE1 50.000000 PT#EFF_OUTPUT_FREQ_VALUE0 10.000000 PT#SPREAD_FREQ 50.000 PT#USE_MIL_SPEED_GRADE 0 PT#EXPLICIT_SWITCHOVER_COUNTER 0 PT#STICKY_CLK4 1 PT#STICKY_CLK3 1 PT#STICKY_CLK2 1 PT#STICKY_CLK1 1 PT#STICKY_CLK0 1 PT#MIRROR_CLK4 0 PT#EXT_FEEDBACK_RADIO 0 PT#MIRROR_CLK3 0 PT#MIRROR_CLK2 0 PT#MIRROR_CLK1 0 PT#SWITCHOVER_COUNT_EDIT 1 PT#MIRROR_CLK0 0 PT#SELF_RESET_LOCK_LOSS 0 PT#PLL_PFDENA_CHECK 0 PT#INT_FEEDBACK__MODE_RADIO 1 PT#INCLK1_FREQ_EDIT_CHANGED 1 PT#SYNTH_WRAPPER_GEN_POSTFIX 0 PT#CLKLOSS_CHECK 0 PT#PHASE_SHIFT_UNIT4 ns PT#PHASE_SHIFT_UNIT3 deg PT#PHASE_SHIFT_UNIT2 deg PT#PHASE_SHIFT_UNIT1 deg PT#PHASE_SHIFT_UNIT0 deg PT#BANDWIDTH_USE_AUTO 1 PT#HAS_MANUAL_SWITCHOVER 1 PT#MULT_FACTOR4 2 PT#MULT_FACTOR3 2 PT#MULT_FACTOR2 2 PT#MULT_FACTOR1 1 PT#MULT_FACTOR0 1 PT#SPREAD_USE 0 PT#GLOCKED_MODE_CHECK 0 PT#DUTY_CYCLE4 50.00000000 PT#DUTY_CYCLE3 50.00000000 PT#DUTY_CYCLE2 50.00000000 PT#SACN_INPUTS_CHECK 0 PT#DUTY_CYCLE1 50.00000000 PT#INTENDED_DEVICE_FAMILY {MAX 10} PT#DUTY_CYCLE0 50.00000000 PT#PLL_TARGET_HARCOPY_CHECK 0 PT#INCLK1_FREQ_UNIT_CHANGED 1 PT#RECONFIG_FILE ALTPLL1444820004477033.mif PT#ACTIVECLK_CHECK 0}
set_instance_parameter_value pll {HIDDEN_USED_PORTS} {UP#locked used UP#c4 used UP#c3 used UP#c2 used UP#c1 used UP#c0 used UP#areset used UP#inclk0 used}
set_instance_parameter_value pll {HIDDEN_IS_NUMERIC} {IN#WIDTH_CLOCK 1 IN#CLK0_DUTY_CYCLE 1 IN#CLK2_DIVIDE_BY 1 IN#PLL_TARGET_HARCOPY_CHECK 1 IN#CLK3_DIVIDE_BY 1 IN#CLK4_MULTIPLY_BY 1 IN#CLK1_MULTIPLY_BY 1 IN#CLK3_DUTY_CYCLE 1 IN#CLK4_DIVIDE_BY 1 IN#SWITCHOVER_COUNT_EDIT 1 IN#INCLK0_INPUT_FREQUENCY 1 IN#PLL_LVDS_PLL_CHECK 1 IN#PLL_AUTOPLL_CHECK 1 IN#PLL_FASTPLL_CHECK 1 IN#CLK1_DUTY_CYCLE 1 IN#PLL_ENHPLL_CHECK 1 IN#CLK2_MULTIPLY_BY 1 IN#DIV_FACTOR4 1 IN#DIV_FACTOR3 1 IN#DIV_FACTOR2 1 IN#DIV_FACTOR1 1 IN#DIV_FACTOR0 1 IN#LVDS_MODE_DATA_RATE_DIRTY 1 IN#CLK4_DUTY_CYCLE 1 IN#GLOCK_COUNTER_EDIT 1 IN#CLK2_DUTY_CYCLE 1 IN#CLK0_DIVIDE_BY 1 IN#CLK3_MULTIPLY_BY 1 IN#MULT_FACTOR4 1 IN#MULT_FACTOR3 1 IN#MULT_FACTOR2 1 IN#MULT_FACTOR1 1 IN#MULT_FACTOR0 1 IN#CLK0_MULTIPLY_BY 1 IN#USE_MIL_SPEED_GRADE 1 IN#CLK1_DIVIDE_BY 1}
set_instance_parameter_value pll {HIDDEN_MF_PORTS} {MF#areset 1 MF#clk 1 MF#locked 1 MF#inclk 1}
set_instance_parameter_value pll {HIDDEN_IF_PORTS} {IF#phasecounterselect {input 3} IF#locked {output 0} IF#reset {input 0} IF#clk {input 0} IF#phaseupdown {input 0} IF#readdata {output 32} IF#write {input 0} IF#scanclk {input 0} IF#phasedone {output 0} IF#c4 {output 0} IF#c3 {output 0} IF#address {input 2} IF#c2 {output 0} IF#c1 {output 0} IF#c0 {output 0} IF#writedata {input 32} IF#read {input 0} IF#areset {input 0} IF#phasestep {input 0}}
set_instance_parameter_value pll {HIDDEN_IS_FIRST_EDIT} {0}

add_instance reset_bridge_0 altera_reset_bridge 16.0
set_instance_parameter_value reset_bridge_0 {ACTIVE_LOW_RESET} {1}
set_instance_parameter_value reset_bridge_0 {SYNCHRONOUS_EDGES} {none}
set_instance_parameter_value reset_bridge_0 {NUM_RESET_OUTPUTS} {1}
set_instance_parameter_value reset_bridge_0 {USE_RESET_REQUEST} {0}

set num_engines 32
for {set i 0 } {$i < $num_engines} {incr i} {
  add_instance hollywood_hash_core_$i hollywood_hash_core 1.0
  set_instance_parameter_value hollywood_hash_core_$i {R4} {65201}
  set_instance_parameter_value hollywood_hash_core_$i {R6} {37528}

  add_instance pw_gen_$i pw_gen 1.0
  set_instance_parameter_value pw_gen_$i {PW1_RESET} {0}
  set_instance_parameter_value pw_gen_$i {PW2_RESET} {0}
  set_instance_parameter_value pw_gen_$i {PW3_RESET} [ expr {$i * (256 / $num_engines)} ]
  set_instance_parameter_value pw_gen_$i {PW3_FINAL} [ expr {-1 + ($i + 1) * (256 / $num_engines)} ]

  add_instance pw_mem_$i altera_avalon_onchip_memory2 16.0
  set_instance_parameter_value pw_mem_$i {allowInSystemMemoryContentEditor} {0}
  set_instance_parameter_value pw_mem_$i {blockType} {AUTO}
  set_instance_parameter_value pw_mem_$i {dataWidth} {16}
  set_instance_parameter_value pw_mem_$i {dataWidth2} {32}
  set_instance_parameter_value pw_mem_$i {dualPort} {1}
  set_instance_parameter_value pw_mem_$i {enableDiffWidth} {0}
  set_instance_parameter_value pw_mem_$i {initMemContent} {0}
  set_instance_parameter_value pw_mem_$i {initializationFileName} {onchip_mem.hex}
  set_instance_parameter_value pw_mem_$i {instanceID} {NONE}
  set_instance_parameter_value pw_mem_$i {memorySize} {64.0}
  set_instance_parameter_value pw_mem_$i {readDuringWriteMode} {DONT_CARE}
  set_instance_parameter_value pw_mem_$i {simAllowMRAMContentsFile} {0}
  set_instance_parameter_value pw_mem_$i {simMemInitOnlyFilename} {0}
  set_instance_parameter_value pw_mem_$i {singleClockOperation} {0}
  set_instance_parameter_value pw_mem_$i {slave1Latency} {2}
  set_instance_parameter_value pw_mem_$i {slave2Latency} {2}
  set_instance_parameter_value pw_mem_$i {useNonDefaultInitFile} {0}
  set_instance_parameter_value pw_mem_$i {copyInitFile} {0}
  set_instance_parameter_value pw_mem_$i {useShallowMemBlocks} {0}
  set_instance_parameter_value pw_mem_$i {writable} {1}
  set_instance_parameter_value pw_mem_$i {ecc_enabled} {0}
  set_instance_parameter_value pw_mem_$i {resetrequest_enabled} {1}

  add_connection nios2.data_master pw_gen_$i.csr
  set_connection_parameter_value nios2.data_master/pw_gen_$i.csr arbitrationPriority {1}
  set_connection_parameter_value nios2.data_master/pw_gen_$i.csr baseAddress [ expr {0x00020000 + 8 * $i}]
  set_connection_parameter_value nios2.data_master/pw_gen_$i.csr defaultConnection {0}

  add_connection nios2.data_master pw_mem_$i.s1
  set_connection_parameter_value nios2.data_master/pw_mem_$i.s1 arbitrationPriority {1}
  set_connection_parameter_value nios2.data_master/pw_mem_$i.s1 baseAddress [expr {0x00018040 + 0x40 * $i} ]
  set_connection_parameter_value nios2.data_master/pw_mem_$i.s1 defaultConnection {0}

  add_connection pw_gen_$i.store pw_mem_$i.s2
  set_connection_parameter_value pw_gen_$i.store/pw_mem_$i.s2 arbitrationPriority {1}
  set_connection_parameter_value pw_gen_$i.store/pw_mem_$i.s2 baseAddress {0x0000}
  set_connection_parameter_value pw_gen_$i.store/pw_mem_$i.s2 defaultConnection {0}

  add_connection pw_gen_$i.out hollywood_hash_core_$i.in
  add_connection hollywood_hash_core_$i.out pw_gen_$i.req

  add_connection pll.c2 pw_mem_$i.clk1
  add_connection pll.c3 pw_mem_$i.clk2

  add_connection pll.c3 hollywood_hash_core_$i.clock
  add_connection pll.c3 pw_gen_$i.clock

  add_connection reset_bridge_0.out_reset hollywood_hash_core_$i.reset
  add_connection reset_bridge_0.out_reset pw_gen_$i.reset

  add_connection reset_bridge_0.out_reset pw_mem_$i.reset1
  add_connection reset_bridge_0.out_reset pw_mem_$i.reset2

}

add_instance sysid_0 altera_avalon_sysid_qsys 16.0
set_instance_parameter_value sysid_0 {id} {-21917032}

# exported interfaces
add_interface clk_50_in clock sink
set_interface_property clk_50_in EXPORT_OF clk_50.in_clk
add_interface leds conduit end
set_interface_property leds EXPORT_OF leds.external_connection
add_interface pll_areset_conduit conduit end
set_interface_property pll_areset_conduit EXPORT_OF pll.areset_conduit
add_interface pll_locked_conduit conduit end
set_interface_property pll_locked_conduit EXPORT_OF pll.locked_conduit
add_interface reset_bridge_0_in_reset reset sink
set_interface_property reset_bridge_0_in_reset EXPORT_OF reset_bridge_0.in_reset

# connections and connection parameters
add_connection nios2.data_master jtag_uart.avalon_jtag_slave
set_connection_parameter_value nios2.data_master/jtag_uart.avalon_jtag_slave arbitrationPriority {1}
set_connection_parameter_value nios2.data_master/jtag_uart.avalon_jtag_slave baseAddress {0x00018030}
set_connection_parameter_value nios2.data_master/jtag_uart.avalon_jtag_slave defaultConnection {0}

add_connection nios2.data_master sysid_0.control_slave
set_connection_parameter_value nios2.data_master/sysid_0.control_slave arbitrationPriority {1}
set_connection_parameter_value nios2.data_master/sysid_0.control_slave baseAddress {0x00018010}
set_connection_parameter_value nios2.data_master/sysid_0.control_slave defaultConnection {0}

add_connection nios2.data_master nios2.debug_mem_slave
set_connection_parameter_value nios2.data_master/nios2.debug_mem_slave arbitrationPriority {1}
set_connection_parameter_value nios2.data_master/nios2.debug_mem_slave baseAddress {0x00010000}
set_connection_parameter_value nios2.data_master/nios2.debug_mem_slave defaultConnection {0}

add_connection nios2.data_master pll.pll_slave
set_connection_parameter_value nios2.data_master/pll.pll_slave arbitrationPriority {1}
set_connection_parameter_value nios2.data_master/pll.pll_slave baseAddress {0x00018020}
set_connection_parameter_value nios2.data_master/pll.pll_slave defaultConnection {0}

add_connection nios2.data_master mem.s1
set_connection_parameter_value nios2.data_master/mem.s1 arbitrationPriority {1}
set_connection_parameter_value nios2.data_master/mem.s1 baseAddress {0x0000}
set_connection_parameter_value nios2.data_master/mem.s1 defaultConnection {0}

add_connection nios2.data_master leds.s1
set_connection_parameter_value nios2.data_master/leds.s1 arbitrationPriority {1}
set_connection_parameter_value nios2.data_master/leds.s1 baseAddress {0x00018000}
set_connection_parameter_value nios2.data_master/leds.s1 defaultConnection {0}

add_connection nios2.instruction_master nios2.debug_mem_slave
set_connection_parameter_value nios2.instruction_master/nios2.debug_mem_slave arbitrationPriority {1}
set_connection_parameter_value nios2.instruction_master/nios2.debug_mem_slave baseAddress {0x00010000}
set_connection_parameter_value nios2.instruction_master/nios2.debug_mem_slave defaultConnection {0}

add_connection nios2.instruction_master mem.s1
set_connection_parameter_value nios2.instruction_master/mem.s1 arbitrationPriority {1}
set_connection_parameter_value nios2.instruction_master/mem.s1 baseAddress {0x0000}
set_connection_parameter_value nios2.instruction_master/mem.s1 defaultConnection {0}

add_connection pll.c2 nios2.clk

add_connection pll.c2 sysid_0.clk

add_connection pll.c2 jtag_uart.clk

add_connection pll.c2 leds.clk

add_connection pll.c2 mem.clk1

add_connection clk_50.out_clk pll.inclk_interface

add_connection nios2.irq jtag_uart.irq
set_connection_parameter_value nios2.irq/jtag_uart.irq irqNumber {0}

add_connection reset_bridge_0.out_reset pll.inclk_interface_reset

add_connection reset_bridge_0.out_reset jtag_uart.reset

add_connection reset_bridge_0.out_reset sysid_0.reset

add_connection reset_bridge_0.out_reset nios2.reset

add_connection reset_bridge_0.out_reset leds.reset

add_connection reset_bridge_0.out_reset mem.reset1


# interconnect requirements
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}

save_system {hollywood_hash.qsys}

