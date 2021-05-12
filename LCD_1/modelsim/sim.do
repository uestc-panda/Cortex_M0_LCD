#Exit current simulation
#quit -sim
#Clear command line information
.main    clear
#建立工作库并映射工作库
vlib work
vmap work work
#编译verilog源代码
vlog -f path.f

vsim -voptargs=+acc work.tb
#添加波形
add wave *
#运行仿真
run 200 ms

#quit -sim