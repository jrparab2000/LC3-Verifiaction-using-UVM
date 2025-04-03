//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records imem transaction information using
//       a covergroup named imem_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

  /* ALU */
  // `define ADD  4'd1
  // `define AND  4'd5
  // `define NOT  4'd9
  // /* BRANCH, JMP*/
  // `define BR  4'd0
  // `define JMP  4'd12
  // /* LOAD, STORE*/
  // `define LD  4'd2
  // `define LDR  4'd6
  // `define LDI  4'd10
  // `define LEA  4'd14
  // `define ST  4'd3
  // `define STR  4'd7
  // `define STI  4'd11 
class imem_transaction_coverage  extends uvm_subscriber #(.T(imem_transaction ));

  `uvm_component_utils( imem_transaction_coverage )

  T coverage_trans;
  //bit [3:0] instruction_dout;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup imem_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=1024;
    option.per_instance=1;
    /*complete_instr: coverpoint coverage_trans.complete_instr;
    //Instr_dout: coverpoint coverage_trans.Instr_dout; 
    Instr_dout: coverpoint coverage_trans.Instr_dout[15:12] { bins AND = {'d5}; 
					  		      bins ADD = {'d1};
					  		      bins NOT = {'d9};
					  		      bins LD  = {'d2};
					  		      bins LDR = {'d6};
					  		      bins LDI = {'ha};
					  		      bins LEA = {'he};
					  		      bins ST = {'h3};
					  		      bins STR = {'h7};
					  		      bins STI = {'hb};
					  		      bins BR = {'h0};
					  		      bins JMP = {'hc};
								}
    PC: coverpoint coverage_trans.PC;
    instrmem_rd: coverpoint coverage_trans.instrmem_rd;
     //pragma uvmf custom covergroup end
  endgroup*/
  complete_instr: coverpoint coverage_trans.complete_instr;
  instr_mem_rd: coverpoint coverage_trans.instrmem_rd;
  opcode_p: coverpoint coverage_trans.instr_dout[15:12]
  {
    bins Add = {ADD};
    bins And = {AND};
    bins Not = {NOT};
    bins Ld  = {LD};
    bins Ldr = {LDR};
    bins Ldi = {LDI};
    bins Lea = {LEA};
    bins St  = {ST};
    bins Str = {STR};
    bins Sti = {STI};
    bins Br  = {BR};
    bins Jmp = {JMP};
  }
  mode: coverpoint coverage_trans.instr_dout[5];
  // baser: coverpoint coverage_trans.baser;
  PC: coverpoint coverage_trans.PC
	{
		bins PC_random = {[0:$]};
	}
  // opcode_p: coverpoint coverage_trans.opcode iff((coverage_trans.opcode == AND) | (coverage_trans.opcode == ADD));
    op_x_mode: cross opcode_p, mode
  {
    bins and_x = binsof(opcode_p) intersect{AND};
    bins add_x = binsof(opcode_p) intersect{ADD};
    ignore_bins not_x = binsof(opcode_p) intersect{NOT};
    ignore_bins ld_x  = binsof(opcode_p) intersect{LD};
    ignore_bins ldr_x = binsof(opcode_p) intersect{LDR};
    ignore_bins ldi_x = binsof(opcode_p) intersect{LDI};
    ignore_bins lea_x = binsof(opcode_p) intersect{LEA};
    ignore_bins st_x  = binsof(opcode_p) intersect{ST};
    ignore_bins str_x = binsof(opcode_p) intersect{STR};
    ignore_bins sti_x = binsof(opcode_p) intersect{STI};
    ignore_bins br_x  = binsof(opcode_p) intersect{BR};
    ignore_bins jmp_x = binsof(opcode_p) intersect{JMP};
  }
  //   //Instr_dout: coverpoint coverage_trans.Instr_dout;
  
    // pragma uvmf custom covergroup end
  endgroup

  covergroup ALU_operations;               //covergroup for ALU operations
   
    alu_op: coverpoint  coverage_trans.instr_dout[15:12]     //coverpoint for covering ALU operations (and,add,not)
    {
      bins op_add= {1};
      bins op_and= {5};
      bins op_not= {9};
    }
    dest_reg: coverpoint  coverage_trans.instr_dout[11:9] iff (( coverage_trans.instr_dout[15:12] == 4'h1) || (  coverage_trans.instr_dout[15:12] == 4'h5) || (  coverage_trans.instr_dout[15:12] == 4'h9));   
    src1_reg: coverpoint  coverage_trans.instr_dout[8:6] iff (( coverage_trans.instr_dout[15:12] == 4'h1) || ( coverage_trans.instr_dout[15:12] == 4'h5) || ( coverage_trans.instr_dout[15:12] == 4'h9));  
    // imm_bit: coverpoint  coverage_trans.instr_dout[5] iff (( coverage_trans.instr_dout[15:12] == 4'h1) || ( coverage_trans.instr_dout[15:12] == 4'h5));
    src2_reg: coverpoint  coverage_trans.instr_dout[2:0] iff (( coverage_trans.instr_dout[5] == 0) && (( coverage_trans.instr_dout[15:12] == 4'h1) || ( coverage_trans.instr_dout[15:12] == 4'h5)));
    imm5_field: coverpoint  coverage_trans.instr_dout[4:0] iff (( coverage_trans.instr_dout[5] == 1'b1) && (( coverage_trans.instr_dout[15:12] == 4'h1) || ( coverage_trans.instr_dout[15:12] == 4'h5)))
    {
  		bins zero_to_31= {[0:31]};
    }
    op_not: coverpoint coverage_trans.instr_dout[15:12]{
		bins alu_operations = {NOT};
	  } 
	  sr1: coverpoint coverage_trans.instr_dout[8:6];
    not_x_sr1 : cross op_not, sr1 {}
  endgroup
  
  covergroup MEM_operations;
    mem_opcode: coverpoint coverage_trans.instr_dout[15:12] 
    {
      bins op_ld = {2};
      bins op_ldr = {6};
      bins op_ldi = {4'ha};
      bins op_lea = {4'he};
      bins op_st = {3};
      bins op_str = {7};
      bins op_sti = {4'hb};
    }
    dest_reg_mem: coverpoint  coverage_trans.instr_dout[11:9] iff (( coverage_trans.instr_dout[15:12] == 4'h2) || (  coverage_trans.instr_dout[15:12] == 4'h6) || (  coverage_trans.instr_dout[15:12] == 4'ha)|| (  coverage_trans.instr_dout[15:12] == 4'he));   
    src_reg_mem: coverpoint  coverage_trans.instr_dout[11:9] iff (( coverage_trans.instr_dout[15:12] == 4'h3) || (  coverage_trans.instr_dout[15:12] == 4'h7) || (  coverage_trans.instr_dout[15:12] == 4'hb));       
	  baser_reg_mem :  coverpoint  coverage_trans.instr_dout[8:6] iff (( coverage_trans.instr_dout[15:12] == 4'h6) || (  coverage_trans.instr_dout[15:12] == 4'h7)); 
    PC_offset_6_reg_mem :  coverpoint  coverage_trans.instr_dout[5:0] iff (( coverage_trans.instr_dout[15:12] == 4'h6) || (  coverage_trans.instr_dout[15:12] == 4'h7))
    {
        bins zero_to_63 = {[0:63]};
    }
    PC_offset_9_reg_mem :  coverpoint  coverage_trans.instr_dout[8:0] iff (( coverage_trans.instr_dout[15:12] == 4'h2) || (  coverage_trans.instr_dout[15:12] == 4'ha)|| ( coverage_trans.instr_dout[15:12] == 4'he) || (  coverage_trans.instr_dout[15:12] == 4'h3) || (  coverage_trans.instr_dout[15:12] == 4'hb))
    {
       	bins zero_to_511= {[0:511]};
    }

    op_ldr: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {LDR};
    }
    op_ldi: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {LDI};
    }
    op_ld: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {LD};
    }
    op_lea: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {LEA};
    }

    op_st: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {ST};
    }
    op_str: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {STR};
    }
    op_sti: coverpoint coverage_trans.instr_dout[15:12]{
      bins memory_operations = {STI};
    }

    dreg_mem: coverpoint  coverage_trans.instr_dout[11:9] iff (( coverage_trans.instr_dout[15:12] == LD) || (  coverage_trans.instr_dout[15:12] == LDR) || (  coverage_trans.instr_dout[15:12] == LDI)|| (  coverage_trans.instr_dout[15:12] == LEA))
    {
        bins b_0_to_7 = {[0:7]};
    }
    sreg_mem: coverpoint  coverage_trans.instr_dout[11:9] iff (( coverage_trans.instr_dout[15:12] == ST) || (  coverage_trans.instr_dout[15:12] == STI) || (  coverage_trans.instr_dout[15:12] == STR))
    {
        bins b_0_to_7 = {[0:7]};
    }       
	  baser_mem :  coverpoint  coverage_trans.instr_dout[8:6] iff (( coverage_trans.instr_dout[15:12] == LDR) || (  coverage_trans.instr_dout[15:12] == STR))
    {
        bins b_0_to_7 = {[0:7]};
    }
    PC_offset_6_reg_mem_LDR :  coverpoint  coverage_trans.instr_dout[5:0] iff (( coverage_trans.instr_dout[15:12] == LDR) || (  coverage_trans.instr_dout[15:12] == STR))
    {
        bins b_0_to_63 = {[0:63]};
    }
    PC_offset_9_reg_mem_LD :  coverpoint  coverage_trans.instr_dout[8:0] iff (( coverage_trans.instr_dout[15:12] == LD) || (  coverage_trans.instr_dout[15:12] == LDI)|| ( coverage_trans.instr_dout[15:12] == LEA) || (  coverage_trans.instr_dout[15:12] == ST) || (  coverage_trans.instr_dout[15:12] == STI))
    {
       	bins b_0_to_511= {[0:511]};
    }

    ld_x_dr : cross op_ld, dreg_mem {}
    ld_x_pcoffset9 : cross op_ld, PC_offset_9_reg_mem_LD {}
    
    ldr_x_dr : cross op_ldr, dreg_mem {}
    ldr_x_baser : cross op_ldr, baser_mem {}
    ldr_x_pcoffset6 : cross op_ldr, PC_offset_6_reg_mem_LDR {}

    ldi_x_dr : cross op_ldi, dreg_mem {}
    ldi_x_pcoffset9 : cross op_ldi, PC_offset_9_reg_mem {}

    str_x_sr: cross op_str, sreg_mem {}
    str_x_baser: cross op_str, baser_mem {}
    str_x_pcoffset6: cross op_str, PC_offset_6_reg_mem {}

    st_x_sr : cross op_st, sreg_mem {}
    st_x_pcoffset9: cross op_st, PC_offset_9_reg_mem {}

    sti_x_sr: cross op_sti, sreg_mem {}
    sti_x_pcoffset9: cross op_sti, PC_offset_9_reg_mem {}

    lea_x_dr: cross op_lea, dreg_mem {}
    lea_x_pcoffset9: cross op_lea, PC_offset_9_reg_mem {}
  endgroup
  
  covergroup CTRL_operations;
  
    br_opcode :coverpoint coverage_trans.instr_dout[15:12] 
    {
        bins op_br = {0};
        bins op_jmp = {4'b1100};
    }
    
    NZP_reg : coverpoint coverage_trans.instr_dout[11:9] iff (coverage_trans.instr_dout[15:12] == 0)
    {
        ignore_bins zero_zero_zero = {3'b000};
    }

    pc_control : coverpoint coverage_trans.instr_dout[8:0] iff (coverage_trans.instr_dout[15:12] == 0)
    {
        bins zero_to_511_control = {[0:511]};
    }

    baser_control : coverpoint coverage_trans.instr_dout[8:6] iff (coverage_trans.instr_dout[15:12] == 4'b1100);
    
    op_jmp: coverpoint coverage_trans.instr_dout[15:12]{
      bins control_operations = {JMP};
    }
    op_br: coverpoint coverage_trans.instr_dout[15:12]{
      bins control_operations = {BR};
    }
    baser: coverpoint coverage_trans.instr_dout[8:6] iff (coverage_trans.instr_dout[15:12] == JMP)
    {
        bins b_0_to_7 = {[0:7]};
    }
    pcoffset9:  coverpoint  coverage_trans.instr_dout[8:0] iff ( coverage_trans.instr_dout[15:12] == BR)
    {
       	bins b_0_to_511= {[0:511]};
    }
    nzp: coverpoint coverage_trans.instr_dout[11:9] iff (coverage_trans.instr_dout[15:12] == BR)
    {
        bins b_0_to_7 = {[0:7]};
    }

    baser_x_jmp: cross op_jmp, baser {}
    nzp_x_br : cross op_br, nzp {}
    pcoffset9_x_br: cross op_br, pcoffset9 {}
  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    imem_transaction_cg=new;
    CTRL_operations=new;
    MEM_operations=new;
    ALU_operations=new;
    // `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    imem_transaction_cg.set_inst_name($sformatf("imem_transaction_cg_%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_MEDIUM);
    coverage_trans = t;
    case(t.instr_dout[15:12])
      4'b0110:  coverage_trans.baser = t.instr_dout[8:6];
      4'b0111:  coverage_trans.baser = t.instr_dout[8:6];
      4'b1100:  coverage_trans.baser = t.instr_dout[8:6];
    endcase
    imem_transaction_cg.sample();
    CTRL_operations.sample();
    MEM_operations.sample();
    ALU_operations.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

