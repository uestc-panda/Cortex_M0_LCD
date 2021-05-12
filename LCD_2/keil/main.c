#include "code_def.h"
#include <string.h>
#include <stdint.h>

extern uint32_t key_flag;

int main()
{   
	NVIC_CTRL_ADDR	= 1;
	LCD->rstn = 1;
	LCD->en = 1;

	int sx, sy, ex, ey;
	sx = sy = ex = ey = 0;

    while(1){
		  while(!key_flag);
			uint32_t din;
		    din = Keyboard_keydata_clear;
		    int i = 0;
		    int ans = 0;
		    for (i = 0; i < 16; i++) {
			    if ((din >> i) & 1) {
			    	ans = i;
				    break;
		    	}
		    }
            if(ans == 15) {
				LCD->ini_en = 1;
			}
			else{
			    if(ans == 14) {
                    sx = sy = 0;
			    	ex = ey = 79;
			    }
			    if (ans == 2) { // left
			    	if (sx < 80) ;
			    	else {
			    		sx -= 80;
			    		ex -= 80;
			    	}
			    }
			    if (ans == 0) { //right
			    	if (ex > 160) ;
			    	else {
			    		sx += 80;
			    		ex += 80;
			    	}
			    }
			    if (ans == 5) { // up
			    	if (sy < 80) ;
			    	else {
			    		sy -= 80;
			    		ey -= 80;
			    	}
			    }
			    if (ans == 1) { // down				
			    	if (ey > 240) ;
			    	else {
			    		sy += 80;
			    		ey += 80;
			    	}
			    }
			    
			    LCD->set_sc = sx;
			    LCD->set_ec = ex;
				if(sy<256){
					LCD->set_sp = sy;
				}
				else{
                    LCD->set_sp = sy - 256 + 0x10000;
				}
				if(ey<256){
					LCD->set_ep = ey;
				}
				else{
                    LCD->set_ep = ey - 256 + 0x10000;
				}				
			    LCD->color_en = 1;
			}
		    key_flag = 0;
		    Keyboard_keydata_clear = 1;
	}
    
}