@echo off
set xv_path=D:\\Vivado\\2015.2\\bin
call %xv_path%/xsim simu_top_behav -key {Behavioral:sim_1:Functional:simu_top} -tclbatch simu_top.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
