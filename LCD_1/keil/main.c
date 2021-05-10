#include "code_def.h"
#include <string.h>
#include <stdint.h>

extern uint32_t key_flag;

int main()
{   uint16_t x;
    x=0;

	NVIC_CTRL_ADDR	= 1;
	LCD->en = 1;

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
			if(ans == 0) {
                
				LCD->set_sc = 0;
				LCD->set_ec = 0;
                LCD->set_sp = 0;
                LCD->set_ep = 0;
				LCD->color_en = 1;
			}
		    key_flag = 0;
		    Keyboard_keydata_clear = 1;
	}
    
}