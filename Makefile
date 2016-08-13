
SYS := test_core
QSYS := $(SYS).qsys
TB_QSYS := $(SYS)/testbench/$(SYS)_tb.qsys
.PHONY: create_tb
create_tb: $(TB_QSYS)

$(TB_QSYS): test_core.qsys
	qsys-generate --testbench=STANDARD $(QSYS)

.PHONY: gen_tb
gen_tb: test_core/testbench/test_core_tb/simulation/test_core_tb.v

test_core/testbench/test_core_tb/simulation/test_core_tb.v: $(TB_QSYS)
	qsys-generate --simulation=VERILOG $(TB_QSYS)

.PHONY: clean
clean:
	rm -rf test_core
	rm -f test_core.sopcinfo
	rm -rf .qsys_edit
