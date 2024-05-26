module inverter(in, out);
  input in;
  output out;
  wire in;
  wire out;
  INVX1 g2(.A (in), .Y (out));
endmodule

module inverter_3(in, out);
  input in;
  output out;
  wire in;
  wire out;
  INVX1 g2(.A (in), .Y (out));
endmodule

module inverter_1(in, out);
  input in;
  output out;
  wire in;
  wire out;
  INVX1 g2(.A (in), .Y (out));
endmodule

module inverter_DELAY5(in, out);
  input in;
  output out;
  wire in;
  wire out;
  INVX1 g2(.A (in), .Y (out));
endmodule

module gen_gamma_coder(clk, rst_n, set0, set1, en, id, nk, md);
  input clk, rst_n, set0, set1, en;
  input [7:0] id;
  output [7:0] nk;
  output [8:0] md;
  wire clk, rst_n, set0, set1, en;
  wire [7:0] id;
  wire [7:0] nk;
  wire [8:0] md;
  wire [8:0]
       extend_ring_oscillator_output_run_ring_oscillator_out_inv_9;
  wire [2:0]
       extend_ring_oscillator_output_run_ring_oscillator_out_inv_3;
  wire [6:0]
       extend_ring_oscillator_output_run_ring_oscillator_out_inv_7;
  wire [4:0]
       extend_ring_oscillator_output_run_ring_oscillator_out_inv_5;
  wire [24:0] w;
  wire extend_ring_oscillator_output_run_ring_oscillator_n_6,
       extend_ring_oscillator_output_run_ring_oscillator_n_7,
       extend_ring_oscillator_output_run_ring_oscillator_n_8,
       extend_ring_oscillator_output_run_ring_oscillator_n_9, n_0, n_1,
       n_5, n_6;
  wire n_7, n_8, n_9, n_10, n_11, n_12, n_13, n_14;
  wire n_15, n_16, n_17, n_18, n_19, n_20, n_21, n_22;
  wire n_23, n_24, n_25, n_26, n_27, n_28, n_29, n_30;
  wire n_31, n_32, n_33, n_34, n_35, n_36, n_37, n_38;
  wire n_39, n_40, n_41, n_42, n_43, n_44, n_45, n_46;
  wire n_47, n_48, n_49, n_50, n_51, n_52, n_53, n_54;
  wire n_55, n_56, n_57, n_58, n_59, n_60, n_61, n_62;
  wire n_63, n_64, n_65, n_66, n_67, n_68, n_69, n_70;
  wire n_71, n_72, n_73, n_74, n_75;
  assign nk[0] = nk[2];
  assign nk[1] = nk[7];
  inverter
       \extend_ring_oscillator_output_run_ring_oscillator_inv_3[0].i0
       (.in
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[0]),
       .out
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[1]));
  inverter_3
       \extend_ring_oscillator_output_run_ring_oscillator_inv_5[0].i2
       (.in
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[0]),
       .out
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[1]));
  inverter_1
       \extend_ring_oscillator_output_run_ring_oscillator_inv_7[0].i4
       (.in
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[0]),
       .out
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[1]));
  inverter_DELAY5
       \extend_ring_oscillator_output_run_ring_oscillator_inv_9[0].i6
       (.in
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[0]),
       .out
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[1]));
  CLKBUFX2
       extend_ring_oscillator_output_run_ring_oscillator_cdn_loop_breaker(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[2]),
       .Y (extend_ring_oscillator_output_run_ring_oscillator_n_6));
  CLKBUFX2
       extend_ring_oscillator_output_run_ring_oscillator_cdn_loop_breaker12(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[2]),
       .Y (extend_ring_oscillator_output_run_ring_oscillator_n_7));
  CLKBUFX2
       extend_ring_oscillator_output_run_ring_oscillator_cdn_loop_breaker13(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[2]),
       .Y (extend_ring_oscillator_output_run_ring_oscillator_n_8));
  CLKBUFX2
       extend_ring_oscillator_output_run_ring_oscillator_cdn_loop_breaker14(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[4]),
       .Y (extend_ring_oscillator_output_run_ring_oscillator_n_9));
  INVX1 g1083(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[1]),
       .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[4]));
  SDFFRHQX1 \saving_mix_data_q_reg[5] (.RN (rst_n), .CK (clk), .D
       (md[5]), .SI (n_74), .SE (set1), .Q (md[5]));
  SDFFRHQX1 \saving_mix_data_q_reg[8] (.RN (rst_n), .CK (clk), .D
       (md[8]), .SI (n_75), .SE (set1), .Q (md[8]));
  SDFFRHQX1 \saving_mix_data_q_reg[4] (.RN (rst_n), .CK (clk), .D
       (md[4]), .SI (n_72), .SE (set1), .Q (md[4]));
  SDFFRHQX1 \saving_mix_data_q_reg[6] (.RN (rst_n), .CK (clk), .D
       (md[6]), .SI (n_69), .SE (set1), .Q (md[6]));
  SDFFRHQX1 \saving_mix_data_q_reg[7] (.RN (rst_n), .CK (clk), .D
       (md[7]), .SI (n_68), .SE (set1), .Q (md[7]));
  NAND2BX1 g2365__8780(.AN (n_14), .B (n_73), .Y (n_75));
  CLKXOR2X1 g2366__4296(.A (n_57), .B (n_71), .Y (n_74));
  OAI2BB1X1 g2367__3772(.A0N (n_48), .A1N (n_70), .B0 (n_20), .Y
       (n_73));
  XNOR2X1 g2368__1474(.A (n_35), .B (n_67), .Y (n_72));
  XNOR2X1 g2369__4547(.A (n_38), .B (n_66), .Y (n_71));
  NAND3BXL g2370__9682(.AN (n_65), .B (n_19), .C (n_26), .Y (n_70));
  XNOR2X1 g2371__2683(.A (n_50), .B (n_64), .Y (n_69));
  XNOR2X1 g2372__1309(.A (n_60), .B (n_63), .Y (n_68));
  SDFFRHQX1 \saving_mix_data_q_reg[3] (.RN (rst_n), .CK (clk), .D
       (md[3]), .SI (n_59), .SE (set1), .Q (md[3]));
  XNOR2X1 g2374__6877(.A (n_49), .B (n_62), .Y (n_67));
  XNOR2X1 g2375__2900(.A (n_26), .B (n_61), .Y (n_66));
  AOI31X1 g2376__2391(.A0 (n_18), .A1 (n_23), .A2 (n_56), .B0 (n_39),
       .Y (n_65));
  SDFFRHQX1 \saving_mix_data_q_reg[2] (.RN (rst_n), .CK (clk), .D
       (md[2]), .SI (n_55), .SE (set1), .Q (md[2]));
  AOI31X1 g2378__7675(.A0 (n_18), .A1 (n_33), .A2 (n_56), .B0 (n_34),
       .Y (n_64));
  XNOR2X1 g2379__7118(.A (n_51), .B (n_58), .Y (n_63));
  ADDHX1 g2380__8757(.A (n_23), .B (n_53), .CO (n_61), .S (n_62));
  OAI2BB1X1 g2381__1786(.A0N (n_37), .A1N (n_54), .B0 (n_48), .Y
       (n_60));
  XNOR2X1 g2382__5953(.A (n_52), .B (n_47), .Y (n_59));
  AO22X1 g2383__5703(.A0 (n_37), .A1 (n_53), .B0 (n_19), .B1 (n_34), .Y
       (n_58));
  SDFFRHQX1 \saving_mix_data_q_reg[1] (.RN (rst_n), .CK (clk), .D
       (md[1]), .SI (n_41), .SE (set1), .Q (md[1]));
  NAND2X1 g2385__7114(.A (n_23), .B (n_54), .Y (n_57));
  XNOR2X1 g2386__5266(.A (n_25), .B (n_45), .Y (n_55));
  NAND2X1 g2387__2250(.A (n_31), .B (n_52), .Y (n_56));
  NAND2BX1 g2388__6083(.AN (n_49), .B (n_30), .Y (n_54));
  NOR2BX1 g2389__2703(.AN (n_18), .B (n_46), .Y (n_53));
  XNOR2X1 g2390__5795(.A (n_20), .B (n_40), .Y (n_51));
  XNOR2X1 g2391__7344(.A (n_43), .B (n_36), .Y (n_50));
  NOR2BX1 g2392__1840(.AN (n_46), .B (n_24), .Y (n_52));
  ADDHX1 g2393__5019(.A (n_18), .B (n_32), .CO (n_49), .S (n_47));
  NOR2X1 g2394__1857(.A (n_11), .B (n_42), .Y (n_48));
  NOR2X1 g2395__9906(.A (n_21), .B (n_44), .Y (n_45));
  NAND2X1 g2396__8780(.A (n_25), .B (n_44), .Y (n_46));
  ADDHX1 g2397__4296(.A (n_16), .B (n_19), .CO (n_42), .S (n_43));
  ADDHX1 g2398__3772(.A (n_12), .B (n_15), .CO (n_44), .S (n_41));
  SDFFRHQX1 \saving_mix_data_q_reg[0] (.RN (rst_n), .CK (clk), .D
       (md[0]), .SI (n_13), .SE (set1), .Q (md[0]));
  NAND2X1 g2400__1474(.A (n_17), .B (n_37), .Y (n_40));
  SDFFRHQX1 \saving_noise_key_q_reg[5] (.RN (rst_n), .CK (clk), .D
       (nk[5]), .SI (n_10), .SE (set0), .Q (nk[5]));
  SDFFRHQX1 \saving_noise_key_q_reg[0] (.RN (rst_n), .CK (clk), .D
       (nk[2]), .SI (n_9), .SE (set0), .Q (nk[2]));
  INVX1 g2406(.A (n_38), .Y (n_39));
  NAND2X1 g2407__4547(.A (n_17), .B (n_33), .Y (n_36));
  NAND2BX1 g2408__9682(.AN (n_17), .B (n_30), .Y (n_35));
  AOI21X1 g2409__2683(.A0 (n_17), .A1 (n_23), .B0 (n_22), .Y (n_38));
  AND2X1 g2410__1309(.A (n_33), .B (n_19), .Y (n_37));
  SDFFRHQX1 \saving_noise_key_q_reg[1] (.RN (rst_n), .CK (clk), .D
       (nk[7]), .SI (n_8), .SE (set0), .Q (nk[7]));
  INVX1 g2412(.A (n_31), .Y (n_32));
  AND2X1 g2413__6877(.A (n_26), .B (n_22), .Y (n_34));
  AND2X1 g2414__2900(.A (n_23), .B (n_26), .Y (n_33));
  NAND2X1 g2415__2391(.A (n_21), .B (n_25), .Y (n_31));
  OAI222X1 g2416__7675(.A0
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[1]),
       .A1 (n_6), .B0
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[2]),
       .B1 (n_7), .C0 (set0), .C1 (n_5), .Y (n_29));
  OAI222X1 g2417__7118(.A0
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[1]),
       .A1 (n_6), .B0
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[2]),
       .B1 (n_7), .C0 (set0), .C1 (n_0), .Y (n_28));
  OAI222X1 g2418__8757(.A0
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[1]),
       .A1 (n_6), .B0
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[2]),
       .B1 (n_7), .C0 (set0), .C1 (n_1), .Y (n_27));
  NAND2X1 g2419__1786(.A (n_24), .B (n_18), .Y (n_30));
  ADDHX1 g2420__5953(.A (nk[5]), .B (w[5]), .CO (n_16), .S (n_26));
  ADDHX1 g2421__5703(.A (nk[2]), .B (w[2]), .CO (n_24), .S (n_25));
  ADDHX1 g2422__7114(.A (w[4]), .B (nk[4]), .CO (n_22), .S (n_23));
  ADDHX1 g2423__5266(.A (nk[7]), .B (w[1]), .CO (n_21), .S (n_15));
  ADDHX1 g2424__2250(.A (nk[7]), .B (w[7]), .CO (n_14), .S (n_20));
  ADDHX1 g2425__6083(.A (w[0]), .B (nk[2]), .CO (n_12), .S (n_13));
  ADDHX1 g2426__2703(.A (w[6]), .B (nk[6]), .CO (n_11), .S (n_19));
  ADDHX1 g2427__5795(.A (w[3]), .B (nk[3]), .CO (n_17), .S (n_18));
  SDFFRHQX1 \saving_input_data_q_reg[7] (.RN (rst_n), .CK (clk), .D
       (w[7]), .SI (id[7]), .SE (set0), .Q (w[7]));
  SDFFRHQX1 \saving_input_data_q_reg[0] (.RN (rst_n), .CK (clk), .D
       (w[0]), .SI (id[0]), .SE (set0), .Q (w[0]));
  SDFFRHQX1 \saving_input_data_q_reg[6] (.RN (rst_n), .CK (clk), .D
       (w[6]), .SI (id[6]), .SE (set0), .Q (w[6]));
  SDFFRHQX1 \saving_input_data_q_reg[1] (.RN (rst_n), .CK (clk), .D
       (w[1]), .SI (id[1]), .SE (set0), .Q (w[1]));
  SDFFRHQX1 \saving_input_data_q_reg[2] (.RN (rst_n), .CK (clk), .D
       (w[2]), .SI (id[2]), .SE (set0), .Q (w[2]));
  SDFFRHQX1 \saving_input_data_q_reg[4] (.RN (rst_n), .CK (clk), .D
       (w[4]), .SI (id[4]), .SE (set0), .Q (w[4]));
  SDFFRHQX1 \saving_input_data_q_reg[3] (.RN (rst_n), .CK (clk), .D
       (w[3]), .SI (id[3]), .SE (set0), .Q (w[3]));
  SDFFRHQX1 \saving_input_data_q_reg[5] (.RN (rst_n), .CK (clk), .D
       (w[5]), .SI (id[5]), .SE (set0), .Q (w[5]));
  XNOR2X1 g2436__7344(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[1]),
       .B
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[2]),
       .Y (n_10));
  XNOR2X1 g2437__1840(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[1]),
       .B
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[2]),
       .Y (n_9));
  XNOR2X1 g2438__5019(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[1]),
       .B
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[2]),
       .Y (n_8));
  NAND2BXL g2439__1857(.AN
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[1]),
       .B (set0), .Y (n_7));
  NAND2XL g2440__9906(.A (set0), .B
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[1]),
       .Y (n_6));
  INVX1 g2442(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[1]),
       .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[2]));
  INVX1 g2443(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[1]),
       .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[2]));
  INVX1 g2444(.A
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[1]),
       .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[2]));
  NAND2XL g2447__8780(.A
       (extend_ring_oscillator_output_run_ring_oscillator_n_7), .B
       (en), .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_3[0]));
  NAND2XL g2448__4296(.A
       (extend_ring_oscillator_output_run_ring_oscillator_n_9), .B
       (en), .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_5[0]));
  NAND2XL g2449__3772(.A
       (extend_ring_oscillator_output_run_ring_oscillator_n_6), .B
       (en), .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_9[0]));
  NAND2XL g2450__1474(.A
       (extend_ring_oscillator_output_run_ring_oscillator_n_8), .B
       (en), .Y
       (extend_ring_oscillator_output_run_ring_oscillator_out_inv_7[0]));
  DFFRX1 \saving_noise_key_q_reg[3] (.RN (rst_n), .CK (clk), .D (n_29),
       .Q (nk[3]), .QN (n_5));
  DFFRX1 \saving_noise_key_q_reg[4] (.RN (rst_n), .CK (clk), .D (n_27),
       .Q (nk[4]), .QN (n_1));
  DFFRX1 \saving_noise_key_q_reg[6] (.RN (rst_n), .CK (clk), .D (n_28),
       .Q (nk[6]), .QN (n_0));
