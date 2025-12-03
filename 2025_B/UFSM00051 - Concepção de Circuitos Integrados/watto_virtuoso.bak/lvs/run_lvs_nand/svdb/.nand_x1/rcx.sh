#!/home/tools/cadence/installs/QUANTUS231/tools.lnx86/extraction/bin/64bit/assura_rcx -V
# This script was generated Mon Nov 24 18:06:10 2025 by:
#
# Program: /home/tools/cadence/installs/QUANTUS231/tools.lnx86/extraction/bin/64bit/RCXspice
# Version: 23.1.1-p051
# Created: Thu Feb 15 21:11:17 PST 2024
#
#/home/tools/cadence/installs/QUANTUS231/tools.lnx86/extraction/bin/64bit/RCXspice \
#	-techdir \
#	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical \
#	-corner rcx_typical -newlvs \
#	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1.lvsfile \
#	-rcxdir \
#	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1 \
#	-xy_coordinates c,r -type full -temperature 25.0 -tempdir \
#	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/rcx_temp \
#	-sub_node_char # -res_models yes -parasitic_res_width \
#	-parasitic_res_models comment -parasitic_cap_models no \
#	-output_net_name_space schematic -output_hierarchy_delimiter / \
#	-output \
#	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/extview.tmp \
#	-net_name_space layout -minR 0.001 -max_merged_via_size auto \
#	-max_fracture_length infinite -lvs_source hcci \
#	-ignore_gate_diffusion_fringing_cap -hierarchy_delimiter / \
#	-hcci_run_name nand_x1 -hcci_run_dir \
#	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb \
#	-hcci_net_prop 5 -hcci_inst_prop 6 -hcci_dev_prop 7 \
#	-fracture_length_units MICRONS -extract both -df2 \
#	-device_finger_delimiter @ -cap_models yes -cap_ground gnd! \
#	-cap_extract_mode decoupled -cap_coupling_factor 1.0 \
#	-array_vias_spacing auto -agds_layer_map_file \
#	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1.gds.map
set -e
set -v
##=======================================================
##ADD_EXPLICIT_VIAS=N
##ADD_BULK_TERMINAL=N
##AGDS_FILE=/dev/null
##AGDS_LAYER_MAP_FILE=/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1.gds.map
##HCCI_DEV_PROP_FILE=/dev/null
##AGDS_SPICE_FILE=/dev/null
##AGDS_TEXT_LAYERS=
##ARRAY_VIAS_SPACING=
##ASSURA_RUN_DIR=.
##ASSURA_RUN_NAME=run1
##BLACK_BOX_CELLS=/dev/null
##BREAK_WIDTH=
##CAP_COUPLING_FACTOR=1.0
##CAP_EXTRACT_MODE=decoupled
##CAP_GROUND=gnd!
##CAP_MODELS=yes
##DANGLINGR=N
##DENSITY_CHECK_METHOD=P
##DELETE_OUTPUT_FILE=N
##DEVICE_FINGER_DELIMITER='@'
##DF2=Y
##DRACULA_RUN_DIR=
##DRACULA_RUN_NAME=
##ENABLESENSITIVITYEXTRACTION=N
##EXCLUDE_FLOAT_LIMIT=
##EXCLUDE_FLOAT_DECOPULING_FACTOR=
##EXCLUDE_FLOATING_NETS=N
##EXCLUDE_NETS_REDUCERC=/dev/null
##EXCLUDE_SELF_CAPS=N
##IGNORE_GATE_DIFFUSION_FRINGING_CAP=Y
##EXTRACT=both
##EXTRACT_MOS_DIFFUSION_AP=N
##EXTRACT_MOS_DIFFUSION_HIGH=
##EXTRACT_MOS_DIFFUSION_RES=N
##FILTER_SIZE=2.0
##FIXED_NETS_FILE=/dev/null
##FMAX=
##FRACTURE_LENGTH_UNITS=MICRONS
##FREQUENCY_FILE=/dev/null
##GROUND_NETS=
##GROUND_NETS_FILE=/dev/null
##GROUND_SUBSTRATE_FLOATING_NETS=N
##HCCI_DEV_PROP=7
##HCCI_INST_PROP=6
##HCCI_NET_PROP=5
##HCCI_RULE_FILE=
##HCCI_RUN_DIR=/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb
##HCCI_RUN_NAME=nand_x1
##HEADER_FILE=/dev/null
##HIERARCHY_DELIMITER='/'
##OUTPUT_HIERARCHY_DELIMITER='/'
##HRCX_CELLS_FILE=/dev/null
##IMPORT_GLOBALS=Y
##LADDER_NETWORK=N
##LVS_SOURCE=hcci
##M_FACTORR=
##M_FACTORW=N
##MACRO_CELL=N
##MAX_FRACTURE_LENGTH=infinite
##MAX_SIGNALS=
##MERGE_PARALLEL_R=N
##MERGE_PARALLEL_VIA=N
##MINC=
##MINC_BY_PERCENTAGE=
##MINR=0.001
##NET_NAME_SPACE=layout
##NETS_FILE=/dev/null
##NP=1
##OUTPUT=/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/extview.tmp
##OUTPUT_NET_NAME_SPACE=schematic
##PARASITIC_BLOCKING_DEVICE_CELLS_TYPE=gray
##PARASITIC_CAP_MODELS=no
##PARASITIC_RES_MODELS=comment
##PARASITIC_RES_LENGTH=N
##PARASITIC_RES_WIDTH=Y
##PARASITIC_RES_WIDTH_DRAWN=N
##PARASITIC_RES_UNIT=N
##PARTIAL_CAP_BLOCKING=N
##PEEC=N
##PIN_ORDER_FILE=/dev/null
##PIPE_ADVGEN=
##PIPE_SPICE2DB=
##POWER_NETS=
##POWER_NETS_FILE=/dev/null
##RC_FREQUENCY=
##RCXDIR=/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1
##RCXFS_HIGH=N
##RCXFS_NETS_FILE=
##RCXFS_TYPE=none
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_CUTOFF_DISTANCE=
##RCXFS_VIA_OFF=N
##REDUCERC=N
##REGION_LIMIT=
##RES_MODELS=yes
##RISE_TIME=
##SAVE_FILL_SHAPES=N
##SINGLE_CAP_EDSPF=N
##SHOW_DIODES=N
##SKIN_FREQUENCY=
##SPEF=N
##SPEF_UNITS=
##SPLIT_PINS=N
##FORCE_SUBCELL_PIN_ORDERS=N
##SPLIT_PINS_DISTANCE=
##SUB_NODE_CHAR='#'
##SUBSTRATE_PROFILE=/dev/null
##SUBSTRATE_STAMPING_OFF=N
##TEMPDIR=/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/rcx_temp
##TEMPERATURE=25.0
##TYPE=full
##USER_REGION=/dev/null
##VARIANT_CELL_FILE=/dev/null
##VIA_EFFECT_OFF=N
##VIRTUAL_FILL=
##XREF=/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/nand_x1.gnx,/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/nand_x1.gdx
##XY_COORDINATES=c,r
##=======================================================

