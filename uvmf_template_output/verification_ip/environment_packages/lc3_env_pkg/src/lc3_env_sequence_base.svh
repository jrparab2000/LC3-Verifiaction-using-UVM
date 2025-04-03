//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This file contains environment level sequences that will
//    be reused from block to top level simulations.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class lc3_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( lc3_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This lc3_env_sequence_base contains a handle to a lc3_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in lc3_environment:

  // Responder agent sequencers in lc3_environment:
    // configuration.imem_agent_config.sequencer
    // configuration.dmem_agent_config.sequencer

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.fetch_environment_config.vsqr
    // configuration.decode_environment_config.vsqr
    // configuration.execute_environment_config.vsqr
    // configuration.writeback_environment_config.vsqr
    // configuration.memaccess_environment_config.vsqr
    // configuration.controller_environment_config.vsqr




// This example shows how to use the environment sequence base for sub-environments
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer
// typedef fetch_env_sequence_base #(
//         .CONFIG_T(fetch_env_configuration)
//         ) 
//         fetch_environment_sequence_base_t;
// rand fetch_environment_sequence_base_t fetch_environment_seq;

// typedef decode_env_sequence_base #(
//         .CONFIG_T(decode_env_configuration)
//         ) 
//         decode_environment_sequence_base_t;
// rand decode_environment_sequence_base_t decode_environment_seq;

// typedef execute_env_sequence_base #(
//         .CONFIG_T(execute_env_configuration)
//         ) 
//         execute_environment_sequence_base_t;
// rand execute_environment_sequence_base_t execute_environment_seq;

// typedef writeback_env_sequence_base #(
//         .CONFIG_T(writeback_env_configuration)
//         ) 
//         writeback_environment_sequence_base_t;
// rand writeback_environment_sequence_base_t writeback_environment_seq;

// typedef memaccess_env_sequence_base #(
//         .CONFIG_T(memaccess_env_configuration)
//         ) 
//         memaccess_environment_sequence_base_t;
// rand memaccess_environment_sequence_base_t memaccess_environment_seq;

// typedef controller_env_sequence_base #(
//         .CONFIG_T(controller_env_configuration)
//         ) 
//         controller_environment_sequence_base_t;
// rand controller_environment_sequence_base_t controller_environment_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);

//     fetch_environment_seq = fetch_environment_sequence_base_t::type_id::create("fetch_environment_seq");
//     decode_environment_seq = decode_environment_sequence_base_t::type_id::create("decode_environment_seq");
//     execute_environment_seq = execute_environment_sequence_base_t::type_id::create("execute_environment_seq");
//     writeback_environment_seq = writeback_environment_sequence_base_t::type_id::create("writeback_environment_seq");
//     memaccess_environment_seq = memaccess_environment_sequence_base_t::type_id::create("memaccess_environment_seq");
//     controller_environment_seq = controller_environment_sequence_base_t::type_id::create("controller_environment_seq");

  endfunction

  virtual task body();

  

//     fetch_environment_seq.start(configuration.fetch_environment_config.vsqr);
//     decode_environment_seq.start(configuration.decode_environment_config.vsqr);
//     execute_environment_seq.start(configuration.execute_environment_config.vsqr);
//     writeback_environment_seq.start(configuration.writeback_environment_config.vsqr);
//     memaccess_environment_seq.start(configuration.memaccess_environment_config.vsqr);
//     controller_environment_seq.start(configuration.controller_environment_config.vsqr);

  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

