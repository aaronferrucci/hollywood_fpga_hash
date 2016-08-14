.PHONY: all
all: create_tb gen_tb sim

SYS := test_core
QSYS := $(SYS).qsys
TB_SYS := $(SYS)_tb
TB_QSYS := $(SYS)/testbench/$(TB_SYS).qsys
.PHONY: create_tb
create_tb: $(TB_QSYS)

$(TB_QSYS): $(QSYS) ip/hollywood_hash_core/hollywood_hash_core.sv ip/hollywood_hash_core/hollywood_hash_core_hw.tcl
	qsys-generate --testbench=STANDARD $(QSYS)

.PHONY: gen_tb
gen_tb: $(SYS)/testbench/$(TB_SYS)/simulation/$(TB_SYS).v

$(SYS)/testbench/$(TB_SYS)/simulation/$(TB_SYS).v: $(TB_QSYS)
	qsys-generate --simulation=VERILOG $(TB_QSYS)

SIM_DIR := $(SYS)_sim
.PHONY: sim
sim:
	make -C $(SIM_DIR)

.PHONY: clean
clean:
	rm -rf test_core test_pw_gen
	rm -f *.sopcinfo
	rm -rf .qsys_edit
	rm -rf db incremental_db
	rm -f *.qws
	rm -f c5_pin_model_dump.txt
	make -C test_core_sim clean
	make -C test_pw_gen_sim clean


