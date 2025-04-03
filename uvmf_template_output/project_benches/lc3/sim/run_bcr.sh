export UVMF_HOME=../../../../../../ECE748/Proj3/UVMF_2023.4/
export QUESTA_HOME=/mnt/apps/public/COE/mg_apps/questa2024.2/questasim

ml questa
python2 $UVMF_HOME/scripts/uvmf_bcr.py questa use_vis_uvm:True seed:123456
# python2 $UVMF_HOME/scripts/uvmf_bcr.py vis
# xml2ucdb -format Excel ./lc3_testplan.xml ./lc3_testplan.ucdb
# vcover merge -stats=none -strip 0 -totals sim_and_testplan_merged.ucdb ./*.ucdb
# visualizer -viewcov ./sim_and_testplan_merged.ucdb