CASE_SENSITIVE=TRUE
export CASE_SENSITIVE
QRC_MOS_LW_PRECISION=y
export QRC_MOS_LW_PRECISION
setTempDir /home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/rcx_temp
DEVICE_FINGER_DELIMITER='@'
HIERARCHY_DELIMITER='/'
OUTPUT_HIERARCHY_DELIMITER='/'
cd /home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1
cat <<ENDCAT> caps2dversion
* caps2d version: 10
ENDCAT
cat <<ENDCAT> flattransUnit.info
meters
ENDCAT
QRC=Y
export QRC

#==========================================================#
# Generate RCX input data from annotated GDS2 database
#==========================================================#

agds2rcx -V -H satfile -r \
	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/nand_x1.xcn \
	-split_float_exclude_layers \
	ndiff_0conn,pdiff_0conn,nwell_0conn,psubstrate -crundir \
	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb -unit \
	meters -df2 -xgl -pl nand_x1.ports -f nand_x1.alm -lnn nand_x1.lnn \
	-pnet 5 -pinst 6 -pdev 7 nand_x1.agf nand_x1_pin_xy.spi

#==========================================================#
# Calculate erosion tables for specified process layers
#==========================================================#

densitymap -V -TC -O metal2_conn.den metal2_conn_tile_spec metal2_0conn
densitymap -V -TC -O metal1_conn.den metal1_conn_tile_spec metal1_0conn
/bin/cp _0nmos1v _0nmos1v_orig
geom _0nmos1v ndiff_0conn - _0nmos1v,10,i,1
/bin/cp _0pmos1v _0pmos1v_orig
geom _0pmos1v pdiff_0conn - _0pmos1v,10,i,1

#==========================================================#
# Generate power list
#==========================================================#

cat global.net > power_list
/bin/mv -f nwell_0conn nwell_0conn_orig
epick nwell_0conn_orig nwell_0conn
/bin/mv -f psubstrate psubstrate_orig
epick psubstrate_orig psubstrate

#==========================================================#
# Ensure vias do not extend beyond routing
#==========================================================#

geom -V Via1 metal2_0conn metal1_0conn - Via1,111,i,2
geom -V cont_0poly metal1_0conn poly_0conn - cont_0poly,111,i,2
geom -V cont_0pdiff metal1_0conn pdiff_0conn - cont_0pdiff_metal1_0conn_pdiff_0conn,111,i,2
geom -V cont_0ndiff metal1_0conn ndiff_0conn - cont_0ndiff_metal1_0conn_ndiff_0conn,111,i,2
geom -V ptap pdiff_0conn psubstrate - ptap,111,i,2
geom -V ntap ndiff_0conn nwell_0conn - ntap,111,i,2
/bin/mv -f nwell_0conn_orig nwell_0conn
/bin/mv -f psubstrate_orig psubstrate

