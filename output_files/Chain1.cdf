/* Quartus Prime Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Cfg)
		Device PartName(10M50DAF484ES) Path("C:/Users/aaronf/Documents/projects/microcorruption/hollywood_fpga_hash/output_files/") File("hollywood_hash.sof") MfrSpec(OpMask(1));
	P ActionCode(Ign)
		Device PartName(VTAP10) MfrSpec(OpMask(0));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
