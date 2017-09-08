//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2017 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_jtag_debug_module_arbitrator (
                                          // inputs:
                                           clk,
                                           cpu_data_master_address_to_slave,
                                           cpu_data_master_byteenable,
                                           cpu_data_master_debugaccess,
                                           cpu_data_master_read,
                                           cpu_data_master_waitrequest,
                                           cpu_data_master_write,
                                           cpu_data_master_writedata,
                                           cpu_instruction_master_address_to_slave,
                                           cpu_instruction_master_read,
                                           cpu_jtag_debug_module_readdata,
                                           cpu_jtag_debug_module_resetrequest,
                                           reset_n,

                                          // outputs:
                                           cpu_data_master_granted_cpu_jtag_debug_module,
                                           cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_data_master_requests_cpu_jtag_debug_module,
                                           cpu_instruction_master_granted_cpu_jtag_debug_module,
                                           cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                           cpu_instruction_master_requests_cpu_jtag_debug_module,
                                           cpu_jtag_debug_module_address,
                                           cpu_jtag_debug_module_begintransfer,
                                           cpu_jtag_debug_module_byteenable,
                                           cpu_jtag_debug_module_chipselect,
                                           cpu_jtag_debug_module_debugaccess,
                                           cpu_jtag_debug_module_readdata_from_sa,
                                           cpu_jtag_debug_module_reset,
                                           cpu_jtag_debug_module_reset_n,
                                           cpu_jtag_debug_module_resetrequest_from_sa,
                                           cpu_jtag_debug_module_write,
                                           cpu_jtag_debug_module_writedata,
                                           d1_cpu_jtag_debug_module_end_xfer
                                        )
