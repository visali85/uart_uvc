#Makefile for UVM Testbench
#RTL = ../rtl/uart_tx.sv
RTL = +incdir+../rtl/dummy_dut.sv
INC = +incdir+../src/master_agent +incdir+../src/slave_agent +incdir+../src/env +incdir+../src/test +incdir+../src/top  
TOP =  ../src/top/top.sv
PKG = ../src/test/test_pkg.sv
TEST= ../src/test/base_test.sv
#COVOP= -dbg -coverage sba
work = work
VSIMOPT= +access +r -sva 
VSIMBATCH = -acdb_file mem_cov.acdb
VSIMBATCH1 = -c -acdb_file mem_cov2.acdb -do "log -rec *;run -all;exit"
lib:
	vlib $(work)
	vmap work $(work)

sv_cmp:clean  lib comp0
       

gui:
	vsim&
	
comp0:
	vcs -uvm $(INC) $(PKG) $(TOP)
run_test:
	vcs -V -R $(INC) $(PKG) $(TOP) -full64 -ntb_opts uvm-1.2 -sverilog +v2k -debug_access+all -debug_pp +ntb_random_seed_automatic -override_timescale=1ps/1ps
#vcs -V -R $(INC) $(PKG) $(TOP) -full64 -ntb_opts uvm-1.2 -sverilog +v2k -debug_access+all -debug_pp +ntb_random_seed_automatic -override_timescale=1ps/1ps
 
