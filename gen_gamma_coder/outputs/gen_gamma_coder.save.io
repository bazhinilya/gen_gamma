(globals
    version = 3
    io_order = clockwise
)

(iopad
  (topleft (inst name="PAD_Corner1" cell=padIORINGCORNER orientation = R270))
  (top (inst name="PAD_VDD1"  cell=PADVDD)
	   (inst name="PAD_clk"   cell=PADDI)
       (inst name="PAD_en"    cell=PADDI)
       (inst name="PAD_rst_n" cell=PADDI)
	   (inst name="PAD_set0"  cell=PADDI)
	   (inst name="PAD_set1"  cell=PADDI) 
	   
  )
  (topright (inst name="PAD_Corner2" cell=padIORINGCORNER orientation = R180))
  (right (inst name="PAD_VSS2" cell=PADVSS)
		 (inst name="PAD_id0"  cell=PADDI) 
		 (inst name="PAD_id1"  cell=PADDI) 
		 (inst name="PAD_id2"  cell=PADDI) 
		 (inst name="PAD_id3"  cell=PADDI) 
		 (inst name="PAD_id4"  cell=PADDI) 
		 (inst name="PAD_id5"  cell=PADDI) 
		 (inst name="PAD_id6"  cell=PADDI) 
		 (inst name="PAD_id7"  cell=PADDI) 
  )
  (bottomright (inst name="PAD_Corner3" cell=padIORINGCORNER orientation = R90))
  (bottom (inst name="PAD_VDD2" cell=PADVDD)
  		  (inst name="PAD_md0"  cell=PADDO) 
		  (inst name="PAD_md1"  cell=PADDO) 
		  (inst name="PAD_md2"  cell=PADDO) 
		  (inst name="PAD_md3"  cell=PADDO) 
		  (inst name="PAD_md4"  cell=PADDO) 
		  (inst name="PAD_md5"  cell=PADDO) 
	  	  (inst name="PAD_md6"  cell=PADDO) 
		  (inst name="PAD_md7"  cell=PADDO) 
		  (inst name="PAD_md8"  cell=PADDO)
  )
  (bottomleft (inst name="PAD_Corner4" cell=padIORINGCORNER orientation = R0))
  (left (inst name="PAD_VSS1" cell=PADVSS)
 		(inst name="PAD_nk0"  cell=PADDO) 
	    (inst name="PAD_nk1"  cell=PADDO) 
	    (inst name="PAD_nk2"  cell=PADDO) 
	    (inst name="PAD_nk3"  cell=PADDO) 
	    (inst name="PAD_nk4"  cell=PADDO) 
	    (inst name="PAD_nk5"  cell=PADDO) 
	    (inst name="PAD_nk6"  cell=PADDO) 
	    (inst name="PAD_nk7"  cell=PADDO) 
  )
)