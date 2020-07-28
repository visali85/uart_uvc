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
//`ifndef _master_agent_top_INCLUDED_
//`define _master_agent_top_INCLUDED_

//------------------------------------------------------------------------------------------------//
//  class:master_agent_top
//  Master_agent_top is extended from uvm_env. It contains the agent. Configuration of 
//  agent_congif_db is done in agent_top.
//------------------------------------------------------------------------------------------------//
class master_agent_top extends uvm_env;
  
//  Factory Method in UVM enables us to register a class, object and variables inside the factory 
	`uvm_component_utils(master_agent_top)


//------------------------------------------------------------------------------------------------//
//  Master_agent class is defined as dynamic so multiple agents can be instantiated. But in UART 
//  only one master is enough since it is one to one transmission. Hence Master_agent should always 
//  set to be one.
//------------------------------------------------------------------------------------------------//
	master_agent wagent[];
	env_config e_cfg;


	//  The extern qualifier indicates that its implementation is to be found outside the declaration.
	extern function new(string name= "master_agent_top", uvm_component parent);
	extern function void build_phase(uvm_phase phase);

 // extern task end_of_elaboration_phase(uvm_phase phase);
//	extern task run_phase(uvm_phase phase);
endclass:master_agent_top


//------------------------------------------------------------------------------------------------//
//  constructor:new
//  The new function is called as class constructor. On calling the new method it allocates the 
//  memory and returns the address to the class handle. For the component class two arguments to be 
//  passed. 
//------------------------------------------------------------------------------------------------//
function master_agent_top::new(string name= "master_agent_top", uvm_component parent);
	super.new(name, parent);
endfunction:new


//-----------------------------------------------------------------------------------------------//
//  phase:Build
//  The build phases are executed at the start of the UVM Testbench simulation and their overall 
//  purpose is to construct, configure and connect the Testbench component hierarchy.
//  All the build phase methods are functions and therefore execute in zero simulation time.
//------------------------------------------------------------------------------------------------//
function void master_agent_top::build_phase(uvm_phase phase);
	
	if(!uvm_config_db #(env_config)::get(this,"","env_config", e_cfg))
	`uvm_fatal("CONFIG_ENV","cannot get() env_config from uvm_config_db. Have you set() it?")
	 wagent=new[e_cfg.no_of_wagent];
	 foreach(wagent[i])
	 begin
	 uvm_config_db #(master_agent_config)::set(this,$sformatf("wagent[%0d]*",i), "master_agent_config",e_cfg.w_cfg[i]);
	 wagent[i]=master_agent::type_id::create($sformatf("wagent[%0d]",i), this);
	 end
	
/*	 // Configure
  if ( cfg == null)
    if (!uvm_config_db#(uart_config)::get(this, "", "cfg", cfg)) begin
      `uvm_info("NOCONFIG", "No uart_config, creating...", UVM_MEDIUM)
      cfg = uart_config::type_id::create("cfg", this);
      if (!cfg.randomize())
         `uvm_error("RNDFAIL", "Could not randomize uart_config using default values")
      `uvm_info(get_type_name(), {"Printing cfg:\n", cfg.sprint()}, UVM_MEDIUM)
    end
*/
	// Configure the sub-components
//  uvm_config_object::set(this, "Tx*", "cfg", cfg);	 
   	 super.build_phase(phase);				
endfunction:build_phase 

/*
//---------------------------------------------------------------------------------------------
//phase:end of elaboration
//------------------------------------------------------------------------------------------------
task master_agent_top::end_of_elaboration_phase(uvm_phase phase);
 // uvm_top.print_topology;
endtask:end_of_elaboration_phase
*/
