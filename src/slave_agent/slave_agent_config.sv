//  ###########################################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//  ###########################################################################
//  
//   Use of Include Guards
//`ifndef _slave_agent_config_INCLUDED_
//`define _slave_agent_config_INCLUDED_

//-------------------------------------------------------------------------------------------------
//class:slave_agent_config
//Every agent should have a configuration object that encapsulates all of the parameters that 
//can be modified to control the agent's behavior.
//-------------------------------------------------------------------------------------------------
class slave_agent_config extends uvm_object;

  //-----------------------------------------------------------------------------------------------
  //Factory registration is d/one by passing class name as argument.
  //Factory Method in UVM enables us to register a class, object and variables inside the factory 
  //so that we can override their type (if needed) from the test bench without needing to make any
  //significant change in component structure.
  //-----------------------------------------------------------------------------------------------
	`uvm_object_utils(slave_agent_config)

  //Virtual interface holds the pointer to the Interface.
	virtual uart_if vif;

  //Convenience value to define whether a component, usually an agent, is in active mode or
  //passive� mode.
	uvm_active_passive_enum is_active ;  



	extern function new (string name = "slave_agent_config");

	endclass

//-------------------------------------------------------------------------------------------------
//constructor:new
  //The new function is called as class constructor. On calling the new method it allocates the 
  //memory and returns the address to the class handle.
  //-----------------------------------------------------------------------------------------------
	function slave_agent_config::new(string name = "slave_agent_config");
		super.new(name);
	endfunction:new