#==========================================================#
# Flatten net file, routing, via and device layers
#==========================================================#

beginFlattenInputs
/bin/mv -f NET h_NET
flatnet -V -li -h '/' h_NET NET
netprint -V -N1 power_list:power_list_nums NET
flattenTransistorData _0nmos1v meters
flattenTransistorData _0pmos1v meters
flattenLayers -m cont_0pdiff cont_0ndiff_metal1_0conn_ndiff_0conn
flattenLayers -m cont_0ndiff ptap
flattenLayers -m Via1 ntap
flattenLayers -m cont_0poly _0nmos1v_orig
flattenLayers -m cont_0pdiff_metal1_0conn_pdiff_0conn _0pmos1v_orig
flattenLayers -m metal2_0conn
flattenLayers -m metal1_0conn
flattenLayers -m poly_0conn
flattenLayers -m ndiff_0conn pdiff_0conn
flattenLayers -m nwell_0conn psubstrate
endFlattenInputs

#==========================================================#
# Initialize CAP_GROUND variable
#==========================================================#

findCapGround -g gnd! -l psubstrate NET
echo "CAP_GROUND=" ${CAP_GROUND}
export CAP_GROUND
echo ${CAP_GROUND} > cgnetfile
netprint -n cgnetfile:gn_summary.log NET
reconnect -cgnd ${CAP_GROUND} -float floatlvsnetsfile -tf _0nmos1v,_0pmos1v \
	-probe \
	text_metal1_0conn:metal1_0conn:text_metal1_0conn_fvia,text_metal2_0conn:metal2_0conn:text_metal2_0conn_fvia
iprint -count floatlvsnetsfile > floatlvsnetsfile.txt
geom _0nmos1v,_0pmos1v - qrcgate,1,i,1
iprint -count floatlvsnetsfile > input_nets_summary.log
iprint -imerge power_list_nums floatlvsnetsfile power_list_nums2
mv power_list_nums power_list_nums_orig
cp power_list_nums2 power_list_nums 

#==========================================================#
# Segregate interconnect into resistive and non-resistive
#==========================================================#

selectNetsByNumber power_list_nums metal1_0conn p_rmetal1_0conn np_rmetal1_0conn
selectNetsByNumber power_list_nums metal2_0conn p_rmetal2_0conn np_rmetal2_0conn
selectNetsByNumber power_list_nums ndiff_0conn p_rndiff_0conn np_rndiff_0conn
selectNetsByNumber power_list_nums nwell_0conn p_rnwell_0conn np_rnwell_0conn
selectNetsByNumber power_list_nums pdiff_0conn p_rpdiff_0conn np_rpdiff_0conn
selectNetsByNumber power_list_nums poly_0conn p_rpoly_0conn np_rpoly_0conn
selectNetsByNumber power_list_nums psubstrate p_rpsubstrate np_rpsubstrate
selectNetsByNumber power_list_nums Via1 p_rVia1 np_rVia1
selectNetsByNumber power_list_nums cont_0poly p_rcont_0poly np_rcont_0poly
mv power_list_nums_orig power_list_nums

#==========================================================#
# Create resistor cut regions between resistive
# interconnect levels
#==========================================================#

mergevia -V -tech \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical \
	-cnt np_rVia1 rVia1 - np_rmetal2_0conn np_rmetal1_0conn
cp rVia1 rVia1_orig
mergevia -V -tech \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical \
	-cnt np_rcont_0poly rcont_0poly - np_rmetal1_0conn np_rpoly_0conn
cp rcont_0poly rcont_0poly_orig

#==========================================================#
# Create resistive interconnect MOSFET terminals
#==========================================================#

createNRMosfetGateTerminal _0nmos1v np_rpoly_0conn _0nmos1v_mgvia
createNRMosfetGateTerminal _0pmos1v np_rpoly_0conn _0pmos1v_mgvia

#==========================================================#
# Assign net numbers to cut regions
#==========================================================#

/bin/mv -f np_rnwell_0conn np_rnwell_0conn.conn_orig
createEmptyLayer np_rnwell_0conn
/bin/mv -f np_rpsubstrate np_rpsubstrate.conn_orig
createEmptyLayer np_rpsubstrate
connect -V -relocate NET np_rndiff_0conn:np_rndiff_0conn.conn \
	np_rpdiff_0conn:np_rpdiff_0conn.conn \
	np_rnwell_0conn:np_rnwell_0conn.conn \
	np_rpsubstrate:np_rpsubstrate.conn rVia1 rcont_0poly _0nmos1v_mgvia \
	_0pmos1v_mgvia - ntap,1,3 ptap,2,4 -

#==========================================================#
# Assign net numbers to resistor vias
#==========================================================#

