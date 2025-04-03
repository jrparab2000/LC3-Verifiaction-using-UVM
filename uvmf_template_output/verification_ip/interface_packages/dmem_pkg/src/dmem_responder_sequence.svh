//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class dmem_responder_sequence 
  extends dmem_sequence_base ;

  `uvm_object_utils( dmem_responder_sequence )
  bit Data_rd;
  bit [15:0] Data_mem [0:65535];
  bit [15:0] data_addr;
  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "dmem_responder_sequence");
    super.new(name);
    for (int i =0; i< $size(Data_mem); i++) begin
      Data_mem[i] = i;
    end
  endfunction

  task body();
    req=dmem_transaction::type_id::create("req");
    forever begin
      start_item(req);
      if(Data_rd == 1'b1)
      begin
        req.Data_dout = Data_mem[data_addr];
        //if(!req.randomize()) `uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization failed")
      end
      req.complete_data = 1'b1;
      finish_item(req);
      get_response(req);
      Data_rd = req.Data_rd;
      data_addr = req.Data_addr;
      if(Data_rd == 1'b0)
      begin
        Data_mem[data_addr] = req.Data_din;
      end


      
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

