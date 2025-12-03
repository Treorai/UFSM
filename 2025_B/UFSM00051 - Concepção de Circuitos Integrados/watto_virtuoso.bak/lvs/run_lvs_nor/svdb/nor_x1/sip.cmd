sip -V -cgnd 4 -s -o -sub 2 -mlc poly_conn,metal1_conn -er \
	metal2_conn.den -n 1.4 -i 0,1.401 -b metal1_conn,poly_conn,Oxide,FOX \
	-t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal2_conn,key 0,1.4 - metal2_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal1_conn,metal2_conn -er \
	metal3_conn.den -n 1.75 -i 0,1.751 -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal3_conn,key 0,1.75 - metal3_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal2_conn,metal3_conn -er \
	metal4_conn.den -n 1.75 -i 0,1.751 -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal4_conn,key 0,1.75 - metal4_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal3_conn,metal4_conn -er \
	metal5_conn.den -n 1.75 -i 0,1.751 -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.08 -Maxw 1.8 -p metal5_conn,key 0,1.75 - metal5_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal4_conn,metal5_conn -er \
	metal6_conn.den -n 1.75 -i 0,1.751 -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn -j \
	0.08 -Maxw 1.8 -p metal6_conn,key 0,1.75 - metal6_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal5_conn,metal6_conn -er \
	metal7_conn.den -n 1.75 -i 0,1.751 -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -j 0.08 -Maxw \
	1.8 -p metal7_conn,key 0,1.75 - metal7_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal6_conn,metal7_conn -er \
	metal8_conn.den -n 1.75 -i 0,1.751 -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -j 0.08 -Maxw 1.8 -p \
	metal8_conn,key 0,1.75 - metal8_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal7_conn,metal8_conn -er \
	metal9_conn.den -n 1.75 -i 0,1.751 -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -j 0.08 -Maxw 1.8 -p metal9_conn,key \
	0,1.75 - metal9_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal8_conn,metal9_conn -er \
	metal10_conn.den -n 5 -i 0,5.001 -b \
	metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -j 0.22 -Maxw 4.95 -p metal10_conn,key 0,5 - \
	metal10_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc metal9_conn,metal10_conn -n 5 -i \
	0,5.001 -b \
	metal10_conn,metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-j 0.22 -Maxw 4.95 -p metal11_conn,key 0,5 - metal11_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -cp poly_conn,allGate,Oxide -n 0.6 -i \
	0,0.601 -b Oxide,FOX -t \
	metal1_conn,metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.045 -Maxw 1.0125 -p poly_conn,key 0,0.6 - poly_conn.sip
