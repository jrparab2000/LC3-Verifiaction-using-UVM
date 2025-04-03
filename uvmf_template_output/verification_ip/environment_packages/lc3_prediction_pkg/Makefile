# lc3 prediction packages source and make target

# pragma uvmf custom additional begin
# pragma uvmf custom additional end

# Include all requisite sub-environment package targets for this bench

mem_access_LC3_PRED_PKG ?=\
		 $(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg/lc3_prediction_pkg.sv

COMP_mem_access_PKG_TGT_0 = q_comp_lc3_prediction_pkg
COMP_mem_access_PKG_TGT_1 = v_comp_lc3_prediction_pkg
COMP_mem_access_PKG_TGT = $(COMP_mem_access_PKG_TGT_$(USE_VELOCE))

comp_lc3_prediction_pkg: $(COMP_mem_access_PKG_TGT) 

q_comp_lc3_prediction_pkg:   
		$(HVL_COMP_CMD) +incdir+$(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg $(mem_access_LC3_PRED_PKG)

v_comp_lc3_prediction_pkg: q_comp_mem_access_env_pkg
	$(VELANALYZE_HVL_CMD) +incdir+$(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg $(mem_access_LC3_PRED_PKG)



ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif


