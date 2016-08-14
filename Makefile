.PHONY: all
all: create_tb gen_tb sim

IP := ../ip
SYS := test_core
QSYS := $(SYS).qsys
TB_QSYS := $(SYS)/testbench/$(SYS)_tb.qsys
.PHONY: create_tb
create_tb: $(TB_QSYS)

$(TB_QSYS): test_core.qsys $(IP)/hollywood_hash_core/hollywood_hash_core.sv $(IP)/hollywood_hash_core/hollywood_hash_core_hw.tcl
	qsys-generate --search-path=$(IP)/hollywood_hash_core,$$ --testbench=STANDARD $(QSYS)

.PHONY: gen_tb
gen_tb: test_core/testbench/test_core_tb/simulation/test_core_tb.v

test_core/testbench/test_core_tb/simulation/test_core_tb.v: $(TB_QSYS)
	qsys-generate --search-path=$(IP)/hollywood_hash_core,$$ --simulation=VERILOG $(TB_QSYS)

.PHONY: sim
sim:
	make -C sim

.PHONY: clean
clean:
	rm -rf test_core
	rm -f test_core.sopcinfo
	rm -rf .qsys_edit
	rm -rf db incremental_db
	make -C sim clean