geom -V cont_0ndiff_metal1_0conn_ndiff_0conn np_rndiff_0conn.conn - tmp_rcont_0ndiff_metal1_0conn_ndiff_0conn,11,i,2
mergevia -V -i -tech \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical \
	-cnt tmp_rcont_0ndiff_metal1_0conn_ndiff_0conn \
	rcont_0ndiff_metal1_0conn_ndiff_0conn - np_rmetal1_0conn \
	np_rndiff_0conn
cp rcont_0ndiff_metal1_0conn_ndiff_0conn rcont_0ndiff_metal1_0conn_ndiff_0conn_orig
/bin/rm -f tmp_rcont_0ndiff_metal1_0conn_ndiff_0conn
geom -V cont_0pdiff_metal1_0conn_pdiff_0conn np_rpdiff_0conn.conn - tmp_rcont_0pdiff_metal1_0conn_pdiff_0conn,11,i,2
mergevia -V -i -tech \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical \
	-cnt tmp_rcont_0pdiff_metal1_0conn_pdiff_0conn \
	rcont_0pdiff_metal1_0conn_pdiff_0conn - np_rmetal1_0conn \
	np_rpdiff_0conn
cp rcont_0pdiff_metal1_0conn_pdiff_0conn rcont_0pdiff_metal1_0conn_pdiff_0conn_orig
/bin/rm -f tmp_rcont_0pdiff_metal1_0conn_pdiff_0conn

#==========================================================#
# Assign net numbers to nonresistive layers
#==========================================================#

epick -V -reo -e rcont_0ndiff_metal1_0conn_ndiff_0conn -e \
	rcont_0pdiff_metal1_0conn_pdiff_0conn np_rndiff_0conn.conn \
	tmp_ndiff_0conn
epick -V -reo -e tmp_ndiff_0conn -c np_rndiff_0conn.conn tmp1_ndiff_0conn
geom -V tmp1_ndiff_0conn np_rndiff_0conn - tmp1_ndiff_0conn,11,i,2
geom -V tmp_ndiff_0conn,tmp1_ndiff_0conn - np_rndiff_0conn,1,i,1
/bin/rm -f tmp_ndiff_0conn tmp1_ndiff_0conn
epick -V -reo -e rcont_0ndiff_metal1_0conn_ndiff_0conn -e \
	rcont_0pdiff_metal1_0conn_pdiff_0conn np_rpdiff_0conn.conn \
	tmp_pdiff_0conn
epick -V -reo -e tmp_pdiff_0conn -c np_rpdiff_0conn.conn tmp1_pdiff_0conn
geom -V tmp1_pdiff_0conn np_rpdiff_0conn - tmp1_pdiff_0conn,11,i,2
geom -V tmp_pdiff_0conn,tmp1_pdiff_0conn - np_rpdiff_0conn,1,i,1
/bin/rm -f tmp_pdiff_0conn tmp1_pdiff_0conn
epick -V -reo -e rcont_0ndiff_metal1_0conn_ndiff_0conn -e \
	rcont_0pdiff_metal1_0conn_pdiff_0conn np_rnwell_0conn.conn \
	tmp_nwell_0conn
epick -V -reo -e tmp_nwell_0conn -c np_rnwell_0conn.conn tmp1_nwell_0conn
geom -V tmp1_nwell_0conn np_rnwell_0conn - tmp1_nwell_0conn,11,i,2
geom -V tmp_nwell_0conn,tmp1_nwell_0conn - np_rnwell_0conn,1,i,1
/bin/rm -f tmp_nwell_0conn tmp1_nwell_0conn
epick -V -reo -e rcont_0ndiff_metal1_0conn_ndiff_0conn -e \
	rcont_0pdiff_metal1_0conn_pdiff_0conn np_rpsubstrate.conn \
	tmp_psubstrate
epick -V -reo -e tmp_psubstrate -c np_rpsubstrate.conn tmp1_psubstrate
geom -V tmp1_psubstrate np_rpsubstrate - tmp1_psubstrate,11,i,2
geom -V tmp_psubstrate,tmp1_psubstrate - np_rpsubstrate,1,i,1
/bin/rm -f tmp_psubstrate tmp1_psubstrate

#==========================================================#
# Process text layers
#==========================================================#

flatlabel -V  -tc -F -l flatlabel.info text_metal1_0conn,text_metal2_0conn L1T0,L2T0
# 1 np_rpoly_0conn
# 2 np_rmetal1_0conn
# 3 np_rmetal2_0conn
/bin/mv -f np_rnwell_0conn.conn_orig np_rnwell_0conn
/bin/mv -f np_rpsubstrate.conn_orig np_rpsubstrate

#==========================================================#
# Parasitic R extraction with default precision
#==========================================================#

rex -V -m -pd -I'#' -tech \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical \
	-map p2elayermapfile -wee p2elayermapfile -N NET -e2 -Ply \
	np_rpoly_0conn -er \
	np_rmetal2_0conn,metal2_conn.den:np_rmetal1_0conn,metal1_conn.den -rP \
	res.mod np_rpoly_0conn::poly_conn_cut \
	np_rmetal1_0conn::metal1_conn_cut np_rmetal2_0conn::metal2_conn_cut - \
	rVia1,2,3,t rcont_0ndiff_metal1_0conn_ndiff_0conn,2,t \
	rcont_0pdiff_metal1_0conn_pdiff_0conn,2,t rcont_0poly,1,2,t \
	_0nmos1v_mgvia,1,z _0pmos1v_mgvia,1,z - L1T0,2,I L2T0,3,I
