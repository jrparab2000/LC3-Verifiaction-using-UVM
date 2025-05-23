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

class writeback_environment  extends uvmf_environment_base #(
    .CONFIG_T( writeback_env_configuration 
  ));
  `uvm_component_utils( writeback_environment )





  typedef writeback_in_agent  writeback_in_agent_t;
  writeback_in_agent_t writeback_in_agent;

  typedef writeback_out_agent  writeback_out_agent_t;
  writeback_out_agent_t writeback_out_agent;




  typedef writeback_predictor #(
                .CONFIG_T(CONFIG_T)
                )
 predictor_t;
  predictor_t predictor;

  typedef uvmf_in_order_scoreboard #(.T(writeback_out_transaction))  scoreboard_t;
  scoreboard_t scoreboard;



  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(writeback_env_configuration)) writeback_vsqr_t;
  writeback_vsqr_t vsqr;

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
    writeback_in_agent = writeback_in_agent_t::type_id::create("writeback_in_agent",this);
    writeback_in_agent.set_config(configuration.writeback_in_agent_config);
    writeback_out_agent = writeback_out_agent_t::type_id::create("writeback_out_agent",this);
    writeback_out_agent.set_config(configuration.writeback_out_agent_config);
    predictor = predictor_t::type_id::create("predictor",this);
    predictor.configuration = configuration;
    scoreboard = scoreboard_t::type_id::create("scoreboard",this);

    vsqr = writeback_vsqr_t::type_id::create("vsqr", this);
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
    writeback_in_agent.monitored_ap.connect(predictor.analysis_export);
    predictor.analysis_port.connect(scoreboard.expected_analysis_export);
    writeback_out_agent.monitored_ap.connect(scoreboard.actual_analysis_export);
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
     configuration.writeback_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

