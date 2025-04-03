 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider fetch_environment_agent_fetch_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch_environment/agent_fetch_in/agent_fetch_in_monitor/txn_stream
add wave -noupdate -group fetch_environment_agent_fetch_in_bus /hdl_top/fetch_environment_agent_fetch_in_bus/*
add wave -noupdate -divider fetch_environment_agent_fetch_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetch_environment/agent_fetch_out/agent_fetch_out_monitor/txn_stream
add wave -noupdate -group fetch_environment_agent_fetch_out_bus /hdl_top/fetch_environment_agent_fetch_out_bus/*
add wave -noupdate -divider decode_environment_decode_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode_environment/decode_agent_in/decode_agent_in_monitor/txn_stream
add wave -noupdate -group decode_environment_decode_agent_in_bus /hdl_top/decode_environment_decode_agent_in_bus/*
add wave -noupdate -divider decode_environment_decode_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.decode_environment/decode_agent_out/decode_agent_out_monitor/txn_stream
add wave -noupdate -group decode_environment_decode_agent_out_bus /hdl_top/decode_environment_decode_agent_out_bus/*
add wave -noupdate -divider execute_environment_execute_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute_environment/execute_in_agent/execute_in_agent_monitor/txn_stream
add wave -noupdate -group execute_environment_execute_in_agent_bus /hdl_top/execute_environment_execute_in_agent_bus/*
add wave -noupdate -divider execute_environment_execute_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.execute_environment/execute_out_agent/execute_out_agent_monitor/txn_stream
add wave -noupdate -group execute_environment_execute_out_agent_bus /hdl_top/execute_environment_execute_out_agent_bus/*
add wave -noupdate -divider writeback_environment_writeback_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback_environment/writeback_in_agent/writeback_in_agent_monitor/txn_stream
add wave -noupdate -group writeback_environment_writeback_in_agent_bus /hdl_top/writeback_environment_writeback_in_agent_bus/*
add wave -noupdate -divider writeback_environment_writeback_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.writeback_environment/writeback_out_agent/writeback_out_agent_monitor/txn_stream
add wave -noupdate -group writeback_environment_writeback_out_agent_bus /hdl_top/writeback_environment_writeback_out_agent_bus/*
add wave -noupdate -divider memaccess_environment_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess_environment/agent_in/agent_in_monitor/txn_stream
add wave -noupdate -group memaccess_environment_agent_in_bus /hdl_top/memaccess_environment_agent_in_bus/*
add wave -noupdate -divider memaccess_environment_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccess_environment/agent_out/agent_out_monitor/txn_stream
add wave -noupdate -group memaccess_environment_agent_out_bus /hdl_top/memaccess_environment_agent_out_bus/*
add wave -noupdate -divider controller_environment_controller_agent_in 
add wave -noupdate /uvm_root/uvm_test_top/environment.controller_environment/controller_agent_in/controller_agent_in_monitor/txn_stream
add wave -noupdate -group controller_environment_controller_agent_in_bus /hdl_top/controller_environment_controller_agent_in_bus/*
add wave -noupdate -divider controller_environment_controller_agent_out 
add wave -noupdate /uvm_root/uvm_test_top/environment.controller_environment/controller_agent_out/controller_agent_out_monitor/txn_stream
add wave -noupdate -group controller_environment_controller_agent_out_bus /hdl_top/controller_environment_controller_agent_out_bus/*
add wave -noupdate -divider imem_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment/imem_agent/imem_agent_monitor/txn_stream
add wave -noupdate -group imem_agent_bus /hdl_top/imem_agent_bus/*
add wave -noupdate -divider dmem_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment/dmem_agent/dmem_agent_monitor/txn_stream
add wave -noupdate -group dmem_agent_bus /hdl_top/dmem_agent_bus/*



TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