/bin/cp -f np_rnwell_0conn np_rnwell_0conn.conn
/bin/cp -f np_rpsubstrate np_rpsubstrate.conn

#==========================================================#
# Form resistive via layers
#==========================================================#

stamp -V -i2 np_rmetal2_0conn rVia1 np_rVia1
geom -V np_rVia1,p_rVia1 - rVia1,1,i,1
stamp -V -i2 np_rmetal1_0conn rcont_0poly np_rcont_0poly
geom -V np_rcont_0poly,p_rcont_0poly - rcont_0poly,1,i,1
stamp -V -B -i np_rmetal1_0conn cont_0ndiff_metal1_0conn_ndiff_0conn
/bin/cp -f cont_0ndiff_metal1_0conn_ndiff_0conn rcont_0ndiff_metal1_0conn_ndiff_0conn
stamp -V -B -i np_rmetal1_0conn cont_0pdiff_metal1_0conn_pdiff_0conn
/bin/cp -f cont_0pdiff_metal1_0conn_pdiff_0conn rcont_0pdiff_metal1_0conn_pdiff_0conn
/bin/rm -f np_rndiff_0conn.conn
/bin/rm -f np_rpdiff_0conn.conn
/bin/rm -f np_rnwell_0conn.conn
/bin/rm -f np_rpsubstrate.conn

#==========================================================#
# Combine power non-power
#==========================================================#

/bin/rm -f ndiff_0conn
geom np_rndiff_0conn,p_rndiff_0conn - ndiff_0conn,1,i,1
epick -c -f floatlvsnetsfile ndiff_0conn ndiff_0conn
/bin/rm -f nwell_0conn
geom np_rnwell_0conn,p_rnwell_0conn - nwell_0conn,1,i,1
epick -c -f floatlvsnetsfile nwell_0conn nwell_0conn
/bin/rm -f pdiff_0conn
geom np_rpdiff_0conn,p_rpdiff_0conn - pdiff_0conn,1,i,1
epick -c -f floatlvsnetsfile pdiff_0conn pdiff_0conn
/bin/rm -f poly_0conn
geom np_rpoly_0conn,p_rpoly_0conn - poly_0conn,1,i,1
epick -c -f floatlvsnetsfile poly_0conn poly_0conn
/bin/rm -f psubstrate
geom np_rpsubstrate,p_rpsubstrate - psubstrate,1,i,1
epick -c -f floatlvsnetsfile psubstrate psubstrate

#==========================================================#
# Reconnect MOSFET devices
#==========================================================#

reconnect -V -n NET -se2 mwires.res -t _0nmos1v.trans:_0nmos1v.transr \
	_0nmos1v ndiff_0conn,_0nmos1v_mgvia,psubstrate -t \
	_0pmos1v.trans:_0pmos1v.transr _0pmos1v \
	pdiff_0conn,_0pmos1v_mgvia,nwell_0conn
changeTransFileNameAP _0nmos1v.trans _0nmos1v.transr
changeTransFileNameAP _0pmos1v.trans _0pmos1v.transr
netprint -max NET > original_maxnetfile

#==========================================================#
# Form capacitance layers for resistive process layers
#==========================================================#

#4 
 geom -V -i p_rpoly_0conn,np_rpoly_0conn - so_poly_conn,1,n
geom -V p_rpoly_0conn,np_rpoly_0conn - poly_conn,1,i,1
#4 
 geom -V -i p_rmetal1_0conn,np_rmetal1_0conn - so_metal1_conn,1,n
geom -V p_rmetal1_0conn,np_rmetal1_0conn - metal1_conn,1,i,1
#4 
 geom -V -i p_rmetal2_0conn,np_rmetal2_0conn - so_metal2_conn,1,n
geom -V p_rmetal2_0conn,np_rmetal2_0conn - metal2_conn,1,i,1

#==========================================================#
# Form capacitance layers for non-resistive process layers
#==========================================================#

grow -V .001 ndiff_0conn mask
geom -V pdiff_0conn mask - pdiff_0conn,10,i,1
geom -V ndiff_0conn,pdiff_0conn - Oxide,1,i,1
createEmptyLayer metal11_conn
createEmptyLayer metal10_conn
createEmptyLayer metal9_conn
createEmptyLayer metal8_conn
createEmptyLayer metal7_conn
createEmptyLayer metal6_conn
createEmptyLayer metal5_conn
createEmptyLayer metal4_conn
createEmptyLayer metal3_conn

#==========================================================#
# Form substrate
#==========================================================#

geom -V p_rnwell_0conn,np_rnwell_0conn - nwell_0conn,1,i,1
geom -V p_rpsubstrate,np_rpsubstrate - psubstrate,1,i,1
/bin/cp -f psubstrate psubstrate.df2
grow -V 0.001 nwell_0conn g_nwell_0conn
geom -V psubstrate g_nwell_0conn - psubstrate,10,i,1
geom -V nwell_0conn,psubstrate - FOX,1,i,1
xytoebbox -V -g 10.002 -e metal11_conn,metal10_conn,metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,nwell_0conn,psubstrate xg_FOX
grow -V 0.001 FOX g_FOX
geom -V xg_FOX g_FOX - tmp_FOX,10
epick -V -reo -D ${CAP_GROUND} tmp_FOX pick_FOX
grow -V -m 0.002 pick_FOX g_pick_FOX
stamp -i FOX g_pick_FOX
grow -V -m -0.002 g_pick_FOX pick_FOX
emerge -V pick_FOX FOX tmp1_FOX
geom -V tmp1_FOX - FOX,1,i,1
/bin/rm -f g_pick_FOX xg_FOX tmp_FOX tmp1_FOX
geom -V FOX Oxide - FOX,10,i,1
geom _0nmos1v,_0pmos1v - qrcgate,1,i,1

#==========================================================#
# Create sip/sw3d/cn3d capacitance data files
#==========================================================#

cat <<ENDCAT> sip.cmd
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal1_conn,metal2_conn -er \
	metal3_conn.den -n 1.75 -i 0,1.751 -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal3_conn,key 0,1.75 - metal3_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal2_conn,metal3_conn -er \
	metal4_conn.den -n 1.75 -i 0,1.751 -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal4_conn,key 0,1.75 - metal4_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal3_conn,metal4_conn -er \
	metal5_conn.den -n 1.75 -i 0,1.751 -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal5_conn,key 0,1.75 - metal5_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal4_conn,metal5_conn -er \
	metal6_conn.den -n 1.75 -i 0,1.751 -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn -j \
	0.08 -Maxw 1.8 -p metal6_conn,key 0,1.75 - metal6_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal5_conn,metal6_conn -er \
	metal7_conn.den -n 1.75 -i 0,1.751 -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -j 0.08 -Maxw \
	1.8 -p metal7_conn,key 0,1.75 - metal7_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal6_conn,metal7_conn -er \
	metal8_conn.den -n 1.75 -i 0,1.751 -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -j 0.08 -Maxw 1.8 -p \
	metal8_conn,key 0,1.75 - metal8_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal7_conn,metal8_conn -er \
	metal9_conn.den -n 1.75 -i 0,1.751 -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -j 0.08 -Maxw 1.8 -p metal9_conn,key \
	0,1.75 - metal9_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal8_conn,metal9_conn -er \
	metal10_conn.den -n 5 -i 0,5.001 -b \
	metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -j 0.22 -Maxw 4.95 -p metal10_conn,key 0,5 - \
	metal10_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc metal9_conn,metal10_conn -n 5 -i \
	0,5.001 -b \
	metal10_conn,metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-j 0.22 -Maxw 4.95 -p metal11_conn,key 0,5 - metal11_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -cp poly_conn,allGate,Oxide -n 0.6 -i \
	0,0.601 -b Oxide,FOX -t \
	metal1_conn,metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.045 -Maxw 1.0125 -p poly_conn,key 0,0.6 - poly_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc poly_conn -er metal1_conn.den -n \
	1.2 -i 0,1.201 -b poly_conn,Oxide,FOX -t \
	metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.06 -Maxw 1.35 -p metal1_conn,key 0,1.2 - metal1_conn.sip
