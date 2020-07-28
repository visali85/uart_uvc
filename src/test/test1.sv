
//Author : visalidoddi@mirafra.com

class test1 extends base_test;

`uvm_component_utils(test1)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

function void start_of_simulation_phase(uvm_phase phase);
super.start_of_simulation_phase(phase);
this.print();
endfunction

task run_phase(uvm_phase phase);
v_seq1 vseq= v_seq1::type_id::create("vseq");
uvm_test_done.raise_objection(this);
`uvm_info("test1","Starting test",UVM_LOW)
vseq.start(envh.v_seqrh);
`uvm_info("test1","Finishing end",UVM_LOW)
uvm_test_done.drop_objection(this);
endtask

endclass:test1
