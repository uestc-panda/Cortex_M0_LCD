#include <stdint.h>
#include <stdio.h>
#include "code_def.h"
extern uint32_t key_flag;
void game_mode(uint16_t x, uint16_t y, uint16_t dx, uint16_t dy) {
	uint16_t nx, ny;
	nx = x, ny = y;
	uint32_t din;
	LCD -> LCD_MODE = 1;
	while (1) {
		LCD_Fill(x, y, x + dx, y + dy, WHITE);
		LCD_Fill(nx, ny, nx + dx, ny + dy, RED);
		x = nx;
		y = ny;
		while (!key_flag) ;
		din = Keyboard_keydata_clear;
		    int i = 0;
		    int ans = 0;
		    for (i = 0; i < 16; i++) {
			    if ((din >> i) & 1) {
			    	ans = i;
				    break;
		    	}
		    }
		if (ans == 2) {
			if (x >= dx) nx = x - dx;
		}
		if (ans == 5) {
			if (y + dy <= 300) ny = y + dy;
		}
		if (ans == 1) {
			if (y >= dy) ny = y - dy;
		}
		if (ans == 0) {
			if (x + dx <= 220) nx = x + dx; 
		}
		// LCD_Clear(WHITE);
	    key_flag = 0;
	    Keyboard_keydata_clear = 1;
	}
}

int main()
{
	uint16_t x, y;
	uint8_t dx, dy;
	SYSInit();
    LCD->LCD_RST = 0;
	delay(5000000);
	LCD->LCD_RST = 1;
	x  = y  = 110;
	dx = dy = 20;
	LCD_Init(0);
	//while (1) {
		//x = 0; y = 0;
		//for (x = 0; x < 240; x += dx) {
		//	for (y = 0; y < 320; y += dy) {
		//		LCD_Fill(x, y, x + dx, y + dy, RED);
		//		delay(50000000);
		//		LCD_Fill(x, y, x + dx, y + dy, WHITE);
		//	}
		//}
	//}
	game_mode(x, y, dx, dy);
}