sip -V -cgnd ${CAP_GROUND} -s -o -sub 2 -mlc poly_conn,metal1_conn -er \
	metal2_conn.den -n 1.4 -i 0,1.401 -b metal1_conn,poly_conn,Oxide,FOX \
	-t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal2_conn,key 0,1.4 - metal2_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -b \
	metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-Maxw 4.95 -p metal10_conn,key,metal11_conn,key 0,5,0 - \
	metal10_conn_metal11_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal11_conn -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-Maxw 4.95 -p metal9_conn,key,metal11_conn,key 0,5,0 - \
	metal9_conn_metal11_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -Maxw 4.95 -p metal9_conn,key,metal10_conn,key 0,5,0 \
	- metal9_conn_metal10_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal10_conn -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -Maxw 4.95 -p metal8_conn,key,metal10_conn,key 0,5,0 \
	- metal8_conn_metal10_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal8_conn,key,metal9_conn,key 0,1.75,0 - \
	metal8_conn_metal9_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal9_conn -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal7_conn,key,metal9_conn,key 0,1.75,0 - \
	metal7_conn_metal9_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal7_conn,key,metal8_conn,key 0,1.75,0 - \
	metal7_conn_metal8_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal8_conn -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal6_conn,key,metal8_conn,key 0,1.75,0 - \
	metal6_conn_metal8_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal6_conn,key,metal7_conn,key 0,1.75,0 - \
	metal6_conn_metal7_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal7_conn -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal5_conn,key,metal7_conn,key 0,1.75,0 - \
	metal5_conn_metal7_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal5_conn,key,metal6_conn,key 0,1.75,0 - \
	metal5_conn_metal6_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal6_conn -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn -Maxw \
	1.8 -p metal4_conn,key,metal6_conn,key 0,1.75,0 - \
	metal4_conn_metal6_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal4_conn,key,metal5_conn,key 0,1.75,0 - \
	metal4_conn_metal5_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal5_conn -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal3_conn,key,metal5_conn,key 0,1.75,0 - \
	metal3_conn_metal5_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal3_conn,key,metal4_conn,key 0,1.75,0 - \
	metal3_conn_metal4_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal4_conn -b \
	metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal2_conn:metal2_conn_cut,key,metal4_conn,key 0,1.75,0 \
	- metal2_conn_metal4_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b metal1_conn,poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal2_conn:metal2_conn_cut,key,metal3_conn,key 0,1.75,0 \
	- metal2_conn_metal3_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal3_conn -b \
	poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-k metal2_conn:0.15 -Maxw 1.8 -p \
	metal1_conn:metal1_conn_cut,key,metal3_conn,key 0,1.75,0 - \
	metal1_conn_metal3_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -b poly_conn,Oxide,FOX -t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p \
	metal1_conn:metal1_conn_cut,key,metal2_conn:metal2_conn_cut,key \
	0,1.4,0 - metal1_conn_metal2_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -L3A -h -R metal2_conn -b Oxide,FOX -t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-k metal1_conn:0.15 -Maxw 1.8 -p \
	poly_conn:poly_conn_cut,key,metal2_conn:metal2_conn_cut,key 0,1.4,0 - \
	poly_conn_metal2_conn.sip
sip -V -s -cgnd ${CAP_GROUND} -sub 2 -h -R metal1_conn,poly_conn -b Oxide,FOX \
	-t \
	metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.35 -p \
	poly_conn:poly_conn_cut,key,metal1_conn:metal1_conn_cut,key 0,1.2,0 - \
	poly_conn_metal1_conn.sip
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-p metal10_conn,metal11_conn - metal10_conn_metal11_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -p metal9_conn,metal10_conn - \
	metal9_conn_metal10_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -p metal8_conn,metal9_conn - \
	metal8_conn_metal9_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -p metal7_conn,metal8_conn - \
	metal7_conn_metal8_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -p \
	metal6_conn,metal7_conn - metal6_conn_metal7_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn -p \
	metal5_conn,metal6_conn - metal5_conn_metal6_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal4_conn,metal5_conn - metal4_conn_metal5_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal3_conn,metal4_conn - metal3_conn_metal4_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b metal1_conn,poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal2_conn:metal2_conn_cut,metal3_conn - \
	metal2_conn_metal3_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b poly_conn,Oxide,FOX -t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal1_conn:metal1_conn_cut,metal2_conn:metal2_conn_cut - \
	metal1_conn_metal2_conn.sw3d
sw3d -V -cgnd ${CAP_GROUND} -sub 2 -b Oxide,FOX -t \
	metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p poly_conn:poly_conn_cut,metal1_conn:metal1_conn_cut - \
	poly_conn_metal1_conn.sw3d
ENDCAT

#==========================================================#
# Prepare gate capacitance blocking layers
#==========================================================#

emerge -V _0nmos1v _0pmos1v allGate

#==========================================================#
# Run pax16 to generate capfile
#==========================================================#

pax16 -V -lee_off -delete_unused_files rm_files_in_pax16 -gnd ${CAP_GROUND} \
	-ignore_cf_table -scf sip.cmd -cgnd ${CAP_GROUND},1.0 -rcxlvs \
	rcxtolvsmapfile -M_perim_off -c \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical/qrcTechFile \
	-f FOX Oxide poly_conn:poly_conn_cut metal1_conn:metal1_conn_cut \
	metal2_conn:metal2_conn_cut metal3_conn metal4_conn metal5_conn \
	metal6_conn metal7_conn metal8_conn metal9_conn metal10_conn \
	metal11_conn allGate - \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical/qrcTechFile \
	- - NET - capfile

#==========================================================#
# Generate netlister data files
#==========================================================#


#==========================================================#
# Perform RC reduction
#==========================================================#

xreduce -V -mergecap -n NET -tech \
	/home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical -d1 \
	-e \
	metal11_conn,metal10_conn,metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX,np_rndiff_0conn,np_rpdiff_0conn,np_rnwell_0conn,np_rpsubstrate,rVia1,rcont_0poly \
	-decoupled -sr -danglingR -minR 0.001 -rPvia \
	rVia1.res,rcont_0poly.res,rcont_0pdiff_metal1_0conn_pdiff_0conn.res,rcont_0ndiff_metal1_0conn_ndiff_0conn.res \
	-rP \
	np_rpoly_0conn.res,np_rmetal1_0conn.res,np_rmetal2_0conn.res,mwires.res \
	-cap capfile L1T0 L2T0 _0nmos1v.transr _0pmos1v.transr

