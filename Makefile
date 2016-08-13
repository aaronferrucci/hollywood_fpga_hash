.PHONY: all
all: create_tb gen_tb sim

SYS := test_core
QSYS := $(SYS).qsys
TB_QSYS := $(SYS)/testbench/$(SYS)_tb.qsys
.PHONY: create_tb
create_tb: $(TB_QSYS)

$(TB_QSYS): test_core.qsys ip/hollywood_hash/hollywood_hash_core.sv ip/hollywood_hash/hollywood_hash_core_hw.tcl
	qsys-generate --testbench=STANDARD $(QSYS)

.PHONY: gen_tb
gen_tb: test_core/testbench/test_core_tb/simulation/test_core_tb.v

test_core/testbench/test_core_tb/simulation/test_core_tb.v: $(TB_QSYS)
	qsys-generate --simulation=VERILOG $(TB_QSYS)

.PHONY: sim
sim:
	make -C sim

.PHONY: clean
clean:
	rm -rf test_core
	rm -f test_core.sopcinfo
	rm -rf .qsys_edit
	make -C sim clean
