BEGIN {
 printf("# 1      2              3              4              5              6              7              8              9              10             11             12             13             14             15             16\n");
 printf("# NSTEP  Temp           Press          Etot           EKtot          EPtot          Ebond          Eangle         Edihed         E14vdw         E14el          Evdw           Eel            Ehbond/EGB     Erest          density  \n");
 printf("# ------ -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- -------------- --------------\n");
 stop_line = 0;
 new_record = 0;
 last_nstep = 0;
 first_item = 1;
 actual_step = 0;
}
/A V E R A G E S   O V E R/{
 stop_line = 3;
}
/NSTEP =/ {
 if( stop_line > 0) stop_line--;
 if( stop_line == 0 ){
	if( first_item != 1 ){
	    if( $3 == 0 ){
			stop_line = 1;
			}
		  else{	  
		    if( $3 > last_nstep ){
				actual_step = actual_step + $3 - last_nstep;
				}
			  else{
			  	actual_step = actual_step + $3;
				}	
			} 
		last_nstep = $3;
		}
	  else{
	    actual_step = $3;
		last_nstep = $3;
	  	first_item = 0;
		}	
    if( stop_line == 0 ){
		if ( new_record == 1 ){
			printf(" %14.4f\n",0);
			}
		printf("  %6d %14.4f %14.4f",actual_step,$9,$12);
		new_record = 1;
		}
    }
}
/Etot   =/ {
 if( stop_line == 0 ){
    printf(" %14.4f %14.4f %14.4f",$3,$6,$9);
    }
}
/BOND   =/ {
 if( stop_line == 0 ){
    printf(" %14.4f %14.4f %14.4f",$3,$6,$9);
    }
}
/1-4 NB =/ {
 if( stop_line == 0 ){
    printf(" %14.4f %14.4f %14.4f",$4,$8,$11);
    }
}
/EELEC  =/ {
 if( stop_line == 0 ){
    printf(" %14.4f %14.4f %14.4f",$3,$6,$9);
    }
}
/Density    =/ {
 if( stop_line == 0 ){
    printf(" %14.4f\n",$3);
    }
 new_record = 0;
}
END {
printf("\n");
} 
