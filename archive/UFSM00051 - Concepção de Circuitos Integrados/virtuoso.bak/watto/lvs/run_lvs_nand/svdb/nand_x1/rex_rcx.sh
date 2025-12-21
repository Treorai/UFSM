set -e
set -x

rex -dp_comm_string 1,ecomp,39699 -V -m -pd -I# -tech /home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical -map p2elayermapfile -wee p2elayermapfile -N NET -e2 -Ply np_rpoly_0conn -er np_rmetal2_0conn,metal2_conn.den:np_rmetal1_0conn,metal1_conn.den -rP res.mod -mp mprexag9QFQz np_rmetal1_0conn::metal1_conn_cut - rcont_0poly,1,T rcont_0pdiff_metal1_0conn_pdiff_0conn,1,t rcont_0ndiff_metal1_0conn_ndiff_0conn,1,t rVia1,1,x - L1T0,1,I

rex -dp_comm_string 2,ecomp,39699 -V -m -pd -I# -tech /home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical -map p2elayermapfile -wee p2elayermapfile -N NET -e2 -Ply np_rpoly_0conn -er np_rmetal2_0conn,metal2_conn.den:np_rmetal1_0conn,metal1_conn.den -rP res.mod -mp mprexaMPhFhk np_rpoly_0conn::poly_conn_cut - _0pmos1v_mgvia,1,z _0nmos1v_mgvia,1,z rcont_0poly,1,x

rex -dp_comm_string 3,ecomp,39699 -V -m -pd -I# -tech /home/tools/design_kits/cadence/GPDK045/gpdk045_v_6_0/qrc/typical -map p2elayermapfile -wee p2elayermapfile -N NET -e2 -Ply np_rpoly_0conn -er np_rmetal2_0conn,metal2_conn.den:np_rmetal1_0conn,metal1_conn.den -rP res.mod -mp mprexaISeL8c np_rmetal2_0conn::metal2_conn_cut - rVia1,1,T - L2T0,1,I

rexmerge -V -N NET -n mprexaMPhFhk,mprexag9QFQz,mprexaISeL8c -b np_rpoly_0conn::Rnp_rpoly_0conn.dev2,np_rmetal1_0conn::Rnp_rmetal1_0conn.dev2,np_rmetal2_0conn::Rnp_rmetal2_0conn.dev2 -l ,L1T0,L2T0 np_rpoly_0conn.res,np_rmetal1_0conn.res,np_rmetal2_0conn.res

