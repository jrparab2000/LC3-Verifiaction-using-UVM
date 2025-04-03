//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import lc3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #9ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #250ns;
    rst =  0; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end

   tri [15:0] pc;
   tri  instrmem_rd;
   tri [15:0] Instr_dout;
   tri [15:0] DMem_addr;
   tri  DMem_rd;
   tri [15:0] DMem_din;
   tri  complete_data;
   tri  complete_instr;
   tri [15:0] Data_dout;
   
  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fetch_environment_agent_fetch_in_bus(
     // pragma uvmf custom fetch_environment_agent_fetch_in_bus_connections begin
     .clock(clk), .reset(rst), .enable_updatePC(lc3.enable_updatePC), .enable_fetch(lc3.enable_fetch), .taddr(lc3.pcout), .br_taken(lc3.br_taken)
     // pragma uvmf custom fetch_environment_agent_fetch_in_bus_connections end
     );
  fetch_out_if  fetch_environment_agent_fetch_out_bus(
     // pragma uvmf custom fetch_environment_agent_fetch_out_bus_connections begin
     .clock(clk), .reset(rst), .npc(lc3.npc_out_fetch), .pc(pc), .instrmem_rd(lc3.instrmem_rd)
     // pragma uvmf custom fetch_environment_agent_fetch_out_bus_connections end
     );
  decode_in_if  decode_environment_decode_agent_in_bus(
     // pragma uvmf custom decode_environment_decode_agent_in_bus_connections begin
     .clock(clk), .reset(rst), .enable_decode(lc3.enable_decode), .Instr_dout(Instr_dout), .npc_in(lc3.npc_out_fetch)
     // pragma uvmf custom decode_environment_decode_agent_in_bus_connections end
     );
  decode_out_if  decode_environment_decode_agent_out_bus(
     // pragma uvmf custom decode_environment_decode_agent_out_bus_connections begin
     .clock(clk), .reset(rst), .IR(lc3.IR), .npc_out(lc3.npc_out_dec), .E_control(lc3.E_Control), .W_control(lc3.W_Control), .Mem_control(lc3.Mem_Control)
     // pragma uvmf custom decode_environment_decode_agent_out_bus_connections end
     );
  execute_in_if  execute_environment_execute_in_agent_bus(
     // pragma uvmf custom execute_environment_execute_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .E_control(lc3.E_Control), .IR(lc3.IR), .npc_in(lc3.npc_out_dec), .bypass_alu_1(lc3.bypass_alu_1), .bypass_alu_2(lc3.bypass_alu_2), .bypass_mem_1(lc3.bypass_mem_1), .bypass_mem_2(lc3.bypass_mem_2), .VSR1(lc3.VSR1), .VSR2(lc3.VSR2), .W_Control_in(lc3.W_Control), .Mem_Control_in(lc3.Mem_Control), 
     .enable_execute(lc3.enable_execute), .Mem_Bypass_Val(lc3.memout)
     // pragma uvmf custom execute_environment_execute_in_agent_bus_connections end
     );
  execute_out_if  execute_environment_execute_out_agent_bus(
     // pragma uvmf custom execute_environment_execute_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .W_Control_out(lc3.W_Control_out), .Mem_Control_out(lc3.Mem_Control_out), .aluout(lc3.aluout), .pcout(lc3.pcout), .dr(lc3.dr), .sr1(lc3.sr1), .sr2(lc3.sr2), .IR_Exec(lc3.IR_Exec), .NZP(lc3.NZP), .M_Data(lc3.M_Data), .enable_execute_out(enable_execute_out)
     // pragma uvmf custom execute_environment_execute_out_agent_bus_connections end
     );
  writeback_in_if  writeback_environment_writeback_in_agent_bus(
     // pragma uvmf custom writeback_environment_writeback_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_writeback(lc3.enable_writeback), .aluout(lc3.aluout), .memout(lc3.memout), .sr1(lc3.sr1), .sr2(lc3.sr2), .dr(lc3.dr), .npc(lc3.npc_out_dec), .pcout(lc3.pcout), .W_control_in(lc3.W_Control_out)
     // pragma uvmf custom writeback_environment_writeback_in_agent_bus_connections end
     );
  writeback_out_if  writeback_environment_writeback_out_agent_bus(
     // pragma uvmf custom writeback_environment_writeback_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .writeback_en_out(writeback_en_out), .psr(lc3.psr), .VSR1(lc3.VSR1), .VSR2(lc3.VSR2)
     // pragma uvmf custom writeback_environment_writeback_out_agent_bus_connections end
     );
  memaccess_in_if  memaccess_environment_agent_in_bus(
     // pragma uvmf custom memaccess_environment_agent_in_bus_connections begin
     .clock(clk), .reset(rst), .mem_state(lc3.mem_state), .M_Control(lc3.Mem_Control_out), .M_Data(lc3.M_Data), .M_addr(lc3.pcout), .DMem_dout(Data_dout)
     // pragma uvmf custom memaccess_environment_agent_in_bus_connections end
     );
  memaccess_out_if  memaccess_environment_agent_out_bus(
     // pragma uvmf custom memaccess_environment_agent_out_bus_connections begin
     .clock(clk), .reset(rst), .DMem_addr(DMem_addr), .DMem_rd(DMem_rd), .DMem_din(DMem_din), .memout(lc3.memout)
     // pragma uvmf custom memaccess_environment_agent_out_bus_connections end
     );
  controller_in_if  controller_environment_controller_agent_in_bus(
     // pragma uvmf custom controller_environment_controller_agent_in_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(complete_data), .complete_instr(complete_instr), .IR(lc3.IR), .NZP(lc3.NZP), .psr(lc3.psr), .IR_Exec(lc3.IR_Exec), .IMem_dout(Instr_dout)
     // pragma uvmf custom controller_environment_controller_agent_in_bus_connections end
     );
  controller_out_if  controller_environment_controller_agent_out_bus(
     // pragma uvmf custom controller_environment_controller_agent_out_bus_connections begin
     .clock(clk), .reset(rst), .enable_updatePC(lc3.enable_updatePC), .enable_fetch(lc3.enable_fetch), .enable_decode(lc3.enable_decode), .enable_execute(lc3.enable_execute), .enable_writeback(lc3.enable_writeback), .br_taken(lc3.br_taken), .bypass_alu_1(lc3.bypass_alu_1), .bypass_alu_2(lc3.bypass_alu_2),
     .bypass_mem_1(lc3.bypass_mem_1), .bypass_mem_2(lc3.bypass_mem_2), .mem_state(lc3.mem_state)
     // pragma uvmf custom controller_environment_controller_agent_out_bus_connections end
     );
  imem_if  imem_agent_bus(
     // pragma uvmf custom imem_agent_bus_connections begin
     .clock(clk), .reset(rst), .PC(pc), .instrmem_rd(lc3.instrmem_rd), .instr_dout(Instr_dout), .complete_instr(complete_instr)
     // pragma uvmf custom imem_agent_bus_connections end
     );
  dmem_if  dmem_agent_bus(
     // pragma uvmf custom dmem_agent_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(complete_data), .Data_dout(Data_dout), .Data_din(DMem_din), .Data_rd(DMem_rd), .Data_addr(DMem_addr)
     // pragma uvmf custom dmem_agent_bus_connections end
     );
  fetch_in_monitor_bfm  fetch_environment_agent_fetch_in_mon_bfm(fetch_environment_agent_fetch_in_bus);
  fetch_out_monitor_bfm  fetch_environment_agent_fetch_out_mon_bfm(fetch_environment_agent_fetch_out_bus);
  decode_in_monitor_bfm  decode_environment_decode_agent_in_mon_bfm(decode_environment_decode_agent_in_bus);
  decode_out_monitor_bfm  decode_environment_decode_agent_out_mon_bfm(decode_environment_decode_agent_out_bus);
  execute_in_monitor_bfm  execute_environment_execute_in_agent_mon_bfm(execute_environment_execute_in_agent_bus);
  execute_out_monitor_bfm  execute_environment_execute_out_agent_mon_bfm(execute_environment_execute_out_agent_bus);
  writeback_in_monitor_bfm  writeback_environment_writeback_in_agent_mon_bfm(writeback_environment_writeback_in_agent_bus);
  writeback_out_monitor_bfm  writeback_environment_writeback_out_agent_mon_bfm(writeback_environment_writeback_out_agent_bus);
  memaccess_in_monitor_bfm  memaccess_environment_agent_in_mon_bfm(memaccess_environment_agent_in_bus);
  memaccess_out_monitor_bfm  memaccess_environment_agent_out_mon_bfm(memaccess_environment_agent_out_bus);
  controller_in_monitor_bfm  controller_environment_controller_agent_in_mon_bfm(controller_environment_controller_agent_in_bus);
  controller_out_monitor_bfm  controller_environment_controller_agent_out_mon_bfm(controller_environment_controller_agent_out_bus);
  imem_monitor_bfm  imem_agent_mon_bfm(imem_agent_bus);
  dmem_monitor_bfm  dmem_agent_mon_bfm(dmem_agent_bus);
  imem_driver_bfm  imem_agent_drv_bfm(imem_agent_bus);
  dmem_driver_bfm  dmem_agent_drv_bfm(dmem_agent_bus);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
  LC3 lc3(
      .clock(clk), 
      .reset(rst), 
      .complete_instr(complete_instr), 
      .complete_data(complete_data),  
      .Instr_dout(Instr_dout),
      .Data_dout(Data_dout),   
      .instrmem_rd(instrmem_rd),
      .pc(pc),
		.Data_din(DMem_din),
      .Data_addr(DMem_addr), 
      .Data_rd(DMem_rd)	
  );

  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_environment_agent_fetch_in_BFM , fetch_environment_agent_fetch_in_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetch_environment_agent_fetch_out_BFM , fetch_environment_agent_fetch_out_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_environment_decode_agent_in_BFM , decode_environment_decode_agent_in_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decode_environment_decode_agent_out_BFM , decode_environment_decode_agent_out_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_environment_execute_in_agent_BFM , execute_environment_execute_in_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , execute_environment_execute_out_agent_BFM , execute_environment_execute_out_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_environment_writeback_in_agent_BFM , writeback_environment_writeback_in_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writeback_environment_writeback_out_agent_BFM , writeback_environment_writeback_out_agent_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_environment_agent_in_BFM , memaccess_environment_agent_in_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccess_environment_agent_out_BFM , memaccess_environment_agent_out_mon_bfm ); 
    uvm_config_db #( virtual controller_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , controller_environment_controller_agent_in_BFM , controller_environment_controller_agent_in_mon_bfm ); 
    uvm_config_db #( virtual controller_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , controller_environment_controller_agent_out_BFM , controller_environment_controller_agent_out_mon_bfm ); 
    uvm_config_db #( virtual imem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_mon_bfm ); 
    uvm_config_db #( virtual dmem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_mon_bfm ); 
    uvm_config_db #( virtual imem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imem_agent_BFM , imem_agent_drv_bfm  );
    uvm_config_db #( virtual dmem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmem_agent_BFM , dmem_agent_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

