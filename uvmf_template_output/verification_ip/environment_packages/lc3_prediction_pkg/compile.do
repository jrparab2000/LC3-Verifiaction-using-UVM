# Tcl do file for compile of decode interface

# pragma uvmf custom additional begin
# pragma uvmf custom additional end


quietly set cmd [format "%s %s/environment_packages/lc3_prediction_pkg/lc3_prediction_pkg.sv" $cmd $env(UVMF_VIP_LIBRARY_HOME)]
eval $cmd


