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
class decode_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( decode_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This decode_env_sequence_base contains a handle to a decode_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in decode_environment:
    // configuration.decode_agent_in_config.sequencer
    // configuration.decode_agent_out_config.sequencer

  // Responder agent sequencers in decode_environment:


    typedef decode_in_random_sequence decode_agent_in_random_sequence_t;
    decode_agent_in_random_sequence_t decode_agent_in_rand_seq;

    typedef decode_out_random_sequence decode_agent_out_random_sequence_t;
    decode_agent_out_random_sequence_t decode_agent_out_rand_seq;


// This example shows how to use the environment sequence base for sub-environments
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
    decode_agent_in_rand_seq = decode_agent_in_random_sequence_t::type_id::create("decode_agent_in_rand_seq");
    decode_agent_out_rand_seq = decode_agent_out_random_sequence_t::type_id::create("decode_agent_out_rand_seq");


  endfunction

  virtual task body();

  
    if ( configuration.decode_agent_in_config.sequencer != null )
       repeat (25) decode_agent_in_rand_seq.start(configuration.decode_agent_in_config.sequencer);
    if ( configuration.decode_agent_out_config.sequencer != null )
       repeat (25) decode_agent_out_rand_seq.start(configuration.decode_agent_out_config.sequencer);


  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