endmodule

module top(clk_i, rst_n_i, set0_i, set1_i, en_i, id_i, nk_o, md_o);
  input clk_i, rst_n_i, set0_i, set1_i, en_i;
  input  [7:0] id_i;
  output [7:0] nk_o;
  output [8:0] md_o;

  wire clk, rst_n, set0, set1, en;
  wire [7:0] id, nk;
  wire [8:0] md;

  wire VDDC, VDDO;
  wire VSSC, VSSO;

gen_gamma_coder U1 (.clk(clk), 
  .rst_n(rst_n), 
  .set0(set0), 
  .set1(set1), 
  .en(en), 
  .id(id), 
  .nk(nk), 
  .md(md));

PADDI PAD_clk   (.PAD(clk_i),   .Y(clk),   .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_rst_n (.PAD(rst_n_i), .Y(rst_n), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_set0  (.PAD(set0_i),  .Y(set0),  .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_set1  (.PAD(set1_i),  .Y(set1),  .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_en    (.PAD(en_i),    .Y(en),    .VDDIOR(VDDO), .VSSIOR(VSSO));

PADDI PAD_id0 (.PAD(id_i[0]), .Y(id[0]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id1 (.PAD(id_i[1]), .Y(id[1]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id2 (.PAD(id_i[2]), .Y(id[2]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id3 (.PAD(id_i[3]), .Y(id[3]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id4 (.PAD(id_i[4]), .Y(id[4]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id5 (.PAD(id_i[5]), .Y(id[5]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id6 (.PAD(id_i[6]), .Y(id[6]), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADDI PAD_id7 (.PAD(id_i[7]), .Y(id[7]), .VDDIOR(VDDO), .VSSIOR(VSSO));

PADDO PAD_md0 (.A(md[0]), .PAD(md_o[0]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md1 (.A(md[1]), .PAD(md_o[1]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md2 (.A(md[2]), .PAD(md_o[2]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md3 (.A(md[3]), .PAD(md_o[3]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md4 (.A(md[4]), .PAD(md_o[4]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md5 (.A(md[5]), .PAD(md_o[5]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md6 (.A(md[6]), .PAD(md_o[6]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md7 (.A(md[7]), .PAD(md_o[7]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_md8 (.A(md[8]), .PAD(md_o[8]), .VDDIOR(VDDO), .VSSIOR(VSSO));

PADDO PAD_nk0 (.A(nk[0]), .PAD(nk_o[0]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk1 (.A(nk[1]), .PAD(nk_o[1]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk2 (.A(nk[2]), .PAD(nk_o[2]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk3 (.A(nk[3]), .PAD(nk_o[3]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk4 (.A(nk[4]), .PAD(nk_o[4]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk5 (.A(nk[5]), .PAD(nk_o[5]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk6 (.A(nk[6]), .PAD(nk_o[6]), .VDDIOR(VDDO), .VSSIOR(VSSO)); 
PADDO PAD_nk7 (.A(nk[7]), .PAD(nk_o[7]), .VDDIOR(VDDO), .VSSIOR(VSSO));

PADVDD PAD_VDD1 (.VDD(VDDC), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADVDD PAD_VDD2 (.VDD(VDDC), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADVDD PAD_VSS1 (.VSS(VSSC), .VDDIOR(VDDO), .VSSIOR(VSSO));
PADVDD PAD_VSS2 (.VSS(VSSC), .VDDIOR(VDDO), .VSSIOR(VSSO));

PADVDDIOR PAD_VDDIOR (.VDDIOR(VDDO), .VSSIOR(VSSO));
PADVSSIOR PAD_VSSIOR (.VDDIOR(VDDO), .VSSIOR(VSSO));

endmodule