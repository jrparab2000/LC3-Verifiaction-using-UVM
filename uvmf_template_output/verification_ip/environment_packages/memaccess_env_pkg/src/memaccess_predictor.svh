//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   analysis_export receives transactions of type  memaccess_in_transaction
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  pred_out broadcasts transactions of type memaccess_out_transaction
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class memaccess_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  )
 extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( memaccess_predictor #(
                              CONFIG_T,
                              BASE_T
                              )
)


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_analysis_export #(memaccess_in_transaction, memaccess_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )
) analysis_export;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(memaccess_out_transaction) pred_out;


  // Transaction variable for predicted values to be sent out pred_out
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef memaccess_out_transaction pred_out_output_transaction_t;
  pred_out_output_transaction_t pred_out_output_transaction;
  // Code for sending output transaction out through pred_out
  // pred_out.write(pred_out_output_transaction);

  // Define transaction handles for debug visibility 
  memaccess_in_transaction analysis_export_debug;

  typedef memaccess_out_transaction temp_t;
  temp_t temp;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    // `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    analysis_export = new("analysis_export", this);
    pred_out =new("pred_out", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_analysis_export
  // Transactions received through analysis_export initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_analysis_export(memaccess_in_transaction t);
    // pragma uvmf custom analysis_export_predictor begin
    analysis_export_debug = t;
    `uvm_info("PRED", "Transaction Received through analysis_export", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_MEDIUM)

    pred_out_output_transaction = pred_out_output_transaction_t::type_id::create("pred_out_output_transaction");
    // Construct one of each output transaction type.
    void'(mem_access_model( t.M_Data, 
                      t.M_addr,
                      t.M_Control,
                      t.mem_state,
                      t.DMem_dout,
                      pred_out_output_transaction.DMem_addr, 
                      pred_out_output_transaction.DMem_din,
                      pred_out_output_transaction.memout,
                      pred_out_output_transaction.DMem_rd));

    pred_out.write(pred_out_output_transaction);
    // pragma uvmf custom analysis_export_predictor end
  endfunction

endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

