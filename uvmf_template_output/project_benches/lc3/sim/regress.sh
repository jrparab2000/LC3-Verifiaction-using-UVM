export QUESTA_HOME=/mnt/apps/public/COE/mg_apps/questa2024.2/questasim
ml questa
python2 $UVMF_HOME/scripts/uvmf_bcr.py questa use_vis_uvm:True verbosity:UVM_LOW seed:12345678
#python2 $UVMF_HOME/scripts/uvmf_bcr.py vis
xml2ucdb -format Excel ./LC3_test_plan.xml ./lc3_testplan.ucdb
vcover merge -stats=none -strip 0 -totals sim_and_testplan_merged.ucdb ./*.ucdb
visualizer -viewcov ./sim_and_testplan_merged.ucdb