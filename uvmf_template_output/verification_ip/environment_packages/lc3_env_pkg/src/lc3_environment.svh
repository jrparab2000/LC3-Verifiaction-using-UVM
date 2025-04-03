//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class lc3_environment  extends uvmf_environment_base #(
    .CONFIG_T( lc3_env_configuration 
  ));
  `uvm_component_utils( lc3_environment )

  typedef fetch_environment fetch_environment_t;
  fetch_environment_t fetch_environment;
   
  typedef decode_environment decode_environment_t;
  decode_environment_t decode_environment;
   
  typedef execute_environment execute_environment_t;
  execute_environment_t execute_environment;
   
  typedef writeback_environment writeback_environment_t;
  writeback_environment_t writeback_environment;
   
  typedef memaccess_environment memaccess_environment_t;
  memaccess_environment_t memaccess_environment;
   
  typedef controller_environment controller_environment_t;
  controller_environment_t controller_environment;
   




  typedef imem_agent  imem_agent_t;
  imem_agent_t imem_agent;

  typedef dmem_agent  dmem_agent_t;
  dmem_agent_t dmem_agent;








  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(lc3_env_configuration)) lc3_vsqr_t;
  lc3_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    fetch_environment = fetch_environment_t::type_id::create("fetch_environment",this);
    fetch_environment.set_config(configuration.fetch_environment_config);
    decode_environment = decode_environment_t::type_id::create("decode_environment",this);
    decode_environment.set_config(configuration.decode_environment_config);
    execute_environment = execute_environment_t::type_id::create("execute_environment",this);
    execute_environment.set_config(configuration.execute_environment_config);
    writeback_environment = writeback_environment_t::type_id::create("writeback_environment",this);
    writeback_environment.set_config(configuration.writeback_environment_config);
    memaccess_environment = memaccess_environment_t::type_id::create("memaccess_environment",this);
    memaccess_environment.set_config(configuration.memaccess_environment_config);
    controller_environment = controller_environment_t::type_id::create("controller_environment",this);
    controller_environment.set_config(configuration.controller_environment_config);
    imem_agent = imem_agent_t::type_id::create("imem_agent",this);
    imem_agent.set_config(configuration.imem_agent_config);
    dmem_agent = dmem_agent_t::type_id::create("dmem_agent",this);
    dmem_agent.set_config(configuration.dmem_agent_config);

    vsqr = lc3_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.lc3_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