#==========================================================#
# Generate HSPICE file
#==========================================================#

advgen -V -g0 -li -f -n -o HSPICE -TL L1T0,L2T0 -cgnd ${CAP_GROUND},1.0 \
	-dxref \
	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/nand_x1.gdx \
	-nxref \
	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/nand_x1.gnx \
	-addprefix -sc caps2dversion -mx capfile \
	metal11_conn,metal10_conn,metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-rPmw res.mod np_rmetal2_0conn.res,Rnp_rmetal2_0conn.dev2 \
	np_rmetal1_0conn.res,Rnp_rmetal1_0conn.dev2 \
	np_rpoly_0conn.res,Rnp_rpoly_0conn.dev2 rVia1.res,RrVia1.dev2 \
	rcont_0poly.res,Rrcont_0poly.dev2 \
	rcont_0pdiff_metal1_0conn_pdiff_0conn.res,Rrcont_0pdiff_metal1_0conn_pdiff_0conn.dev2 \
	rcont_0ndiff_metal1_0conn_ndiff_0conn.res,Rrcont_0ndiff_metal1_0conn_ndiff_0conn.dev2 \
	-rPmw mwires.mod mwires.res,mwires.dev2 -ta lvsmos.mod,_0nmos1v.net \
	_0nmos1v.transr -ta lvsmos.mod,_0pmos1v.net _0pmos1v.transr - NET - \
	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/extview.tmp

#==========================================================#
# Create _save_layers file for Assura extracted view
#==========================================================#

geom metal2_conn np_rmetal2_0conn - np_rmetal2_0conn,11,i,1
geom metal1_conn np_rmetal1_0conn - np_rmetal1_0conn,11,i,1
geom poly_conn np_rpoly_0conn - np_rpoly_0conn,11,i,1
stamp -i2 np_rmetal2_0conn rVia1 np_rVia1
stamp -i2 np_rmetal1_0conn rcont_0poly np_rcont_0poly
ereduce  rcont_0ndiff_metal1_0conn_ndiff_0conn rcont_0ndiff_metal1_0conn_ndiff_0conn.reduce
stamp -i  np_rmetal1_0conn rcont_0ndiff_metal1_0conn_ndiff_0conn.reduce
stamp -i  rcont_0ndiff_metal1_0conn_ndiff_0conn.reduce rcont_0ndiff_metal1_0conn_ndiff_0conn
stamp -i  rcont_0ndiff_metal1_0conn_ndiff_0conn cont_0ndiff_metal1_0conn_ndiff_0conn
/bin/rm -f rcont_0ndiff_metal1_0conn_ndiff_0conn.reduce
ereduce  rcont_0pdiff_metal1_0conn_pdiff_0conn rcont_0pdiff_metal1_0conn_pdiff_0conn.reduce
stamp -i  np_rmetal1_0conn rcont_0pdiff_metal1_0conn_pdiff_0conn.reduce
stamp -i  rcont_0pdiff_metal1_0conn_pdiff_0conn.reduce rcont_0pdiff_metal1_0conn_pdiff_0conn
stamp -i  rcont_0pdiff_metal1_0conn_pdiff_0conn cont_0pdiff_metal1_0conn_pdiff_0conn
/bin/rm -f rcont_0pdiff_metal1_0conn_pdiff_0conn.reduce
cat <<ENDCAT> _save_layers
FOX psubstrate nwell_0conn
metal3_conn metal3_conn
metal4_conn metal4_conn
metal5_conn metal5_conn
metal6_conn metal6_conn
metal7_conn metal7_conn
metal8_conn metal8_conn
metal9_conn metal9_conn
metal10_conn metal10_conn
metal11_conn metal11_conn
Oxide np_rpdiff_0conn p_rpdiff_0conn np_rndiff_0conn p_rndiff_0conn
cont_0pdiff cont_0pdiff_metal1_0conn_pdiff_0conn
cont_0ndiff cont_0ndiff_metal1_0conn_ndiff_0conn
metal2_0conn np_rmetal2_0conn p_rmetal2_0conn
metal1_0conn np_rmetal1_0conn p_rmetal1_0conn
poly_0conn np_rpoly_0conn p_rpoly_0conn
ndiff_0conn np_rndiff_0conn p_rndiff_0conn
pdiff_0conn np_rpdiff_0conn p_rpdiff_0conn
nwell_0conn np_rnwell_0conn p_rnwell_0conn
psubstrate psubstrate
Via1 np_rVia1 p_rVia1
cont_0poly np_rcont_0poly p_rcont_0poly
ptap ptap
ntap ntap
ENDCAT
cat \
	/home/ufsm00051/wagner.chitto/wagner.chitto/run_lvs_nand/svdb/nand_x1/hccisavefile \
	>> _save_layers

