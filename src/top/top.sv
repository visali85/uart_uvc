//  ################################################################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one or more contributor license 
//  agreements. See the NOTICE file distributed with this work for additional information
//  regarding copyright ownership. The ASF licenses this file to you under the Apache License,
//  Version 2.0 (the"License"); you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software distributed under the 
//  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, 
//  either express or implied. See the License for the specific language governing permissions and 
//  limitations under the License.
//
//  ################################################################################################

// Use of Include Guards
//`ifndef _top_INCLUDED_
//`define _top_INCLUDED_

//-------------------------------------------------------------------------------------------------
//module:top
//This provide the information about instantiating test_pkg,interface,and running the base test
//-------------------------------------------------------------------------------------------------
`include "uart_if.sv"
`include "../rtl/dummy_dut.sv"

module top;
	
	import test_pkg::*;
  	import uvm_pkg::*;	
  	logic reset;
	bit clock;
	always #10 clock <= ~clock;

 initial begin
    reset <= 1'b0;
    clock <= 1'b1;
    #5 reset = 1'b1;
  end

  //Generate Clock

  always #5 clock = ~clock;

uart_if uart_if_0(.clock(clock),
		.reset(reset));
  
  dummy_dut dut( .clock(uart_if_0.clock),
                 .reset(uart_if_0.reset)
                
               );

// TODO: Need to have the loopback mode
// assign intf.rx = intf.tx;
  
  	initial
  	begin
// TODO: Need to suppor for multiple interfaces
// Temporarily having vif_0
        uvm_config_db #(virtual uart_if)::set(null,"*","vif_0",uart_if_0);
     
//running the basic test case
    	run_test("base_test");
  $display("running base_test in top");
 	 end  
endmodule


  
   
  
