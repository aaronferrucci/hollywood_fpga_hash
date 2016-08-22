# TCL File Generated by Component Editor 16.0
# Sun Aug 21 11:14:05 PDT 2016
# DO NOT MODIFY


# 
# pw_gen "pw_gen" v1.0
# Aaron Ferrucci 2016.08.21.11:14:05
# Brute-force password generator
# 

# 
# request TCL package from ACDS 16.0
# 
package require -exact qsys 16.0


# 
# module pw_gen
# 
set_module_property DESCRIPTION "Brute-force password generator"
set_module_property NAME pw_gen
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Aaron Ferrucci"
set_module_property DISPLAY_NAME pw_gen
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL pw_gen
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file pw_gen.sv SYSTEM_VERILOG PATH pw_gen.sv TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL pw_gen
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file pw_gen.sv SYSTEM_VERILOG PATH pw_gen.sv


# 
# parameters
# 
add_parameter PW1_RESET INTEGER 0
set_parameter_property PW1_RESET DEFAULT_VALUE 0
set_parameter_property PW1_RESET DISPLAY_NAME PW1_RESET
set_parameter_property PW1_RESET TYPE INTEGER
set_parameter_property PW1_RESET UNITS None
set_parameter_property PW1_RESET ALLOWED_RANGES 0:65536
set_parameter_property PW1_RESET HDL_PARAMETER true
add_parameter PW2_RESET INTEGER 0
set_parameter_property PW2_RESET DEFAULT_VALUE 0
set_parameter_property PW2_RESET DISPLAY_NAME PW2_RESET
set_parameter_property PW2_RESET TYPE INTEGER
set_parameter_property PW2_RESET UNITS None
set_parameter_property PW2_RESET ALLOWED_RANGES 0:65536
set_parameter_property PW2_RESET HDL_PARAMETER true
add_parameter PW3_RESET INTEGER 0
set_parameter_property PW3_RESET DEFAULT_VALUE 0
set_parameter_property PW3_RESET DISPLAY_NAME PW3_RESET
set_parameter_property PW3_RESET TYPE INTEGER
set_parameter_property PW3_RESET UNITS None
set_parameter_property PW3_RESET ALLOWED_RANGES 0:65536
set_parameter_property PW3_RESET HDL_PARAMETER true
add_parameter PW3_FINAL INTEGER 0
set_parameter_property PW3_FINAL DEFAULT_VALUE 0
set_parameter_property PW3_FINAL DISPLAY_NAME PW3_FINAL
set_parameter_property PW3_FINAL TYPE INTEGER
set_parameter_property PW3_FINAL UNITS None
set_parameter_property PW3_FINAL ALLOWED_RANGES 0:255
set_parameter_property PW3_FINAL HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point req
# 
add_interface req avalon_streaming end
set_interface_property req associatedClock clock
set_interface_property req associatedReset reset
set_interface_property req dataBitsPerSymbol 1
set_interface_property req errorDescriptor ""
set_interface_property req firstSymbolInHighOrderBits true
set_interface_property req maxChannel 0
set_interface_property req readyLatency 0
set_interface_property req ENABLED true
set_interface_property req EXPORT_OF ""
set_interface_property req PORT_NAME_MAP ""
set_interface_property req CMSIS_SVD_VARIABLES ""
set_interface_property req SVD_ADDRESS_GROUP ""

add_interface_port req req_valid valid Input 1
add_interface_port req req_data data Input 1


# 
# connection point out
# 
add_interface out avalon_streaming start
set_interface_property out associatedClock clock
set_interface_property out associatedReset reset
set_interface_property out dataBitsPerSymbol 16
set_interface_property out errorDescriptor ""
set_interface_property out firstSymbolInHighOrderBits true
set_interface_property out maxChannel 1
set_interface_property out readyLatency 0
set_interface_property out ENABLED true
set_interface_property out EXPORT_OF ""
set_interface_property out PORT_NAME_MAP ""
set_interface_property out CMSIS_SVD_VARIABLES ""
set_interface_property out SVD_ADDRESS_GROUP ""

add_interface_port out out_channel channel Output 1
add_interface_port out out_data data Output 16
add_interface_port out out_valid valid Output 1


# 
# connection point store
# 
add_interface store avalon start
set_interface_property store addressUnits SYMBOLS
set_interface_property store associatedClock clock
set_interface_property store associatedReset reset
set_interface_property store bitsPerSymbol 8
set_interface_property store burstOnBurstBoundariesOnly false
set_interface_property store burstcountUnits WORDS
set_interface_property store doStreamReads false
set_interface_property store doStreamWrites false
set_interface_property store holdTime 0
set_interface_property store linewrapBursts false
set_interface_property store maximumPendingReadTransactions 0
set_interface_property store maximumPendingWriteTransactions 0
set_interface_property store readLatency 0
set_interface_property store readWaitTime 1
set_interface_property store setupTime 0
set_interface_property store timingUnits Cycles
set_interface_property store writeWaitTime 0
set_interface_property store ENABLED true
set_interface_property store EXPORT_OF ""
set_interface_property store PORT_NAME_MAP ""
set_interface_property store CMSIS_SVD_VARIABLES ""
set_interface_property store SVD_ADDRESS_GROUP ""

add_interface_port store store_write write Output 1
add_interface_port store store_addr address Output 6
add_interface_port store store_writedata writedata Output 16
add_interface_port store store_waitrequest waitrequest Input 1


# 
# connection point csr
# 
add_interface csr avalon end
set_interface_property csr addressUnits WORDS
set_interface_property csr associatedClock clock
set_interface_property csr associatedReset reset
set_interface_property csr bitsPerSymbol 8
set_interface_property csr burstOnBurstBoundariesOnly false
set_interface_property csr burstcountUnits WORDS
set_interface_property csr explicitAddressSpan 0
set_interface_property csr holdTime 0
set_interface_property csr linewrapBursts false
set_interface_property csr maximumPendingReadTransactions 0
set_interface_property csr maximumPendingWriteTransactions 0
set_interface_property csr readLatency 0
set_interface_property csr readWaitTime 1
set_interface_property csr setupTime 0
set_interface_property csr timingUnits Cycles
set_interface_property csr writeWaitTime 0
set_interface_property csr ENABLED true
set_interface_property csr EXPORT_OF ""
set_interface_property csr PORT_NAME_MAP ""
set_interface_property csr CMSIS_SVD_VARIABLES ""
set_interface_property csr SVD_ADDRESS_GROUP ""

add_interface_port csr in_addr address Input 1
add_interface_port csr in_read read Input 1
add_interface_port csr in_readdata readdata Output 32
add_interface_port csr in_write write Input 1
add_interface_port csr in_writedata writedata Input 32
set_interface_assignment csr embeddedsw.configuration.isFlash 0
set_interface_assignment csr embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment csr embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment csr embeddedsw.configuration.isPrintableDevice 0