;

  output           cpu_data_master_granted_cpu_jtag_debug_module;
  output           cpu_data_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_data_master_requests_cpu_jtag_debug_module;
  output           cpu_instruction_master_granted_cpu_jtag_debug_module;
  output           cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  output           cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  output           cpu_instruction_master_requests_cpu_jtag_debug_module;
  output  [  8: 0] cpu_jtag_debug_module_address;
  output           cpu_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_jtag_debug_module_byteenable;
  output           cpu_jtag_debug_module_chipselect;
  output           cpu_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  output           cpu_jtag_debug_module_reset;
  output           cpu_jtag_debug_module_reset_n;
  output           cpu_jtag_debug_module_resetrequest_from_sa;
  output           cpu_jtag_debug_module_write;
  output  [ 31: 0] cpu_jtag_debug_module_writedata;
  output           d1_cpu_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 13: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 13: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] cpu_jtag_debug_module_readdata;
  input            cpu_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_saved_grant_cpu_jtag_debug_module;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_saved_grant_cpu_jtag_debug_module;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_allgrants;
  wire             cpu_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_jtag_debug_module_arb_addend;
  wire             cpu_jtag_debug_module_arb_counter_enable;
  reg              cpu_jtag_debug_module_arb_share_counter;
  wire             cpu_jtag_debug_module_arb_share_counter_next_value;
  wire             cpu_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_jtag_debug_module_arb_winner;
  wire             cpu_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_jtag_debug_module_begins_xfer;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_jtag_debug_module_debugaccess;
  wire             cpu_jtag_debug_module_end_xfer;
  wire             cpu_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_jtag_debug_module_grant_vector;
  wire             cpu_jtag_debug_module_in_a_read_cycle;
  wire             cpu_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_jtag_debug_module_master_qreq_vector;
  wire             cpu_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  reg              cpu_jtag_debug_module_reg_firsttransfer;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_jtag_debug_module_waits_for_read;
  wire             cpu_jtag_debug_module_waits_for_write;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  reg              d1_cpu_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
  reg              last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
  wire    [ 13: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master;
  wire    [ 13: 0] shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master;
  wire             wait_for_cpu_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_jtag_debug_module_end_xfer;
    end


  assign cpu_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_cpu_jtag_debug_module | cpu_instruction_master_qualified_request_cpu_jtag_debug_module));
  //assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_readdata_from_sa = cpu_jtag_debug_module_readdata;

  assign cpu_data_master_requests_cpu_jtag_debug_module = ({cpu_data_master_address_to_slave[13 : 11] , 11'b0} == 14'h800) & (cpu_data_master_read | cpu_data_master_write);
  //cpu_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_jtag_debug_module_arb_share_set_values = 1;

  //cpu_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_jtag_debug_module_non_bursting_master_requests = cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module |
    cpu_data_master_requests_cpu_jtag_debug_module |
    cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_jtag_debug_module_arb_share_counter_next_value = cpu_jtag_debug_module_firsttransfer ? (cpu_jtag_debug_module_arb_share_set_values - 1) : |cpu_jtag_debug_module_arb_share_counter ? (cpu_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_jtag_debug_module_allgrants = (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector) |
    (|cpu_jtag_debug_module_grant_vector);

  //cpu_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_jtag_debug_module_end_xfer = ~(cpu_jtag_debug_module_waits_for_read | cpu_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_jtag_debug_module = cpu_jtag_debug_module_end_xfer & (~cpu_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & cpu_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests);

  //cpu_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_jtag_debug_module_arb_counter_enable)
          cpu_jtag_debug_module_arb_share_counter <= cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_jtag_debug_module & ~cpu_jtag_debug_module_non_bursting_master_requests))
          cpu_jtag_debug_module_slavearbiterlockenable <= |cpu_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu/data_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_data_master_continuerequest;

  //cpu_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_jtag_debug_module_slavearbiterlockenable2 = |cpu_jtag_debug_module_arb_share_counter_next_value;

  //cpu/data_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = cpu_jtag_debug_module_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master cpu/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = cpu_jtag_debug_module_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module <= cpu_instruction_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_instruction_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_cpu_jtag_debug_module & cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_jtag_debug_module_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_cpu_jtag_debug_module = cpu_data_master_requests_cpu_jtag_debug_module & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_jtag_debug_module_writedata = cpu_data_master_writedata;

  assign cpu_instruction_master_requests_cpu_jtag_debug_module = (({cpu_instruction_master_address_to_slave[13 : 11] , 11'b0} == 14'h800) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted cpu/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module <= cpu_data_master_saved_grant_cpu_jtag_debug_module ? 1 : (cpu_jtag_debug_module_arbitration_holdoff_internal | ~cpu_data_master_requests_cpu_jtag_debug_module) ? 0 : last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_cpu_jtag_debug_module & cpu_data_master_requests_cpu_jtag_debug_module;

  assign cpu_instruction_master_qualified_request_cpu_jtag_debug_module = cpu_instruction_master_requests_cpu_jtag_debug_module & ~(cpu_data_master_arbiterlock);
  //allow new arb cycle for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[0] = cpu_instruction_master_qualified_request_cpu_jtag_debug_module;

  //cpu/instruction_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[0];

  //cpu/instruction_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_instruction_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[0] && cpu_instruction_master_requests_cpu_jtag_debug_module;

  //cpu/data_master assignment into master qualified-requests vector for cpu/jtag_debug_module, which is an e_assign
  assign cpu_jtag_debug_module_master_qreq_vector[1] = cpu_data_master_qualified_request_cpu_jtag_debug_module;

  //cpu/data_master grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_granted_cpu_jtag_debug_module = cpu_jtag_debug_module_grant_vector[1];

  //cpu/data_master saved-grant cpu/jtag_debug_module, which is an e_assign
  assign cpu_data_master_saved_grant_cpu_jtag_debug_module = cpu_jtag_debug_module_arb_winner[1] && cpu_data_master_requests_cpu_jtag_debug_module;

  //cpu/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_double_vector = {cpu_jtag_debug_module_master_qreq_vector, cpu_jtag_debug_module_master_qreq_vector} & ({~cpu_jtag_debug_module_master_qreq_vector, ~cpu_jtag_debug_module_master_qreq_vector} + cpu_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_jtag_debug_module_arb_winner = (cpu_jtag_debug_module_allow_new_arb_cycle & | cpu_jtag_debug_module_grant_vector) ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_jtag_debug_module_allow_new_arb_cycle)
          cpu_jtag_debug_module_saved_chosen_master_vector <= |cpu_jtag_debug_module_grant_vector ? cpu_jtag_debug_module_grant_vector : cpu_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_jtag_debug_module_grant_vector = {(cpu_jtag_debug_module_chosen_master_double_vector[1] | cpu_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_jtag_debug_module_chosen_master_double_vector[0] | cpu_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_jtag_debug_module_chosen_master_rot_left = (cpu_jtag_debug_module_arb_winner << 1) ? (cpu_jtag_debug_module_arb_winner << 1) : 1;

  //cpu/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_jtag_debug_module_grant_vector)
          cpu_jtag_debug_module_arb_addend <= cpu_jtag_debug_module_end_xfer? cpu_jtag_debug_module_chosen_master_rot_left : cpu_jtag_debug_module_grant_vector;
    end


  assign cpu_jtag_debug_module_begintransfer = cpu_jtag_debug_module_begins_xfer;
  //assign lhs ~cpu_jtag_debug_module_reset of type reset_n to cpu_jtag_debug_module_reset_n, which is an e_assign
  assign cpu_jtag_debug_module_reset = ~cpu_jtag_debug_module_reset_n;

  //cpu_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_jtag_debug_module_reset_n = reset_n;

  //assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_jtag_debug_module_resetrequest_from_sa = cpu_jtag_debug_module_resetrequest;

  assign cpu_jtag_debug_module_chipselect = cpu_data_master_granted_cpu_jtag_debug_module | cpu_instruction_master_granted_cpu_jtag_debug_module;
  //cpu_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_firsttransfer = cpu_jtag_debug_module_begins_xfer ? cpu_jtag_debug_module_unreg_firsttransfer : cpu_jtag_debug_module_reg_firsttransfer;

  //cpu_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_jtag_debug_module_unreg_firsttransfer = ~(cpu_jtag_debug_module_slavearbiterlockenable & cpu_jtag_debug_module_any_continuerequest);

  //cpu_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_jtag_debug_module_begins_xfer)
          cpu_jtag_debug_module_reg_firsttransfer <= cpu_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_jtag_debug_module_beginbursttransfer_internal = cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_jtag_debug_module_arbitration_holdoff_internal = cpu_jtag_debug_module_begins_xfer & cpu_jtag_debug_module_firsttransfer;

  //cpu_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_jtag_debug_module_write = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master = cpu_data_master_address_to_slave;
  //cpu_jtag_debug_module_address mux, which is an e_mux
  assign cpu_jtag_debug_module_address = (cpu_data_master_granted_cpu_jtag_debug_module)? (shifted_address_to_cpu_jtag_debug_module_from_cpu_data_master >> 2) :
    (shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master >> 2);

  assign shifted_address_to_cpu_jtag_debug_module_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_cpu_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_jtag_debug_module_end_xfer <= cpu_jtag_debug_module_end_xfer;
    end


  //cpu_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_read = cpu_jtag_debug_module_in_a_read_cycle & cpu_jtag_debug_module_begins_xfer;

  //cpu_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_read_cycle = (cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_read) | (cpu_instruction_master_granted_cpu_jtag_debug_module & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_jtag_debug_module_in_a_read_cycle;

  //cpu_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_jtag_debug_module_waits_for_write = cpu_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_jtag_debug_module_in_a_write_cycle = cpu_data_master_granted_cpu_jtag_debug_module & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_jtag_debug_module_counter = 0;
  //cpu_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_jtag_debug_module_byteenable = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_jtag_debug_module_debugaccess = (cpu_data_master_granted_cpu_jtag_debug_module)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_cpu_jtag_debug_module + cpu_instruction_master_granted_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_cpu_jtag_debug_module + cpu_instruction_master_saved_grant_cpu_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_data_master_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_data_master_address,
                                     cpu_data_master_granted_cpu_jtag_debug_module,
                                     cpu_data_master_granted_data_s1,
                                     cpu_data_master_granted_led18_pio_s1,
                                     cpu_data_master_granted_program_s1,
                                     cpu_data_master_qualified_request_cpu_jtag_debug_module,
                                     cpu_data_master_qualified_request_data_s1,
                                     cpu_data_master_qualified_request_led18_pio_s1,
                                     cpu_data_master_qualified_request_program_s1,
                                     cpu_data_master_read,
                                     cpu_data_master_read_data_valid_cpu_jtag_debug_module,
                                     cpu_data_master_read_data_valid_data_s1,
                                     cpu_data_master_read_data_valid_led18_pio_s1,
                                     cpu_data_master_read_data_valid_program_s1,
                                     cpu_data_master_requests_cpu_jtag_debug_module,
                                     cpu_data_master_requests_data_s1,
                                     cpu_data_master_requests_led18_pio_s1,
                                     cpu_data_master_requests_program_s1,
                                     cpu_data_master_write,
                                     cpu_jtag_debug_module_readdata_from_sa,
                                     d1_cpu_jtag_debug_module_end_xfer,
                                     d1_data_s1_end_xfer,
                                     d1_led18_pio_s1_end_xfer,
                                     d1_program_s1_end_xfer,
                                     data_s1_readdata_from_sa,
                                     led18_pio_s1_readdata_from_sa,
                                     program_s1_readdata_from_sa,
                                     registered_cpu_data_master_read_data_valid_data_s1,
                                     registered_cpu_data_master_read_data_valid_program_s1,
                                     reset_n,

                                    // outputs:
                                     cpu_data_master_address_to_slave,
                                     cpu_data_master_readdata,
                                     cpu_data_master_waitrequest
                                  )
;

  output  [ 13: 0] cpu_data_master_address_to_slave;
  output  [ 31: 0] cpu_data_master_readdata;
  output           cpu_data_master_waitrequest;
  input            clk;
  input   [ 13: 0] cpu_data_master_address;
  input            cpu_data_master_granted_cpu_jtag_debug_module;
  input            cpu_data_master_granted_data_s1;
  input            cpu_data_master_granted_led18_pio_s1;
  input            cpu_data_master_granted_program_s1;
  input            cpu_data_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_data_master_qualified_request_data_s1;
  input            cpu_data_master_qualified_request_led18_pio_s1;
  input            cpu_data_master_qualified_request_program_s1;
  input            cpu_data_master_read;
  input            cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_data_master_read_data_valid_data_s1;
  input            cpu_data_master_read_data_valid_led18_pio_s1;
  input            cpu_data_master_read_data_valid_program_s1;
  input            cpu_data_master_requests_cpu_jtag_debug_module;
  input            cpu_data_master_requests_data_s1;
  input            cpu_data_master_requests_led18_pio_s1;
  input            cpu_data_master_requests_program_s1;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_data_s1_end_xfer;
  input            d1_led18_pio_s1_end_xfer;
  input            d1_program_s1_end_xfer;
  input   [ 31: 0] data_s1_readdata_from_sa;
  input   [ 17: 0] led18_pio_s1_readdata_from_sa;
  input   [ 31: 0] program_s1_readdata_from_sa;
  input            registered_cpu_data_master_read_data_valid_data_s1;
  input            registered_cpu_data_master_read_data_valid_program_s1;
  input            reset_n;

  wire    [ 13: 0] cpu_data_master_address_to_slave;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_run;
  reg              cpu_data_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_requests_cpu_jtag_debug_module) & (cpu_data_master_granted_cpu_jtag_debug_module | ~cpu_data_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_cpu_jtag_debug_module | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_data_s1 | registered_cpu_data_master_read_data_valid_data_s1 | ~cpu_data_master_requests_data_s1) & (cpu_data_master_granted_data_s1 | ~cpu_data_master_qualified_request_data_s1) & ((~cpu_data_master_qualified_request_data_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_data_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_data_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write)))) & 1 & (cpu_data_master_qualified_request_led18_pio_s1 | ~cpu_data_master_requests_led18_pio_s1) & ((~cpu_data_master_qualified_request_led18_pio_s1 | ~cpu_data_master_read | (1 & 1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_led18_pio_s1 | ~cpu_data_master_write | (1 & cpu_data_master_write))) & 1 & (cpu_data_master_qualified_request_program_s1 | registered_cpu_data_master_read_data_valid_program_s1 | ~cpu_data_master_requests_program_s1) & (cpu_data_master_granted_program_s1 | ~cpu_data_master_qualified_request_program_s1) & ((~cpu_data_master_qualified_request_program_s1 | ~cpu_data_master_read | (registered_cpu_data_master_read_data_valid_program_s1 & cpu_data_master_read))) & ((~cpu_data_master_qualified_request_program_s1 | ~(cpu_data_master_read | cpu_data_master_write) | (1 & (cpu_data_master_read | cpu_data_master_write))));

  //cascaded wait assignment, which is an e_assign
  assign cpu_data_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_data_master_address_to_slave = cpu_data_master_address[13 : 0];

  //cpu/data_master readdata mux, which is an e_mux
  assign cpu_data_master_readdata = ({32 {~cpu_data_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_data_s1}} | data_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_led18_pio_s1}} | led18_pio_s1_readdata_from_sa) &
    ({32 {~cpu_data_master_requests_program_s1}} | program_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_waitrequest <= ~0;
      else 
        cpu_data_master_waitrequest <= ~((~(cpu_data_master_read | cpu_data_master_write))? 0: (cpu_data_master_run & cpu_data_master_waitrequest));
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_instruction_master_arbitrator (
                                           // inputs:
                                            clk,
                                            cpu_instruction_master_address,
                                            cpu_instruction_master_granted_cpu_jtag_debug_module,
                                            cpu_instruction_master_granted_data_s1,
                                            cpu_instruction_master_granted_program_s1,
                                            cpu_instruction_master_qualified_request_cpu_jtag_debug_module,
                                            cpu_instruction_master_qualified_request_data_s1,
                                            cpu_instruction_master_qualified_request_program_s1,
                                            cpu_instruction_master_read,
                                            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module,
                                            cpu_instruction_master_read_data_valid_data_s1,
                                            cpu_instruction_master_read_data_valid_program_s1,
                                            cpu_instruction_master_requests_cpu_jtag_debug_module,
                                            cpu_instruction_master_requests_data_s1,
                                            cpu_instruction_master_requests_program_s1,
                                            cpu_jtag_debug_module_readdata_from_sa,
                                            d1_cpu_jtag_debug_module_end_xfer,
                                            d1_data_s1_end_xfer,
                                            d1_program_s1_end_xfer,
                                            data_s1_readdata_from_sa,
                                            program_s1_readdata_from_sa,
                                            reset_n,

                                           // outputs:
                                            cpu_instruction_master_address_to_slave,
                                            cpu_instruction_master_readdata,
                                            cpu_instruction_master_waitrequest
                                         )
;

  output  [ 13: 0] cpu_instruction_master_address_to_slave;
  output  [ 31: 0] cpu_instruction_master_readdata;
  output           cpu_instruction_master_waitrequest;
  input            clk;
  input   [ 13: 0] cpu_instruction_master_address;
  input            cpu_instruction_master_granted_cpu_jtag_debug_module;
  input            cpu_instruction_master_granted_data_s1;
  input            cpu_instruction_master_granted_program_s1;
  input            cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  input            cpu_instruction_master_qualified_request_data_s1;
  input            cpu_instruction_master_qualified_request_program_s1;
  input            cpu_instruction_master_read;
  input            cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  input            cpu_instruction_master_read_data_valid_data_s1;
  input            cpu_instruction_master_read_data_valid_program_s1;
  input            cpu_instruction_master_requests_cpu_jtag_debug_module;
  input            cpu_instruction_master_requests_data_s1;
  input            cpu_instruction_master_requests_program_s1;
  input   [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_jtag_debug_module_end_xfer;
  input            d1_data_s1_end_xfer;
  input            d1_program_s1_end_xfer;
  input   [ 31: 0] data_s1_readdata_from_sa;
  input   [ 31: 0] program_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 13: 0] cpu_instruction_master_address_last_time;
  wire    [ 13: 0] cpu_instruction_master_address_to_slave;
  reg              cpu_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_run;
  wire             cpu_instruction_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_requests_cpu_jtag_debug_module) & (cpu_instruction_master_granted_cpu_jtag_debug_module | ~cpu_instruction_master_qualified_request_cpu_jtag_debug_module) & ((~cpu_instruction_master_qualified_request_cpu_jtag_debug_module | ~cpu_instruction_master_read | (1 & ~d1_cpu_jtag_debug_module_end_xfer & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_data_s1 | cpu_instruction_master_read_data_valid_data_s1 | ~cpu_instruction_master_requests_data_s1) & (cpu_instruction_master_granted_data_s1 | ~cpu_instruction_master_qualified_request_data_s1) & ((~cpu_instruction_master_qualified_request_data_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_data_s1 & cpu_instruction_master_read))) & 1 & (cpu_instruction_master_qualified_request_program_s1 | cpu_instruction_master_read_data_valid_program_s1 | ~cpu_instruction_master_requests_program_s1) & (cpu_instruction_master_granted_program_s1 | ~cpu_instruction_master_qualified_request_program_s1) & ((~cpu_instruction_master_qualified_request_program_s1 | ~cpu_instruction_master_read | (cpu_instruction_master_read_data_valid_program_s1 & cpu_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_instruction_master_address_to_slave = cpu_instruction_master_address[13 : 0];

  //cpu/instruction_master readdata mux, which is an e_mux
  assign cpu_instruction_master_readdata = ({32 {~cpu_instruction_master_requests_cpu_jtag_debug_module}} | cpu_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_data_s1}} | data_s1_readdata_from_sa) &
    ({32 {~cpu_instruction_master_requests_program_s1}} | program_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_instruction_master_waitrequest = ~cpu_instruction_master_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_address_last_time <= 0;
      else 
        cpu_instruction_master_address_last_time <= cpu_instruction_master_address;
    end


  //cpu/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_instruction_master_waitrequest & (cpu_instruction_master_read);
    end


  //cpu_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_address != cpu_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_last_time <= 0;
      else 
        cpu_instruction_master_read_last_time <= cpu_instruction_master_read;
    end


  //cpu_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_instruction_master_read != cpu_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module data_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_data_master_address_to_slave,
                             cpu_data_master_byteenable,
                             cpu_data_master_read,
                             cpu_data_master_waitrequest,
                             cpu_data_master_write,
                             cpu_data_master_writedata,
                             cpu_instruction_master_address_to_slave,
                             cpu_instruction_master_read,
                             data_s1_readdata,
                             reset_n,

                            // outputs:
                             cpu_data_master_granted_data_s1,
                             cpu_data_master_qualified_request_data_s1,
                             cpu_data_master_read_data_valid_data_s1,
                             cpu_data_master_requests_data_s1,
                             cpu_instruction_master_granted_data_s1,
                             cpu_instruction_master_qualified_request_data_s1,
                             cpu_instruction_master_read_data_valid_data_s1,
                             cpu_instruction_master_requests_data_s1,
                             d1_data_s1_end_xfer,
                             data_s1_address,
                             data_s1_byteenable,
                             data_s1_chipselect,
                             data_s1_clken,
                             data_s1_readdata_from_sa,
                             data_s1_write,
                             data_s1_writedata,
                             registered_cpu_data_master_read_data_valid_data_s1
                          )
;

  output           cpu_data_master_granted_data_s1;
  output           cpu_data_master_qualified_request_data_s1;
  output           cpu_data_master_read_data_valid_data_s1;
  output           cpu_data_master_requests_data_s1;
  output           cpu_instruction_master_granted_data_s1;
  output           cpu_instruction_master_qualified_request_data_s1;
  output           cpu_instruction_master_read_data_valid_data_s1;
  output           cpu_instruction_master_requests_data_s1;
  output           d1_data_s1_end_xfer;
  output  [  9: 0] data_s1_address;
  output  [  3: 0] data_s1_byteenable;
  output           data_s1_chipselect;
  output           data_s1_clken;
  output  [ 31: 0] data_s1_readdata_from_sa;
  output           data_s1_write;
  output  [ 31: 0] data_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_data_s1;
  input            clk;
  input   [ 13: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 13: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] data_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_data_s1;
  wire             cpu_data_master_qualified_request_data_s1;
  wire             cpu_data_master_read_data_valid_data_s1;
  reg              cpu_data_master_read_data_valid_data_s1_shift_register;
  wire             cpu_data_master_read_data_valid_data_s1_shift_register_in;
  wire             cpu_data_master_requests_data_s1;
  wire             cpu_data_master_saved_grant_data_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_data_s1;
  wire             cpu_instruction_master_qualified_request_data_s1;
  wire             cpu_instruction_master_read_data_valid_data_s1;
  reg              cpu_instruction_master_read_data_valid_data_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_data_s1_shift_register_in;
  wire             cpu_instruction_master_requests_data_s1;
  wire             cpu_instruction_master_saved_grant_data_s1;
  reg              d1_data_s1_end_xfer;
  reg              d1_reasons_to_wait;
  wire    [  9: 0] data_s1_address;
  wire             data_s1_allgrants;
  wire             data_s1_allow_new_arb_cycle;
  wire             data_s1_any_bursting_master_saved_grant;
  wire             data_s1_any_continuerequest;
  reg     [  1: 0] data_s1_arb_addend;
  wire             data_s1_arb_counter_enable;
  reg              data_s1_arb_share_counter;
  wire             data_s1_arb_share_counter_next_value;
  wire             data_s1_arb_share_set_values;
  wire    [  1: 0] data_s1_arb_winner;
  wire             data_s1_arbitration_holdoff_internal;
  wire             data_s1_beginbursttransfer_internal;
  wire             data_s1_begins_xfer;
  wire    [  3: 0] data_s1_byteenable;
  wire             data_s1_chipselect;
  wire    [  3: 0] data_s1_chosen_master_double_vector;
  wire    [  1: 0] data_s1_chosen_master_rot_left;
  wire             data_s1_clken;
  wire             data_s1_end_xfer;
  wire             data_s1_firsttransfer;
  wire    [  1: 0] data_s1_grant_vector;
  wire             data_s1_in_a_read_cycle;
  wire             data_s1_in_a_write_cycle;
  wire    [  1: 0] data_s1_master_qreq_vector;
  wire             data_s1_non_bursting_master_requests;
  wire    [ 31: 0] data_s1_readdata_from_sa;
  reg              data_s1_reg_firsttransfer;
  reg     [  1: 0] data_s1_saved_chosen_master_vector;
  reg              data_s1_slavearbiterlockenable;
  wire             data_s1_slavearbiterlockenable2;
  wire             data_s1_unreg_firsttransfer;
  wire             data_s1_waits_for_read;
  wire             data_s1_waits_for_write;
  wire             data_s1_write;
  wire    [ 31: 0] data_s1_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_data_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_data_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_data_s1;
  wire             p1_cpu_data_master_read_data_valid_data_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_data_s1_shift_register;
  wire             registered_cpu_data_master_read_data_valid_data_s1;
  wire    [ 13: 0] shifted_address_to_data_s1_from_cpu_data_master;
  wire    [ 13: 0] shifted_address_to_data_s1_from_cpu_instruction_master;
  wire             wait_for_data_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~data_s1_end_xfer;
    end


  assign data_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_data_s1 | cpu_instruction_master_qualified_request_data_s1));
  //assign data_s1_readdata_from_sa = data_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign data_s1_readdata_from_sa = data_s1_readdata;

  assign cpu_data_master_requests_data_s1 = ({cpu_data_master_address_to_slave[13 : 12] , 12'b0} == 14'h3000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_data_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_data_s1 = cpu_data_master_read_data_valid_data_s1_shift_register_in;

  //data_s1_arb_share_counter set values, which is an e_mux
  assign data_s1_arb_share_set_values = 1;

  //data_s1_non_bursting_master_requests mux, which is an e_mux
  assign data_s1_non_bursting_master_requests = cpu_data_master_requests_data_s1 |
    cpu_instruction_master_requests_data_s1 |
    cpu_data_master_requests_data_s1 |
    cpu_instruction_master_requests_data_s1;

  //data_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign data_s1_any_bursting_master_saved_grant = 0;

  //data_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign data_s1_arb_share_counter_next_value = data_s1_firsttransfer ? (data_s1_arb_share_set_values - 1) : |data_s1_arb_share_counter ? (data_s1_arb_share_counter - 1) : 0;

  //data_s1_allgrants all slave grants, which is an e_mux
  assign data_s1_allgrants = (|data_s1_grant_vector) |
    (|data_s1_grant_vector) |
    (|data_s1_grant_vector) |
    (|data_s1_grant_vector);

  //data_s1_end_xfer assignment, which is an e_assign
  assign data_s1_end_xfer = ~(data_s1_waits_for_read | data_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_data_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_data_s1 = data_s1_end_xfer & (~data_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //data_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign data_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_data_s1 & data_s1_allgrants) | (end_xfer_arb_share_counter_term_data_s1 & ~data_s1_non_bursting_master_requests);

  //data_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_s1_arb_share_counter <= 0;
      else if (data_s1_arb_counter_enable)
          data_s1_arb_share_counter <= data_s1_arb_share_counter_next_value;
    end


  //data_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_s1_slavearbiterlockenable <= 0;
      else if ((|data_s1_master_qreq_vector & end_xfer_arb_share_counter_term_data_s1) | (end_xfer_arb_share_counter_term_data_s1 & ~data_s1_non_bursting_master_requests))
          data_s1_slavearbiterlockenable <= |data_s1_arb_share_counter_next_value;
    end


  //cpu/data_master data/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = data_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //data_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign data_s1_slavearbiterlockenable2 = |data_s1_arb_share_counter_next_value;

  //cpu/data_master data/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = data_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master data/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = data_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master data/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = data_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted data/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_data_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_data_s1 <= cpu_instruction_master_saved_grant_data_s1 ? 1 : (data_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_data_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_data_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_data_s1 & cpu_instruction_master_requests_data_s1;

  //data_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign data_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_data_s1 = cpu_data_master_requests_data_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_data_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_data_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_data_s1_shift_register_in = cpu_data_master_granted_data_s1 & cpu_data_master_read & ~data_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_data_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_data_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_data_s1_shift_register = {cpu_data_master_read_data_valid_data_s1_shift_register, cpu_data_master_read_data_valid_data_s1_shift_register_in};

  //cpu_data_master_read_data_valid_data_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_data_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_data_s1_shift_register <= p1_cpu_data_master_read_data_valid_data_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_data_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_data_s1 = cpu_data_master_read_data_valid_data_s1_shift_register;

  //data_s1_writedata mux, which is an e_mux
  assign data_s1_writedata = cpu_data_master_writedata;

  //mux data_s1_clken, which is an e_mux
  assign data_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_data_s1 = (({cpu_instruction_master_address_to_slave[13 : 12] , 12'b0} == 14'h3000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted data/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_data_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_data_s1 <= cpu_data_master_saved_grant_data_s1 ? 1 : (data_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_data_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_data_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_data_s1 & cpu_data_master_requests_data_s1;

  assign cpu_instruction_master_qualified_request_data_s1 = cpu_instruction_master_requests_data_s1 & ~((cpu_instruction_master_read & ((|cpu_instruction_master_read_data_valid_data_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_data_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_data_s1_shift_register_in = cpu_instruction_master_granted_data_s1 & cpu_instruction_master_read & ~data_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_data_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_data_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_data_s1_shift_register = {cpu_instruction_master_read_data_valid_data_s1_shift_register, cpu_instruction_master_read_data_valid_data_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_data_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_data_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_data_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_data_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_data_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_data_s1 = cpu_instruction_master_read_data_valid_data_s1_shift_register;

  //allow new arb cycle for data/s1, which is an e_assign
  assign data_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for data/s1, which is an e_assign
  assign data_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_data_s1;

  //cpu/instruction_master grant data/s1, which is an e_assign
  assign cpu_instruction_master_granted_data_s1 = data_s1_grant_vector[0];

  //cpu/instruction_master saved-grant data/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_data_s1 = data_s1_arb_winner[0] && cpu_instruction_master_requests_data_s1;

  //cpu/data_master assignment into master qualified-requests vector for data/s1, which is an e_assign
  assign data_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_data_s1;

  //cpu/data_master grant data/s1, which is an e_assign
  assign cpu_data_master_granted_data_s1 = data_s1_grant_vector[1];

  //cpu/data_master saved-grant data/s1, which is an e_assign
  assign cpu_data_master_saved_grant_data_s1 = data_s1_arb_winner[1] && cpu_data_master_requests_data_s1;

  //data/s1 chosen-master double-vector, which is an e_assign
  assign data_s1_chosen_master_double_vector = {data_s1_master_qreq_vector, data_s1_master_qreq_vector} & ({~data_s1_master_qreq_vector, ~data_s1_master_qreq_vector} + data_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign data_s1_arb_winner = (data_s1_allow_new_arb_cycle & | data_s1_grant_vector) ? data_s1_grant_vector : data_s1_saved_chosen_master_vector;

  //saved data_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_s1_saved_chosen_master_vector <= 0;
      else if (data_s1_allow_new_arb_cycle)
          data_s1_saved_chosen_master_vector <= |data_s1_grant_vector ? data_s1_grant_vector : data_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign data_s1_grant_vector = {(data_s1_chosen_master_double_vector[1] | data_s1_chosen_master_double_vector[3]),
    (data_s1_chosen_master_double_vector[0] | data_s1_chosen_master_double_vector[2])};

  //data/s1 chosen master rotated left, which is an e_assign
  assign data_s1_chosen_master_rot_left = (data_s1_arb_winner << 1) ? (data_s1_arb_winner << 1) : 1;

  //data/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_s1_arb_addend <= 1;
      else if (|data_s1_grant_vector)
          data_s1_arb_addend <= data_s1_end_xfer? data_s1_chosen_master_rot_left : data_s1_grant_vector;
    end


  assign data_s1_chipselect = cpu_data_master_granted_data_s1 | cpu_instruction_master_granted_data_s1;
  //data_s1_firsttransfer first transaction, which is an e_assign
  assign data_s1_firsttransfer = data_s1_begins_xfer ? data_s1_unreg_firsttransfer : data_s1_reg_firsttransfer;

  //data_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign data_s1_unreg_firsttransfer = ~(data_s1_slavearbiterlockenable & data_s1_any_continuerequest);

  //data_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_s1_reg_firsttransfer <= 1'b1;
      else if (data_s1_begins_xfer)
          data_s1_reg_firsttransfer <= data_s1_unreg_firsttransfer;
    end


  //data_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign data_s1_beginbursttransfer_internal = data_s1_begins_xfer;

  //data_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign data_s1_arbitration_holdoff_internal = data_s1_begins_xfer & data_s1_firsttransfer;

  //data_s1_write assignment, which is an e_mux
  assign data_s1_write = cpu_data_master_granted_data_s1 & cpu_data_master_write;

  assign shifted_address_to_data_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //data_s1_address mux, which is an e_mux
  assign data_s1_address = (cpu_data_master_granted_data_s1)? (shifted_address_to_data_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_data_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_data_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_data_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_data_s1_end_xfer <= 1;
      else 
        d1_data_s1_end_xfer <= data_s1_end_xfer;
    end


  //data_s1_waits_for_read in a cycle, which is an e_mux
  assign data_s1_waits_for_read = data_s1_in_a_read_cycle & 0;

  //data_s1_in_a_read_cycle assignment, which is an e_assign
  assign data_s1_in_a_read_cycle = (cpu_data_master_granted_data_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_data_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = data_s1_in_a_read_cycle;

  //data_s1_waits_for_write in a cycle, which is an e_mux
  assign data_s1_waits_for_write = data_s1_in_a_write_cycle & 0;

  //data_s1_in_a_write_cycle assignment, which is an e_assign
  assign data_s1_in_a_write_cycle = cpu_data_master_granted_data_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = data_s1_in_a_write_cycle;

  assign wait_for_data_s1_counter = 0;
  //data_s1_byteenable byte enable port mux, which is an e_mux
  assign data_s1_byteenable = (cpu_data_master_granted_data_s1)? cpu_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //data/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_data_s1 + cpu_instruction_master_granted_data_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_data_s1 + cpu_instruction_master_saved_grant_data_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led18_pio_s1_arbitrator (
                                 // inputs:
                                  clk,
                                  cpu_data_master_address_to_slave,
                                  cpu_data_master_read,
                                  cpu_data_master_waitrequest,
                                  cpu_data_master_write,
                                  cpu_data_master_writedata,
                                  led18_pio_s1_readdata,
                                  reset_n,

                                 // outputs:
                                  cpu_data_master_granted_led18_pio_s1,
                                  cpu_data_master_qualified_request_led18_pio_s1,
                                  cpu_data_master_read_data_valid_led18_pio_s1,
                                  cpu_data_master_requests_led18_pio_s1,
                                  d1_led18_pio_s1_end_xfer,
                                  led18_pio_s1_address,
                                  led18_pio_s1_chipselect,
                                  led18_pio_s1_readdata_from_sa,
                                  led18_pio_s1_reset_n,
                                  led18_pio_s1_write_n,
                                  led18_pio_s1_writedata
                               )
;

  output           cpu_data_master_granted_led18_pio_s1;
  output           cpu_data_master_qualified_request_led18_pio_s1;
  output           cpu_data_master_read_data_valid_led18_pio_s1;
  output           cpu_data_master_requests_led18_pio_s1;
  output           d1_led18_pio_s1_end_xfer;
  output  [  1: 0] led18_pio_s1_address;
  output           led18_pio_s1_chipselect;
  output  [ 17: 0] led18_pio_s1_readdata_from_sa;
  output           led18_pio_s1_reset_n;
  output           led18_pio_s1_write_n;
  output  [ 17: 0] led18_pio_s1_writedata;
  input            clk;
  input   [ 13: 0] cpu_data_master_address_to_slave;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 17: 0] led18_pio_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_led18_pio_s1;
  wire             cpu_data_master_qualified_request_led18_pio_s1;
  wire             cpu_data_master_read_data_valid_led18_pio_s1;
  wire             cpu_data_master_requests_led18_pio_s1;
  wire             cpu_data_master_saved_grant_led18_pio_s1;
  reg              d1_led18_pio_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_led18_pio_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] led18_pio_s1_address;
  wire             led18_pio_s1_allgrants;
  wire             led18_pio_s1_allow_new_arb_cycle;
  wire             led18_pio_s1_any_bursting_master_saved_grant;
  wire             led18_pio_s1_any_continuerequest;
  wire             led18_pio_s1_arb_counter_enable;
  reg              led18_pio_s1_arb_share_counter;
  wire             led18_pio_s1_arb_share_counter_next_value;
  wire             led18_pio_s1_arb_share_set_values;
  wire             led18_pio_s1_beginbursttransfer_internal;
  wire             led18_pio_s1_begins_xfer;
  wire             led18_pio_s1_chipselect;
  wire             led18_pio_s1_end_xfer;
  wire             led18_pio_s1_firsttransfer;
  wire             led18_pio_s1_grant_vector;
  wire             led18_pio_s1_in_a_read_cycle;
  wire             led18_pio_s1_in_a_write_cycle;
  wire             led18_pio_s1_master_qreq_vector;
  wire             led18_pio_s1_non_bursting_master_requests;
  wire    [ 17: 0] led18_pio_s1_readdata_from_sa;
  reg              led18_pio_s1_reg_firsttransfer;
  wire             led18_pio_s1_reset_n;
  reg              led18_pio_s1_slavearbiterlockenable;
  wire             led18_pio_s1_slavearbiterlockenable2;
  wire             led18_pio_s1_unreg_firsttransfer;
  wire             led18_pio_s1_waits_for_read;
  wire             led18_pio_s1_waits_for_write;
  wire             led18_pio_s1_write_n;
  wire    [ 17: 0] led18_pio_s1_writedata;
  wire    [ 13: 0] shifted_address_to_led18_pio_s1_from_cpu_data_master;
  wire             wait_for_led18_pio_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~led18_pio_s1_end_xfer;
    end


  assign led18_pio_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_led18_pio_s1));
  //assign led18_pio_s1_readdata_from_sa = led18_pio_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign led18_pio_s1_readdata_from_sa = led18_pio_s1_readdata;

  assign cpu_data_master_requests_led18_pio_s1 = ({cpu_data_master_address_to_slave[13 : 4] , 4'b0} == 14'h0) & (cpu_data_master_read | cpu_data_master_write);
  //led18_pio_s1_arb_share_counter set values, which is an e_mux
  assign led18_pio_s1_arb_share_set_values = 1;

  //led18_pio_s1_non_bursting_master_requests mux, which is an e_mux
  assign led18_pio_s1_non_bursting_master_requests = cpu_data_master_requests_led18_pio_s1;

  //led18_pio_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign led18_pio_s1_any_bursting_master_saved_grant = 0;

  //led18_pio_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign led18_pio_s1_arb_share_counter_next_value = led18_pio_s1_firsttransfer ? (led18_pio_s1_arb_share_set_values - 1) : |led18_pio_s1_arb_share_counter ? (led18_pio_s1_arb_share_counter - 1) : 0;

  //led18_pio_s1_allgrants all slave grants, which is an e_mux
  assign led18_pio_s1_allgrants = |led18_pio_s1_grant_vector;

  //led18_pio_s1_end_xfer assignment, which is an e_assign
  assign led18_pio_s1_end_xfer = ~(led18_pio_s1_waits_for_read | led18_pio_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_led18_pio_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_led18_pio_s1 = led18_pio_s1_end_xfer & (~led18_pio_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //led18_pio_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign led18_pio_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_led18_pio_s1 & led18_pio_s1_allgrants) | (end_xfer_arb_share_counter_term_led18_pio_s1 & ~led18_pio_s1_non_bursting_master_requests);

  //led18_pio_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led18_pio_s1_arb_share_counter <= 0;
      else if (led18_pio_s1_arb_counter_enable)
          led18_pio_s1_arb_share_counter <= led18_pio_s1_arb_share_counter_next_value;
    end


  //led18_pio_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led18_pio_s1_slavearbiterlockenable <= 0;
      else if ((|led18_pio_s1_master_qreq_vector & end_xfer_arb_share_counter_term_led18_pio_s1) | (end_xfer_arb_share_counter_term_led18_pio_s1 & ~led18_pio_s1_non_bursting_master_requests))
          led18_pio_s1_slavearbiterlockenable <= |led18_pio_s1_arb_share_counter_next_value;
    end


  //cpu/data_master led18_pio/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = led18_pio_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //led18_pio_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign led18_pio_s1_slavearbiterlockenable2 = |led18_pio_s1_arb_share_counter_next_value;

  //cpu/data_master led18_pio/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = led18_pio_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //led18_pio_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign led18_pio_s1_any_continuerequest = 1;

  //cpu_data_master_continuerequest continued request, which is an e_assign
  assign cpu_data_master_continuerequest = 1;

  assign cpu_data_master_qualified_request_led18_pio_s1 = cpu_data_master_requests_led18_pio_s1 & ~(((~cpu_data_master_waitrequest) & cpu_data_master_write));
  //led18_pio_s1_writedata mux, which is an e_mux
  assign led18_pio_s1_writedata = cpu_data_master_writedata;

  //master is always granted when requested
  assign cpu_data_master_granted_led18_pio_s1 = cpu_data_master_qualified_request_led18_pio_s1;

  //cpu/data_master saved-grant led18_pio/s1, which is an e_assign
  assign cpu_data_master_saved_grant_led18_pio_s1 = cpu_data_master_requests_led18_pio_s1;

  //allow new arb cycle for led18_pio/s1, which is an e_assign
  assign led18_pio_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign led18_pio_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign led18_pio_s1_master_qreq_vector = 1;

  //led18_pio_s1_reset_n assignment, which is an e_assign
  assign led18_pio_s1_reset_n = reset_n;

  assign led18_pio_s1_chipselect = cpu_data_master_granted_led18_pio_s1;
  //led18_pio_s1_firsttransfer first transaction, which is an e_assign
  assign led18_pio_s1_firsttransfer = led18_pio_s1_begins_xfer ? led18_pio_s1_unreg_firsttransfer : led18_pio_s1_reg_firsttransfer;

  //led18_pio_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign led18_pio_s1_unreg_firsttransfer = ~(led18_pio_s1_slavearbiterlockenable & led18_pio_s1_any_continuerequest);

  //led18_pio_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          led18_pio_s1_reg_firsttransfer <= 1'b1;
      else if (led18_pio_s1_begins_xfer)
          led18_pio_s1_reg_firsttransfer <= led18_pio_s1_unreg_firsttransfer;
    end


  //led18_pio_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign led18_pio_s1_beginbursttransfer_internal = led18_pio_s1_begins_xfer;

  //~led18_pio_s1_write_n assignment, which is an e_mux
  assign led18_pio_s1_write_n = ~(cpu_data_master_granted_led18_pio_s1 & cpu_data_master_write);

  assign shifted_address_to_led18_pio_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //led18_pio_s1_address mux, which is an e_mux
  assign led18_pio_s1_address = shifted_address_to_led18_pio_s1_from_cpu_data_master >> 2;

  //d1_led18_pio_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_led18_pio_s1_end_xfer <= 1;
      else 
        d1_led18_pio_s1_end_xfer <= led18_pio_s1_end_xfer;
    end


  //led18_pio_s1_waits_for_read in a cycle, which is an e_mux
  assign led18_pio_s1_waits_for_read = led18_pio_s1_in_a_read_cycle & led18_pio_s1_begins_xfer;

  //led18_pio_s1_in_a_read_cycle assignment, which is an e_assign
  assign led18_pio_s1_in_a_read_cycle = cpu_data_master_granted_led18_pio_s1 & cpu_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = led18_pio_s1_in_a_read_cycle;

  //led18_pio_s1_waits_for_write in a cycle, which is an e_mux
  assign led18_pio_s1_waits_for_write = led18_pio_s1_in_a_write_cycle & 0;

  //led18_pio_s1_in_a_write_cycle assignment, which is an e_assign
  assign led18_pio_s1_in_a_write_cycle = cpu_data_master_granted_led18_pio_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = led18_pio_s1_in_a_write_cycle;

  assign wait_for_led18_pio_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //led18_pio/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module program_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_data_master_address_to_slave,
                                cpu_data_master_byteenable,
                                cpu_data_master_debugaccess,
                                cpu_data_master_read,
                                cpu_data_master_waitrequest,
                                cpu_data_master_write,
                                cpu_data_master_writedata,
                                cpu_instruction_master_address_to_slave,
                                cpu_instruction_master_read,
                                program_s1_readdata,
                                reset_n,

                               // outputs:
                                cpu_data_master_granted_program_s1,
                                cpu_data_master_qualified_request_program_s1,
                                cpu_data_master_read_data_valid_program_s1,
                                cpu_data_master_requests_program_s1,
                                cpu_instruction_master_granted_program_s1,
                                cpu_instruction_master_qualified_request_program_s1,
                                cpu_instruction_master_read_data_valid_program_s1,
                                cpu_instruction_master_requests_program_s1,
                                d1_program_s1_end_xfer,
                                program_s1_address,
                                program_s1_byteenable,
                                program_s1_chipselect,
                                program_s1_clken,
                                program_s1_debugaccess,
                                program_s1_readdata_from_sa,
                                program_s1_write,
                                program_s1_writedata,
                                registered_cpu_data_master_read_data_valid_program_s1
                             )
;

  output           cpu_data_master_granted_program_s1;
  output           cpu_data_master_qualified_request_program_s1;
  output           cpu_data_master_read_data_valid_program_s1;
  output           cpu_data_master_requests_program_s1;
  output           cpu_instruction_master_granted_program_s1;
  output           cpu_instruction_master_qualified_request_program_s1;
  output           cpu_instruction_master_read_data_valid_program_s1;
  output           cpu_instruction_master_requests_program_s1;
  output           d1_program_s1_end_xfer;
  output  [  9: 0] program_s1_address;
  output  [  3: 0] program_s1_byteenable;
  output           program_s1_chipselect;
  output           program_s1_clken;
  output           program_s1_debugaccess;
  output  [ 31: 0] program_s1_readdata_from_sa;
  output           program_s1_write;
  output  [ 31: 0] program_s1_writedata;
  output           registered_cpu_data_master_read_data_valid_program_s1;
  input            clk;
  input   [ 13: 0] cpu_data_master_address_to_slave;
  input   [  3: 0] cpu_data_master_byteenable;
  input            cpu_data_master_debugaccess;
  input            cpu_data_master_read;
  input            cpu_data_master_waitrequest;
  input            cpu_data_master_write;
  input   [ 31: 0] cpu_data_master_writedata;
  input   [ 13: 0] cpu_instruction_master_address_to_slave;
  input            cpu_instruction_master_read;
  input   [ 31: 0] program_s1_readdata;
  input            reset_n;

  wire             cpu_data_master_arbiterlock;
  wire             cpu_data_master_arbiterlock2;
  wire             cpu_data_master_continuerequest;
  wire             cpu_data_master_granted_program_s1;
  wire             cpu_data_master_qualified_request_program_s1;
  wire             cpu_data_master_read_data_valid_program_s1;
  reg              cpu_data_master_read_data_valid_program_s1_shift_register;
  wire             cpu_data_master_read_data_valid_program_s1_shift_register_in;
  wire             cpu_data_master_requests_program_s1;
  wire             cpu_data_master_saved_grant_program_s1;
  wire             cpu_instruction_master_arbiterlock;
  wire             cpu_instruction_master_arbiterlock2;
  wire             cpu_instruction_master_continuerequest;
  wire             cpu_instruction_master_granted_program_s1;
  wire             cpu_instruction_master_qualified_request_program_s1;
  wire             cpu_instruction_master_read_data_valid_program_s1;
  reg              cpu_instruction_master_read_data_valid_program_s1_shift_register;
  wire             cpu_instruction_master_read_data_valid_program_s1_shift_register_in;
  wire             cpu_instruction_master_requests_program_s1;
  wire             cpu_instruction_master_saved_grant_program_s1;
  reg              d1_program_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_program_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_data_master_granted_slave_program_s1;
  reg              last_cycle_cpu_instruction_master_granted_slave_program_s1;
  wire             p1_cpu_data_master_read_data_valid_program_s1_shift_register;
  wire             p1_cpu_instruction_master_read_data_valid_program_s1_shift_register;
  wire    [  9: 0] program_s1_address;
  wire             program_s1_allgrants;
  wire             program_s1_allow_new_arb_cycle;
  wire             program_s1_any_bursting_master_saved_grant;
  wire             program_s1_any_continuerequest;
  reg     [  1: 0] program_s1_arb_addend;
  wire             program_s1_arb_counter_enable;
  reg              program_s1_arb_share_counter;
  wire             program_s1_arb_share_counter_next_value;
  wire             program_s1_arb_share_set_values;
  wire    [  1: 0] program_s1_arb_winner;
  wire             program_s1_arbitration_holdoff_internal;
  wire             program_s1_beginbursttransfer_internal;
  wire             program_s1_begins_xfer;
  wire    [  3: 0] program_s1_byteenable;
  wire             program_s1_chipselect;
  wire    [  3: 0] program_s1_chosen_master_double_vector;
  wire    [  1: 0] program_s1_chosen_master_rot_left;
  wire             program_s1_clken;
  wire             program_s1_debugaccess;
  wire             program_s1_end_xfer;
  wire             program_s1_firsttransfer;
  wire    [  1: 0] program_s1_grant_vector;
  wire             program_s1_in_a_read_cycle;
  wire             program_s1_in_a_write_cycle;
  wire    [  1: 0] program_s1_master_qreq_vector;
  wire             program_s1_non_bursting_master_requests;
  wire    [ 31: 0] program_s1_readdata_from_sa;
  reg              program_s1_reg_firsttransfer;
  reg     [  1: 0] program_s1_saved_chosen_master_vector;
  reg              program_s1_slavearbiterlockenable;
  wire             program_s1_slavearbiterlockenable2;
  wire             program_s1_unreg_firsttransfer;
  wire             program_s1_waits_for_read;
  wire             program_s1_waits_for_write;
  wire             program_s1_write;
  wire    [ 31: 0] program_s1_writedata;
  wire             registered_cpu_data_master_read_data_valid_program_s1;
  wire    [ 13: 0] shifted_address_to_program_s1_from_cpu_data_master;
  wire    [ 13: 0] shifted_address_to_program_s1_from_cpu_instruction_master;
  wire             wait_for_program_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~program_s1_end_xfer;
    end


  assign program_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_data_master_qualified_request_program_s1 | cpu_instruction_master_qualified_request_program_s1));
  //assign program_s1_readdata_from_sa = program_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign program_s1_readdata_from_sa = program_s1_readdata;

  assign cpu_data_master_requests_program_s1 = ({cpu_data_master_address_to_slave[13 : 12] , 12'b0} == 14'h2000) & (cpu_data_master_read | cpu_data_master_write);
  //registered rdv signal_name registered_cpu_data_master_read_data_valid_program_s1 assignment, which is an e_assign
  assign registered_cpu_data_master_read_data_valid_program_s1 = cpu_data_master_read_data_valid_program_s1_shift_register_in;

  //program_s1_arb_share_counter set values, which is an e_mux
  assign program_s1_arb_share_set_values = 1;

  //program_s1_non_bursting_master_requests mux, which is an e_mux
  assign program_s1_non_bursting_master_requests = cpu_data_master_requests_program_s1 |
    cpu_instruction_master_requests_program_s1 |
    cpu_data_master_requests_program_s1 |
    cpu_instruction_master_requests_program_s1;

  //program_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign program_s1_any_bursting_master_saved_grant = 0;

  //program_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign program_s1_arb_share_counter_next_value = program_s1_firsttransfer ? (program_s1_arb_share_set_values - 1) : |program_s1_arb_share_counter ? (program_s1_arb_share_counter - 1) : 0;

  //program_s1_allgrants all slave grants, which is an e_mux
  assign program_s1_allgrants = (|program_s1_grant_vector) |
    (|program_s1_grant_vector) |
    (|program_s1_grant_vector) |
    (|program_s1_grant_vector);

  //program_s1_end_xfer assignment, which is an e_assign
  assign program_s1_end_xfer = ~(program_s1_waits_for_read | program_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_program_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_program_s1 = program_s1_end_xfer & (~program_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //program_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign program_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_program_s1 & program_s1_allgrants) | (end_xfer_arb_share_counter_term_program_s1 & ~program_s1_non_bursting_master_requests);

  //program_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          program_s1_arb_share_counter <= 0;
      else if (program_s1_arb_counter_enable)
          program_s1_arb_share_counter <= program_s1_arb_share_counter_next_value;
    end


  //program_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          program_s1_slavearbiterlockenable <= 0;
      else if ((|program_s1_master_qreq_vector & end_xfer_arb_share_counter_term_program_s1) | (end_xfer_arb_share_counter_term_program_s1 & ~program_s1_non_bursting_master_requests))
          program_s1_slavearbiterlockenable <= |program_s1_arb_share_counter_next_value;
    end


  //cpu/data_master program/s1 arbiterlock, which is an e_assign
  assign cpu_data_master_arbiterlock = program_s1_slavearbiterlockenable & cpu_data_master_continuerequest;

  //program_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign program_s1_slavearbiterlockenable2 = |program_s1_arb_share_counter_next_value;

  //cpu/data_master program/s1 arbiterlock2, which is an e_assign
  assign cpu_data_master_arbiterlock2 = program_s1_slavearbiterlockenable2 & cpu_data_master_continuerequest;

  //cpu/instruction_master program/s1 arbiterlock, which is an e_assign
  assign cpu_instruction_master_arbiterlock = program_s1_slavearbiterlockenable & cpu_instruction_master_continuerequest;

  //cpu/instruction_master program/s1 arbiterlock2, which is an e_assign
  assign cpu_instruction_master_arbiterlock2 = program_s1_slavearbiterlockenable2 & cpu_instruction_master_continuerequest;

  //cpu/instruction_master granted program/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_instruction_master_granted_slave_program_s1 <= 0;
      else 
        last_cycle_cpu_instruction_master_granted_slave_program_s1 <= cpu_instruction_master_saved_grant_program_s1 ? 1 : (program_s1_arbitration_holdoff_internal | ~cpu_instruction_master_requests_program_s1) ? 0 : last_cycle_cpu_instruction_master_granted_slave_program_s1;
    end


  //cpu_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_instruction_master_continuerequest = last_cycle_cpu_instruction_master_granted_slave_program_s1 & cpu_instruction_master_requests_program_s1;

  //program_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign program_s1_any_continuerequest = cpu_instruction_master_continuerequest |
    cpu_data_master_continuerequest;

  assign cpu_data_master_qualified_request_program_s1 = cpu_data_master_requests_program_s1 & ~((cpu_data_master_read & ((|cpu_data_master_read_data_valid_program_s1_shift_register))) | ((~cpu_data_master_waitrequest) & cpu_data_master_write) | cpu_instruction_master_arbiterlock);
  //cpu_data_master_read_data_valid_program_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_data_master_read_data_valid_program_s1_shift_register_in = cpu_data_master_granted_program_s1 & cpu_data_master_read & ~program_s1_waits_for_read & ~(|cpu_data_master_read_data_valid_program_s1_shift_register);

  //shift register p1 cpu_data_master_read_data_valid_program_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_data_master_read_data_valid_program_s1_shift_register = {cpu_data_master_read_data_valid_program_s1_shift_register, cpu_data_master_read_data_valid_program_s1_shift_register_in};

  //cpu_data_master_read_data_valid_program_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_data_master_read_data_valid_program_s1_shift_register <= 0;
      else 
        cpu_data_master_read_data_valid_program_s1_shift_register <= p1_cpu_data_master_read_data_valid_program_s1_shift_register;
    end


  //local readdatavalid cpu_data_master_read_data_valid_program_s1, which is an e_mux
  assign cpu_data_master_read_data_valid_program_s1 = cpu_data_master_read_data_valid_program_s1_shift_register;

  //program_s1_writedata mux, which is an e_mux
  assign program_s1_writedata = cpu_data_master_writedata;

  //mux program_s1_clken, which is an e_mux
  assign program_s1_clken = 1'b1;

  assign cpu_instruction_master_requests_program_s1 = (({cpu_instruction_master_address_to_slave[13 : 12] , 12'b0} == 14'h2000) & (cpu_instruction_master_read)) & cpu_instruction_master_read;
  //cpu/data_master granted program/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_data_master_granted_slave_program_s1 <= 0;
      else 
        last_cycle_cpu_data_master_granted_slave_program_s1 <= cpu_data_master_saved_grant_program_s1 ? 1 : (program_s1_arbitration_holdoff_internal | ~cpu_data_master_requests_program_s1) ? 0 : last_cycle_cpu_data_master_granted_slave_program_s1;
    end


  //cpu_data_master_continuerequest continued request, which is an e_mux
  assign cpu_data_master_continuerequest = last_cycle_cpu_data_master_granted_slave_program_s1 & cpu_data_master_requests_program_s1;

  assign cpu_instruction_master_qualified_request_program_s1 = cpu_instruction_master_requests_program_s1 & ~((cpu_instruction_master_read & ((|cpu_instruction_master_read_data_valid_program_s1_shift_register))) | cpu_data_master_arbiterlock);
  //cpu_instruction_master_read_data_valid_program_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_instruction_master_read_data_valid_program_s1_shift_register_in = cpu_instruction_master_granted_program_s1 & cpu_instruction_master_read & ~program_s1_waits_for_read & ~(|cpu_instruction_master_read_data_valid_program_s1_shift_register);

  //shift register p1 cpu_instruction_master_read_data_valid_program_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_instruction_master_read_data_valid_program_s1_shift_register = {cpu_instruction_master_read_data_valid_program_s1_shift_register, cpu_instruction_master_read_data_valid_program_s1_shift_register_in};

  //cpu_instruction_master_read_data_valid_program_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_instruction_master_read_data_valid_program_s1_shift_register <= 0;
      else 
        cpu_instruction_master_read_data_valid_program_s1_shift_register <= p1_cpu_instruction_master_read_data_valid_program_s1_shift_register;
    end


  //local readdatavalid cpu_instruction_master_read_data_valid_program_s1, which is an e_mux
  assign cpu_instruction_master_read_data_valid_program_s1 = cpu_instruction_master_read_data_valid_program_s1_shift_register;

  //allow new arb cycle for program/s1, which is an e_assign
  assign program_s1_allow_new_arb_cycle = ~cpu_data_master_arbiterlock & ~cpu_instruction_master_arbiterlock;

  //cpu/instruction_master assignment into master qualified-requests vector for program/s1, which is an e_assign
  assign program_s1_master_qreq_vector[0] = cpu_instruction_master_qualified_request_program_s1;

  //cpu/instruction_master grant program/s1, which is an e_assign
  assign cpu_instruction_master_granted_program_s1 = program_s1_grant_vector[0];

  //cpu/instruction_master saved-grant program/s1, which is an e_assign
  assign cpu_instruction_master_saved_grant_program_s1 = program_s1_arb_winner[0] && cpu_instruction_master_requests_program_s1;

  //cpu/data_master assignment into master qualified-requests vector for program/s1, which is an e_assign
  assign program_s1_master_qreq_vector[1] = cpu_data_master_qualified_request_program_s1;

  //cpu/data_master grant program/s1, which is an e_assign
  assign cpu_data_master_granted_program_s1 = program_s1_grant_vector[1];

  //cpu/data_master saved-grant program/s1, which is an e_assign
  assign cpu_data_master_saved_grant_program_s1 = program_s1_arb_winner[1] && cpu_data_master_requests_program_s1;

  //program/s1 chosen-master double-vector, which is an e_assign
  assign program_s1_chosen_master_double_vector = {program_s1_master_qreq_vector, program_s1_master_qreq_vector} & ({~program_s1_master_qreq_vector, ~program_s1_master_qreq_vector} + program_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign program_s1_arb_winner = (program_s1_allow_new_arb_cycle & | program_s1_grant_vector) ? program_s1_grant_vector : program_s1_saved_chosen_master_vector;

  //saved program_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          program_s1_saved_chosen_master_vector <= 0;
      else if (program_s1_allow_new_arb_cycle)
          program_s1_saved_chosen_master_vector <= |program_s1_grant_vector ? program_s1_grant_vector : program_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign program_s1_grant_vector = {(program_s1_chosen_master_double_vector[1] | program_s1_chosen_master_double_vector[3]),
    (program_s1_chosen_master_double_vector[0] | program_s1_chosen_master_double_vector[2])};

  //program/s1 chosen master rotated left, which is an e_assign
  assign program_s1_chosen_master_rot_left = (program_s1_arb_winner << 1) ? (program_s1_arb_winner << 1) : 1;

  //program/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          program_s1_arb_addend <= 1;
      else if (|program_s1_grant_vector)
          program_s1_arb_addend <= program_s1_end_xfer? program_s1_chosen_master_rot_left : program_s1_grant_vector;
    end


  assign program_s1_chipselect = cpu_data_master_granted_program_s1 | cpu_instruction_master_granted_program_s1;
  //program_s1_firsttransfer first transaction, which is an e_assign
  assign program_s1_firsttransfer = program_s1_begins_xfer ? program_s1_unreg_firsttransfer : program_s1_reg_firsttransfer;

  //program_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign program_s1_unreg_firsttransfer = ~(program_s1_slavearbiterlockenable & program_s1_any_continuerequest);

  //program_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          program_s1_reg_firsttransfer <= 1'b1;
      else if (program_s1_begins_xfer)
          program_s1_reg_firsttransfer <= program_s1_unreg_firsttransfer;
    end


  //program_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign program_s1_beginbursttransfer_internal = program_s1_begins_xfer;

  //program_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign program_s1_arbitration_holdoff_internal = program_s1_begins_xfer & program_s1_firsttransfer;

  //program_s1_write assignment, which is an e_mux
  assign program_s1_write = cpu_data_master_granted_program_s1 & cpu_data_master_write;

  assign shifted_address_to_program_s1_from_cpu_data_master = cpu_data_master_address_to_slave;
  //program_s1_address mux, which is an e_mux
  assign program_s1_address = (cpu_data_master_granted_program_s1)? (shifted_address_to_program_s1_from_cpu_data_master >> 2) :
    (shifted_address_to_program_s1_from_cpu_instruction_master >> 2);

  assign shifted_address_to_program_s1_from_cpu_instruction_master = cpu_instruction_master_address_to_slave;
  //d1_program_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_program_s1_end_xfer <= 1;
      else 
        d1_program_s1_end_xfer <= program_s1_end_xfer;
    end


  //program_s1_waits_for_read in a cycle, which is an e_mux
  assign program_s1_waits_for_read = program_s1_in_a_read_cycle & 0;

  //program_s1_in_a_read_cycle assignment, which is an e_assign
  assign program_s1_in_a_read_cycle = (cpu_data_master_granted_program_s1 & cpu_data_master_read) | (cpu_instruction_master_granted_program_s1 & cpu_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = program_s1_in_a_read_cycle;

  //program_s1_waits_for_write in a cycle, which is an e_mux
  assign program_s1_waits_for_write = program_s1_in_a_write_cycle & 0;

  //program_s1_in_a_write_cycle assignment, which is an e_assign
  assign program_s1_in_a_write_cycle = cpu_data_master_granted_program_s1 & cpu_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = program_s1_in_a_write_cycle;

  assign wait_for_program_s1_counter = 0;
  //program_s1_byteenable byte enable port mux, which is an e_mux
  assign program_s1_byteenable = (cpu_data_master_granted_program_s1)? cpu_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign program_s1_debugaccess = (cpu_data_master_granted_program_s1)? cpu_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //program/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_granted_program_s1 + cpu_instruction_master_granted_program_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_data_master_saved_grant_program_s1 + cpu_instruction_master_saved_grant_program_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led18_cpu_reset_clk_0_domain_synch_module (
                                                   // inputs:
                                                    clk,
                                                    data_in,
                                                    reset_n,

                                                   // outputs:
                                                    data_out
                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module led18_cpu (
                   // 1) global signals:
                    clk_0,
                    reset_n,

                   // the_led18_pio
                    out_port_from_the_led18_pio
                 )
;

  output  [ 17: 0] out_port_from_the_led18_pio;
  input            clk_0;
  input            reset_n;

  wire             clk_0_reset_n;
  wire    [ 13: 0] cpu_data_master_address;
  wire    [ 13: 0] cpu_data_master_address_to_slave;
  wire    [  3: 0] cpu_data_master_byteenable;
  wire             cpu_data_master_debugaccess;
  wire             cpu_data_master_granted_cpu_jtag_debug_module;
  wire             cpu_data_master_granted_data_s1;
  wire             cpu_data_master_granted_led18_pio_s1;
  wire             cpu_data_master_granted_program_s1;
  wire    [ 31: 0] cpu_data_master_irq;
  wire             cpu_data_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_data_master_qualified_request_data_s1;
  wire             cpu_data_master_qualified_request_led18_pio_s1;
  wire             cpu_data_master_qualified_request_program_s1;
  wire             cpu_data_master_read;
  wire             cpu_data_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_data_master_read_data_valid_data_s1;
  wire             cpu_data_master_read_data_valid_led18_pio_s1;
  wire             cpu_data_master_read_data_valid_program_s1;
  wire    [ 31: 0] cpu_data_master_readdata;
  wire             cpu_data_master_requests_cpu_jtag_debug_module;
  wire             cpu_data_master_requests_data_s1;
  wire             cpu_data_master_requests_led18_pio_s1;
  wire             cpu_data_master_requests_program_s1;
  wire             cpu_data_master_waitrequest;
  wire             cpu_data_master_write;
  wire    [ 31: 0] cpu_data_master_writedata;
  wire    [ 13: 0] cpu_instruction_master_address;
  wire    [ 13: 0] cpu_instruction_master_address_to_slave;
  wire             cpu_instruction_master_granted_cpu_jtag_debug_module;
  wire             cpu_instruction_master_granted_data_s1;
  wire             cpu_instruction_master_granted_program_s1;
  wire             cpu_instruction_master_qualified_request_cpu_jtag_debug_module;
  wire             cpu_instruction_master_qualified_request_data_s1;
  wire             cpu_instruction_master_qualified_request_program_s1;
  wire             cpu_instruction_master_read;
  wire             cpu_instruction_master_read_data_valid_cpu_jtag_debug_module;
  wire             cpu_instruction_master_read_data_valid_data_s1;
  wire             cpu_instruction_master_read_data_valid_program_s1;
  wire    [ 31: 0] cpu_instruction_master_readdata;
  wire             cpu_instruction_master_requests_cpu_jtag_debug_module;
  wire             cpu_instruction_master_requests_data_s1;
  wire             cpu_instruction_master_requests_program_s1;
  wire             cpu_instruction_master_waitrequest;
  wire    [  8: 0] cpu_jtag_debug_module_address;
  wire             cpu_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_jtag_debug_module_byteenable;
  wire             cpu_jtag_debug_module_chipselect;
  wire             cpu_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_jtag_debug_module_readdata_from_sa;
  wire             cpu_jtag_debug_module_reset;
  wire             cpu_jtag_debug_module_reset_n;
  wire             cpu_jtag_debug_module_resetrequest;
  wire             cpu_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_jtag_debug_module_write;
  wire    [ 31: 0] cpu_jtag_debug_module_writedata;
  wire             d1_cpu_jtag_debug_module_end_xfer;
  wire             d1_data_s1_end_xfer;
  wire             d1_led18_pio_s1_end_xfer;
  wire             d1_program_s1_end_xfer;
  wire    [  9: 0] data_s1_address;
  wire    [  3: 0] data_s1_byteenable;
  wire             data_s1_chipselect;
  wire             data_s1_clken;
  wire    [ 31: 0] data_s1_readdata;
  wire    [ 31: 0] data_s1_readdata_from_sa;
  wire             data_s1_write;
  wire    [ 31: 0] data_s1_writedata;
  wire    [  1: 0] led18_pio_s1_address;
  wire             led18_pio_s1_chipselect;
  wire    [ 17: 0] led18_pio_s1_readdata;
  wire    [ 17: 0] led18_pio_s1_readdata_from_sa;
  wire             led18_pio_s1_reset_n;
  wire             led18_pio_s1_write_n;
  wire    [ 17: 0] led18_pio_s1_writedata;
  wire    [ 17: 0] out_port_from_the_led18_pio;
  wire    [  9: 0] program_s1_address;
  wire    [  3: 0] program_s1_byteenable;
  wire             program_s1_chipselect;
  wire             program_s1_clken;
  wire             program_s1_debugaccess;
  wire    [ 31: 0] program_s1_readdata;
  wire    [ 31: 0] program_s1_readdata_from_sa;
  wire             program_s1_write;
  wire    [ 31: 0] program_s1_writedata;
  wire             registered_cpu_data_master_read_data_valid_data_s1;
  wire             registered_cpu_data_master_read_data_valid_program_s1;
  wire             reset_n_sources;
  cpu_jtag_debug_module_arbitrator the_cpu_jtag_debug_module
    (
      .clk                                                            (clk_0),
      .cpu_data_master_address_to_slave                               (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                                     (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                                    (cpu_data_master_debugaccess),
      .cpu_data_master_granted_cpu_jtag_debug_module                  (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module        (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_read                                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module          (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_requests_cpu_jtag_debug_module                 (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_waitrequest                                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                                          (cpu_data_master_write),
      .cpu_data_master_writedata                                      (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_jtag_debug_module_address                                  (cpu_jtag_debug_module_address),
      .cpu_jtag_debug_module_begintransfer                            (cpu_jtag_debug_module_begintransfer),
      .cpu_jtag_debug_module_byteenable                               (cpu_jtag_debug_module_byteenable),
      .cpu_jtag_debug_module_chipselect                               (cpu_jtag_debug_module_chipselect),
      .cpu_jtag_debug_module_debugaccess                              (cpu_jtag_debug_module_debugaccess),
      .cpu_jtag_debug_module_readdata                                 (cpu_jtag_debug_module_readdata),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .cpu_jtag_debug_module_reset                                    (cpu_jtag_debug_module_reset),
      .cpu_jtag_debug_module_reset_n                                  (cpu_jtag_debug_module_reset_n),
      .cpu_jtag_debug_module_resetrequest                             (cpu_jtag_debug_module_resetrequest),
      .cpu_jtag_debug_module_resetrequest_from_sa                     (cpu_jtag_debug_module_resetrequest_from_sa),
      .cpu_jtag_debug_module_write                                    (cpu_jtag_debug_module_write),
      .cpu_jtag_debug_module_writedata                                (cpu_jtag_debug_module_writedata),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu_data_master_arbitrator the_cpu_data_master
    (
      .clk                                                     (clk_0),
      .cpu_data_master_address                                 (cpu_data_master_address),
      .cpu_data_master_address_to_slave                        (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_cpu_jtag_debug_module           (cpu_data_master_granted_cpu_jtag_debug_module),
      .cpu_data_master_granted_data_s1                         (cpu_data_master_granted_data_s1),
      .cpu_data_master_granted_led18_pio_s1                    (cpu_data_master_granted_led18_pio_s1),
      .cpu_data_master_granted_program_s1                      (cpu_data_master_granted_program_s1),
      .cpu_data_master_qualified_request_cpu_jtag_debug_module (cpu_data_master_qualified_request_cpu_jtag_debug_module),
      .cpu_data_master_qualified_request_data_s1               (cpu_data_master_qualified_request_data_s1),
      .cpu_data_master_qualified_request_led18_pio_s1          (cpu_data_master_qualified_request_led18_pio_s1),
      .cpu_data_master_qualified_request_program_s1            (cpu_data_master_qualified_request_program_s1),
      .cpu_data_master_read                                    (cpu_data_master_read),
      .cpu_data_master_read_data_valid_cpu_jtag_debug_module   (cpu_data_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_data_master_read_data_valid_data_s1                 (cpu_data_master_read_data_valid_data_s1),
      .cpu_data_master_read_data_valid_led18_pio_s1            (cpu_data_master_read_data_valid_led18_pio_s1),
      .cpu_data_master_read_data_valid_program_s1              (cpu_data_master_read_data_valid_program_s1),
      .cpu_data_master_readdata                                (cpu_data_master_readdata),
      .cpu_data_master_requests_cpu_jtag_debug_module          (cpu_data_master_requests_cpu_jtag_debug_module),
      .cpu_data_master_requests_data_s1                        (cpu_data_master_requests_data_s1),
      .cpu_data_master_requests_led18_pio_s1                   (cpu_data_master_requests_led18_pio_s1),
      .cpu_data_master_requests_program_s1                     (cpu_data_master_requests_program_s1),
      .cpu_data_master_waitrequest                             (cpu_data_master_waitrequest),
      .cpu_data_master_write                                   (cpu_data_master_write),
      .cpu_jtag_debug_module_readdata_from_sa                  (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                       (d1_cpu_jtag_debug_module_end_xfer),
      .d1_data_s1_end_xfer                                     (d1_data_s1_end_xfer),
      .d1_led18_pio_s1_end_xfer                                (d1_led18_pio_s1_end_xfer),
      .d1_program_s1_end_xfer                                  (d1_program_s1_end_xfer),
      .data_s1_readdata_from_sa                                (data_s1_readdata_from_sa),
      .led18_pio_s1_readdata_from_sa                           (led18_pio_s1_readdata_from_sa),
      .program_s1_readdata_from_sa                             (program_s1_readdata_from_sa),
      .registered_cpu_data_master_read_data_valid_data_s1      (registered_cpu_data_master_read_data_valid_data_s1),
      .registered_cpu_data_master_read_data_valid_program_s1   (registered_cpu_data_master_read_data_valid_program_s1),
      .reset_n                                                 (clk_0_reset_n)
    );

  cpu_instruction_master_arbitrator the_cpu_instruction_master
    (
      .clk                                                            (clk_0),
      .cpu_instruction_master_address                                 (cpu_instruction_master_address),
      .cpu_instruction_master_address_to_slave                        (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_cpu_jtag_debug_module           (cpu_instruction_master_granted_cpu_jtag_debug_module),
      .cpu_instruction_master_granted_data_s1                         (cpu_instruction_master_granted_data_s1),
      .cpu_instruction_master_granted_program_s1                      (cpu_instruction_master_granted_program_s1),
      .cpu_instruction_master_qualified_request_cpu_jtag_debug_module (cpu_instruction_master_qualified_request_cpu_jtag_debug_module),
      .cpu_instruction_master_qualified_request_data_s1               (cpu_instruction_master_qualified_request_data_s1),
      .cpu_instruction_master_qualified_request_program_s1            (cpu_instruction_master_qualified_request_program_s1),
      .cpu_instruction_master_read                                    (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_cpu_jtag_debug_module   (cpu_instruction_master_read_data_valid_cpu_jtag_debug_module),
      .cpu_instruction_master_read_data_valid_data_s1                 (cpu_instruction_master_read_data_valid_data_s1),
      .cpu_instruction_master_read_data_valid_program_s1              (cpu_instruction_master_read_data_valid_program_s1),
      .cpu_instruction_master_readdata                                (cpu_instruction_master_readdata),
      .cpu_instruction_master_requests_cpu_jtag_debug_module          (cpu_instruction_master_requests_cpu_jtag_debug_module),
      .cpu_instruction_master_requests_data_s1                        (cpu_instruction_master_requests_data_s1),
      .cpu_instruction_master_requests_program_s1                     (cpu_instruction_master_requests_program_s1),
      .cpu_instruction_master_waitrequest                             (cpu_instruction_master_waitrequest),
      .cpu_jtag_debug_module_readdata_from_sa                         (cpu_jtag_debug_module_readdata_from_sa),
      .d1_cpu_jtag_debug_module_end_xfer                              (d1_cpu_jtag_debug_module_end_xfer),
      .d1_data_s1_end_xfer                                            (d1_data_s1_end_xfer),
      .d1_program_s1_end_xfer                                         (d1_program_s1_end_xfer),
      .data_s1_readdata_from_sa                                       (data_s1_readdata_from_sa),
      .program_s1_readdata_from_sa                                    (program_s1_readdata_from_sa),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu the_cpu
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_data_master_address),
      .d_byteenable                          (cpu_data_master_byteenable),
      .d_irq                                 (cpu_data_master_irq),
      .d_read                                (cpu_data_master_read),
      .d_readdata                            (cpu_data_master_readdata),
      .d_waitrequest                         (cpu_data_master_waitrequest),
      .d_write                               (cpu_data_master_write),
      .d_writedata                           (cpu_data_master_writedata),
      .i_address                             (cpu_instruction_master_address),
      .i_read                                (cpu_instruction_master_read),
      .i_readdata                            (cpu_instruction_master_readdata),
      .i_waitrequest                         (cpu_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_jtag_debug_module_byteenable),
      .jtag_debug_module_clk                 (clk_0),
      .jtag_debug_module_debugaccess         (cpu_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_jtag_debug_module_readdata),
      .jtag_debug_module_reset               (cpu_jtag_debug_module_reset),
      .jtag_debug_module_resetrequest        (cpu_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_jtag_debug_module_writedata),
      .reset_n                               (cpu_jtag_debug_module_reset_n)
    );

  data_s1_arbitrator the_data_s1
    (
      .clk                                                (clk_0),
      .cpu_data_master_address_to_slave                   (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                         (cpu_data_master_byteenable),
      .cpu_data_master_granted_data_s1                    (cpu_data_master_granted_data_s1),
      .cpu_data_master_qualified_request_data_s1          (cpu_data_master_qualified_request_data_s1),
      .cpu_data_master_read                               (cpu_data_master_read),
      .cpu_data_master_read_data_valid_data_s1            (cpu_data_master_read_data_valid_data_s1),
      .cpu_data_master_requests_data_s1                   (cpu_data_master_requests_data_s1),
      .cpu_data_master_waitrequest                        (cpu_data_master_waitrequest),
      .cpu_data_master_write                              (cpu_data_master_write),
      .cpu_data_master_writedata                          (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave            (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_data_s1             (cpu_instruction_master_granted_data_s1),
      .cpu_instruction_master_qualified_request_data_s1   (cpu_instruction_master_qualified_request_data_s1),
      .cpu_instruction_master_read                        (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_data_s1     (cpu_instruction_master_read_data_valid_data_s1),
      .cpu_instruction_master_requests_data_s1            (cpu_instruction_master_requests_data_s1),
      .d1_data_s1_end_xfer                                (d1_data_s1_end_xfer),
      .data_s1_address                                    (data_s1_address),
      .data_s1_byteenable                                 (data_s1_byteenable),
      .data_s1_chipselect                                 (data_s1_chipselect),
      .data_s1_clken                                      (data_s1_clken),
      .data_s1_readdata                                   (data_s1_readdata),
      .data_s1_readdata_from_sa                           (data_s1_readdata_from_sa),
      .data_s1_write                                      (data_s1_write),
      .data_s1_writedata                                  (data_s1_writedata),
      .registered_cpu_data_master_read_data_valid_data_s1 (registered_cpu_data_master_read_data_valid_data_s1),
      .reset_n                                            (clk_0_reset_n)
    );

  data the_data
    (
      .address    (data_s1_address),
      .byteenable (data_s1_byteenable),
      .chipselect (data_s1_chipselect),
      .clk        (clk_0),
      .clken      (data_s1_clken),
      .readdata   (data_s1_readdata),
      .write      (data_s1_write),
      .writedata  (data_s1_writedata)
    );

  led18_pio_s1_arbitrator the_led18_pio_s1
    (
      .clk                                            (clk_0),
      .cpu_data_master_address_to_slave               (cpu_data_master_address_to_slave),
      .cpu_data_master_granted_led18_pio_s1           (cpu_data_master_granted_led18_pio_s1),
      .cpu_data_master_qualified_request_led18_pio_s1 (cpu_data_master_qualified_request_led18_pio_s1),
      .cpu_data_master_read                           (cpu_data_master_read),
      .cpu_data_master_read_data_valid_led18_pio_s1   (cpu_data_master_read_data_valid_led18_pio_s1),
      .cpu_data_master_requests_led18_pio_s1          (cpu_data_master_requests_led18_pio_s1),
      .cpu_data_master_waitrequest                    (cpu_data_master_waitrequest),
      .cpu_data_master_write                          (cpu_data_master_write),
      .cpu_data_master_writedata                      (cpu_data_master_writedata),
      .d1_led18_pio_s1_end_xfer                       (d1_led18_pio_s1_end_xfer),
      .led18_pio_s1_address                           (led18_pio_s1_address),
      .led18_pio_s1_chipselect                        (led18_pio_s1_chipselect),
      .led18_pio_s1_readdata                          (led18_pio_s1_readdata),
      .led18_pio_s1_readdata_from_sa                  (led18_pio_s1_readdata_from_sa),
      .led18_pio_s1_reset_n                           (led18_pio_s1_reset_n),
      .led18_pio_s1_write_n                           (led18_pio_s1_write_n),
      .led18_pio_s1_writedata                         (led18_pio_s1_writedata),
      .reset_n                                        (clk_0_reset_n)
    );

  led18_pio the_led18_pio
    (
      .address    (led18_pio_s1_address),
      .chipselect (led18_pio_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_led18_pio),
      .readdata   (led18_pio_s1_readdata),
      .reset_n    (led18_pio_s1_reset_n),
      .write_n    (led18_pio_s1_write_n),
      .writedata  (led18_pio_s1_writedata)
    );

  program_s1_arbitrator the_program_s1
    (
      .clk                                                   (clk_0),
      .cpu_data_master_address_to_slave                      (cpu_data_master_address_to_slave),
      .cpu_data_master_byteenable                            (cpu_data_master_byteenable),
      .cpu_data_master_debugaccess                           (cpu_data_master_debugaccess),
      .cpu_data_master_granted_program_s1                    (cpu_data_master_granted_program_s1),
      .cpu_data_master_qualified_request_program_s1          (cpu_data_master_qualified_request_program_s1),
      .cpu_data_master_read                                  (cpu_data_master_read),
      .cpu_data_master_read_data_valid_program_s1            (cpu_data_master_read_data_valid_program_s1),
      .cpu_data_master_requests_program_s1                   (cpu_data_master_requests_program_s1),
      .cpu_data_master_waitrequest                           (cpu_data_master_waitrequest),
      .cpu_data_master_write                                 (cpu_data_master_write),
      .cpu_data_master_writedata                             (cpu_data_master_writedata),
      .cpu_instruction_master_address_to_slave               (cpu_instruction_master_address_to_slave),
      .cpu_instruction_master_granted_program_s1             (cpu_instruction_master_granted_program_s1),
      .cpu_instruction_master_qualified_request_program_s1   (cpu_instruction_master_qualified_request_program_s1),
      .cpu_instruction_master_read                           (cpu_instruction_master_read),
      .cpu_instruction_master_read_data_valid_program_s1     (cpu_instruction_master_read_data_valid_program_s1),
      .cpu_instruction_master_requests_program_s1            (cpu_instruction_master_requests_program_s1),
      .d1_program_s1_end_xfer                                (d1_program_s1_end_xfer),
      .program_s1_address                                    (program_s1_address),
      .program_s1_byteenable                                 (program_s1_byteenable),
      .program_s1_chipselect                                 (program_s1_chipselect),
      .program_s1_clken                                      (program_s1_clken),
      .program_s1_debugaccess                                (program_s1_debugaccess),
      .program_s1_readdata                                   (program_s1_readdata),
      .program_s1_readdata_from_sa                           (program_s1_readdata_from_sa),
      .program_s1_write                                      (program_s1_write),
      .program_s1_writedata                                  (program_s1_writedata),
      .registered_cpu_data_master_read_data_valid_program_s1 (registered_cpu_data_master_read_data_valid_program_s1),
      .reset_n                                               (clk_0_reset_n)
    );

  program the_program
    (
      .address     (program_s1_address),
      .byteenable  (program_s1_byteenable),
      .chipselect  (program_s1_chipselect),
      .clk         (clk_0),
      .clken       (program_s1_clken),
      .debugaccess (program_s1_debugaccess),
      .readdata    (program_s1_readdata),
      .write       (program_s1_write),
      .writedata   (program_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  led18_cpu_reset_clk_0_domain_synch_module led18_cpu_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_jtag_debug_module_resetrequest_from_sa |
    cpu_jtag_debug_module_resetrequest_from_sa);

  //cpu_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_data_master_irq = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "d:/altera/90/quartus/eda/sim_lib/altera_mf.v"
`include "d:/altera/90/quartus/eda/sim_lib/220model.v"
`include "d:/altera/90/quartus/eda/sim_lib/sgate.v"
`include "cpu_test_bench.v"
`include "cpu_oci_test_bench.v"
`include "cpu_jtag_debug_module_tck.v"
`include "cpu_jtag_debug_module_sysclk.v"
`include "cpu_jtag_debug_module_wrapper.v"
`include "cpu.v"
`include "led18_pio.v"
`include "data.v"
`include "program.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire    [ 31: 0] cpu_data_master_irq;
  wire    [ 17: 0] out_port_from_the_led18_pio;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  led18_cpu DUT
    (
      .clk_0                       (clk_0),
      .out_port_from_the_led18_pio (out_port_from_the_led18_pio),
      .reset_n                     (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on