sip -V -cgnd 4 -s -o -sub 2 -mlc poly_conn -er metal1_conn.den -n \
	1.2 -i 0,1.201 -b poly_conn,Oxide,FOX -t \
	metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-j 0.06 -Maxw 1.35 -p metal1_conn,key 0,1.2 - metal1_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -b \
	metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-Maxw 4.95 -p metal10_conn,key,metal11_conn,key 0,5,0 - \
	metal10_conn_metal11_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal11_conn -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-Maxw 4.95 -p metal9_conn,key,metal11_conn,key 0,5,0 - \
	metal9_conn_metal11_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -Maxw 4.95 -p metal9_conn,key,metal10_conn,key 0,5,0 \
	- metal9_conn_metal10_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal10_conn -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -Maxw 4.95 -p metal8_conn,key,metal10_conn,key 0,5,0 \
	- metal8_conn_metal10_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal8_conn,key,metal9_conn,key 0,1.75,0 - \
	metal8_conn_metal9_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal9_conn -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal7_conn,key,metal9_conn,key 0,1.75,0 - \
	metal7_conn_metal9_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal7_conn,key,metal8_conn,key 0,1.75,0 - \
	metal7_conn_metal8_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal8_conn -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal6_conn,key,metal8_conn,key 0,1.75,0 - \
	metal6_conn_metal8_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal6_conn,key,metal7_conn,key 0,1.75,0 - \
	metal6_conn_metal7_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal7_conn -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -Maxw 1.8 -p \
	metal5_conn,key,metal7_conn,key 0,1.75,0 - \
	metal5_conn_metal7_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal5_conn,key,metal6_conn,key 0,1.75,0 - \
	metal5_conn_metal6_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal6_conn -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn -Maxw \
	1.8 -p metal4_conn,key,metal6_conn,key 0,1.75,0 - \
	metal4_conn_metal6_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal4_conn,key,metal5_conn,key 0,1.75,0 - \
	metal4_conn_metal5_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal5_conn -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal3_conn,key,metal5_conn,key 0,1.75,0 - \
	metal3_conn_metal5_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal3_conn,key,metal4_conn,key 0,1.75,0 - \
	metal3_conn_metal4_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal4_conn -b \
	metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal2_conn,key,metal4_conn,key 0,1.75,0 - \
	metal2_conn_metal4_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b metal1_conn,poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal2_conn,key,metal3_conn,key 0,1.75,0 - \
	metal2_conn_metal3_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal3_conn -b \
	poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal1_conn:metal1_conn_cut,key,metal3_conn,key 0,1.75,0 \
	- metal1_conn_metal3_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -b poly_conn,Oxide,FOX -t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.8 -p metal1_conn:metal1_conn_cut,key,metal2_conn,key 0,1.4,0 \
	- metal1_conn_metal2_conn.sip
sip -V -s -cgnd 4 -sub 2 -L3A -h -R metal2_conn -b Oxide,FOX -t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-k metal1_conn:0.15 -Maxw 1.8 -p \
	poly_conn:poly_conn_cut,key,metal2_conn,key 0,1.4,0 - \
	poly_conn_metal2_conn.sip
sip -V -s -cgnd 4 -sub 2 -h -R metal1_conn,poly_conn -b Oxide,FOX \
	-t \
	metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-Maxw 1.35 -p \
	poly_conn:poly_conn_cut,key,metal1_conn:metal1_conn_cut,key 0,1.2,0 - \
	poly_conn_metal1_conn.sip
sw3d -V -cgnd 4 -sub 2 -b \
	metal9_conn,metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-p metal10_conn,metal11_conn - metal10_conn_metal11_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal8_conn,metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal11_conn -p metal9_conn,metal10_conn - \
	metal9_conn_metal10_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal7_conn,metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal10_conn,metal11_conn -p metal8_conn,metal9_conn - \
	metal8_conn_metal9_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal6_conn,metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal9_conn,metal10_conn,metal11_conn -p metal7_conn,metal8_conn - \
	metal7_conn_metal8_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal5_conn,metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal8_conn,metal9_conn,metal10_conn,metal11_conn -p \
	metal6_conn,metal7_conn - metal6_conn_metal7_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal4_conn,metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX \
	-t metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn -p \
	metal5_conn,metal6_conn - metal5_conn_metal6_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal3_conn,metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal4_conn,metal5_conn - metal4_conn_metal5_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b \
	metal2_conn,metal1_conn,poly_conn,Oxide,FOX -t \
	metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal3_conn,metal4_conn - metal3_conn_metal4_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b metal1_conn,poly_conn,Oxide,FOX -t \
	metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal2_conn,metal3_conn - metal2_conn_metal3_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b poly_conn,Oxide,FOX -t \
	metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p metal1_conn:metal1_conn_cut,metal2_conn - \
	metal1_conn_metal2_conn.sw3d
sw3d -V -cgnd 4 -sub 2 -b Oxide,FOX -t \
	metal2_conn,metal3_conn,metal4_conn,metal5_conn,metal6_conn,metal7_conn,metal8_conn,metal9_conn,metal10_conn,metal11_conn \
	-p poly_conn:poly_conn_cut,metal1_conn:metal1_conn_cut - \
	poly_conn_metal1_conn.sw3d
