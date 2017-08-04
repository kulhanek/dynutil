BEGIN {
 printf("# 1     2              3              4              5              6              7              8              9              10             11\n");
 printf("# NSTEP Etot           Ebond          Eangle         Edihed         Evdw           Eel            Ehbond/EGB     E14vdw         E14el          Erest\n");
 printf("# ----- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- --------------\n");
 title_line = 0;
 actual_step = 1;
 stop_line = 0;
 last_nstep = 1;
 first_item = 1;
}
/NSTEP       ENERGY/ {
 title_line = NR+1;
}
{
 if( (title_line == NR)  ){
    if( stop_line == 0 ) {
		if( first_item != 1 ){
			if( $1 > last_nstep ){
				actual_step = actual_step + $1 - last_nstep;
				}
			else{
				actual_step = actual_step + $1;
				}	
			last_nstep = $1;
			}
		  else{
			actual_step = $1;
			last_nstep = $1;
			first_item = 0;
			} 
		printf("  %5d %14.4f",actual_step,$2);
		}
	  else{
   		stop_line--;
		}
   	}
}
/BOND    =/ {
 if( stop_line == 0 ){
 	printf(" %14.4f %14.4f %14.4f",$3,$6,$9);
	}
  else{
   	stop_line--;
	}
}
/VDWAALS =/ {
 if( stop_line == 0 ){
 	printf(" %14.4f %14.4f %14.4f",$3,$6,$9);
 	}
  else{
   	stop_line--;
	}
}
/1-4 VDW =/ {
 if( stop_line == 0 ){
 	printf(" %14.4f %14.4f %14.4f\n",$4,$8,$11);
	}
  else{
   	stop_line--;
	}
}
/FINAL RESULTS/ {
 stop_line = 4;
}
