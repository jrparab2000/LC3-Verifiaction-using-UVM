 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetch_environment_agent_fetch_in }
wave add uvm_test_top.environment.fetch_environment.agent_fetch_in.agent_fetch_in_monitor.txn_stream -radix string -tag F0
wave group fetch_environment_agent_fetch_in_bus
wave add -group fetch_environment_agent_fetch_in_bus hdl_top.fetch_environment_agent_fetch_in_bus.* -radix hexadecimal -tag F0
wave group fetch_environment_agent_fetch_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetch_environment_agent_fetch_out }
wave add uvm_test_top.environment.fetch_environment.agent_fetch_out.agent_fetch_out_monitor.txn_stream -radix string -tag F0
wave group fetch_environment_agent_fetch_out_bus
wave add -group fetch_environment_agent_fetch_out_bus hdl_top.fetch_environment_agent_fetch_out_bus.* -radix hexadecimal -tag F0
wave group fetch_environment_agent_fetch_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_environment_decode_agent_in }
wave add uvm_test_top.environment.decode_environment.decode_agent_in.decode_agent_in_monitor.txn_stream -radix string -tag F0
wave group decode_environment_decode_agent_in_bus
wave add -group decode_environment_decode_agent_in_bus hdl_top.decode_environment_decode_agent_in_bus.* -radix hexadecimal -tag F0
wave group decode_environment_decode_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decode_environment_decode_agent_out }
wave add uvm_test_top.environment.decode_environment.decode_agent_out.decode_agent_out_monitor.txn_stream -radix string -tag F0
wave group decode_environment_decode_agent_out_bus
wave add -group decode_environment_decode_agent_out_bus hdl_top.decode_environment_decode_agent_out_bus.* -radix hexadecimal -tag F0
wave group decode_environment_decode_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_environment_execute_in_agent }
wave add uvm_test_top.environment.execute_environment.execute_in_agent.execute_in_agent_monitor.txn_stream -radix string -tag F0
wave group execute_environment_execute_in_agent_bus
wave add -group execute_environment_execute_in_agent_bus hdl_top.execute_environment_execute_in_agent_bus.* -radix hexadecimal -tag F0
wave group execute_environment_execute_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { execute_environment_execute_out_agent }
wave add uvm_test_top.environment.execute_environment.execute_out_agent.execute_out_agent_monitor.txn_stream -radix string -tag F0
wave group execute_environment_execute_out_agent_bus
wave add -group execute_environment_execute_out_agent_bus hdl_top.execute_environment_execute_out_agent_bus.* -radix hexadecimal -tag F0
wave group execute_environment_execute_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_environment_writeback_in_agent }
wave add uvm_test_top.environment.writeback_environment.writeback_in_agent.writeback_in_agent_monitor.txn_stream -radix string -tag F0
wave group writeback_environment_writeback_in_agent_bus
wave add -group writeback_environment_writeback_in_agent_bus hdl_top.writeback_environment_writeback_in_agent_bus.* -radix hexadecimal -tag F0
wave group writeback_environment_writeback_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writeback_environment_writeback_out_agent }
wave add uvm_test_top.environment.writeback_environment.writeback_out_agent.writeback_out_agent_monitor.txn_stream -radix string -tag F0
wave group writeback_environment_writeback_out_agent_bus
wave add -group writeback_environment_writeback_out_agent_bus hdl_top.writeback_environment_writeback_out_agent_bus.* -radix hexadecimal -tag F0
wave group writeback_environment_writeback_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_environment_agent_in }
wave add uvm_test_top.environment.memaccess_environment.agent_in.agent_in_monitor.txn_stream -radix string -tag F0
wave group memaccess_environment_agent_in_bus
wave add -group memaccess_environment_agent_in_bus hdl_top.memaccess_environment_agent_in_bus.* -radix hexadecimal -tag F0
wave group memaccess_environment_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccess_environment_agent_out }
wave add uvm_test_top.environment.memaccess_environment.agent_out.agent_out_monitor.txn_stream -radix string -tag F0
wave group memaccess_environment_agent_out_bus
wave add -group memaccess_environment_agent_out_bus hdl_top.memaccess_environment_agent_out_bus.* -radix hexadecimal -tag F0
wave group memaccess_environment_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { controller_environment_controller_agent_in }
wave add uvm_test_top.environment.controller_environment.controller_agent_in.controller_agent_in_monitor.txn_stream -radix string -tag F0
wave group controller_environment_controller_agent_in_bus
wave add -group controller_environment_controller_agent_in_bus hdl_top.controller_environment_controller_agent_in_bus.* -radix hexadecimal -tag F0
wave group controller_environment_controller_agent_in_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { controller_environment_controller_agent_out }
wave add uvm_test_top.environment.controller_environment.controller_agent_out.controller_agent_out_monitor.txn_stream -radix string -tag F0
wave group controller_environment_controller_agent_out_bus
wave add -group controller_environment_controller_agent_out_bus hdl_top.controller_environment_controller_agent_out_bus.* -radix hexadecimal -tag F0
wave group controller_environment_controller_agent_out_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { imem_agent }
wave add uvm_test_top.environment.imem_agent.imem_agent_monitor.txn_stream -radix string -tag F0
wave group imem_agent_bus
wave add -group imem_agent_bus hdl_top.imem_agent_bus.* -radix hexadecimal -tag F0
wave group imem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { dmem_agent }
wave add uvm_test_top.environment.dmem_agent.dmem_agent_monitor.txn_stream -radix string -tag F0
wave group dmem_agent_bus
wave add -group dmem_agent_bus hdl_top.dmem_agent_bus.* -radix hexadecimal -tag F0
wave group dmem_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

