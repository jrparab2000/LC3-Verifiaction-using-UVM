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
class imem_responder_sequence 
  extends imem_sequence_base ;

  `uvm_object_utils( imem_responder_sequence )
  word instr_dout ;
  word NPC, OPC ;
  bit instrmem_rd ;
  bit [2:0] register;
  imem_transaction_req_t temp;
  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_responder_sequence");
    super.new(name);
    NPC = 0;
    OPC = 0;
    instrmem_rd = 'b0;
    temp=imem_transaction::type_id::create("temp");
  endfunction
  
  task body();
    req=imem_transaction::type_id::create("req");
    start_item(req);
    finish_item(req);
    // req.instr_dout = 16'he000;
    //temp1=imem_transaction::type_id::create("temp1");
    for(int i =0; i<8; i++)
    begin
      start_item(req);
      register = i;
      req.instr_dout = {LEA, register, 9'b000000000};
      req.complete_instr = 1'b1;
      finish_item(req);
      get_response(req);
    end
    start_item(req);
      // register = i;
      req.instr_dout = {LEA, 3'b000, 9'b000000000};
      req.complete_instr = 1'b1;
      finish_item(req);
      get_response(req);
    // NPC = 16'h3007;
    forever begin
      start_item(req);
      // if(instrmem_rd & ((NPC == 16'h3000)|(NPC != OPC)))
      
        // temp.PC = NPC;
        if(!temp.randomize()) `uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization failed")
        OPC = NPC;
      
      temp.complete_instr = 1'b1;
      req.do_copy(temp);
      finish_item(req);
      get_response(req);
      NPC = req.PC;
      instrmem_rd = req.instrmem_rd;
      
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
    end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

