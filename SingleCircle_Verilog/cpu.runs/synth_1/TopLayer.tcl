# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.cache/wt [current_project]
set_property parent.project_path /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/ALU.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/DM.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/IM.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/RegFileRead.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/RegFileWrite.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/RegFiletoALU.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/SwitchFrequency.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/controller.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/counter.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/decodShowInDisplay.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/display.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/divider.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/extend.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/halt.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/insturctionDecoder.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/npc.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/pc.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/regfile.v
  /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/sources_1/new/TopLayer.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/constrs_1/new/constraint.xdc
set_property used_in_implementation false [get_files /home/hover/Desktop/Labs/HUST_ComputerOrginazation_CourseDesign/SingleCircle_Verilog/cpu.srcs/constrs_1/new/constraint.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top TopLayer -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TopLayer.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TopLayer_utilization_synth.rpt -pb TopLayer_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
