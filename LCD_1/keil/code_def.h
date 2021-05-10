#include <stdint.h>

//INTERRUPT DEF
#define NVIC_CTRL_ADDR (*(volatile unsigned *)0xe000e100)

//KEYBOARD DEF
#define Keyboard_keydata_clear (*(volatile unsigned *)0x40000000)

//LCD DEF
typedef struct
{
    volatile uint32_t rstn;    //0x40000010
    volatile uint32_t en;      //0x40000014
    volatile uint32_t ini_en;  //0x40000018
    volatile uint32_t color_en;//0x4000001C
    volatile uint32_t set_sc;  //0x40000020
    volatile uint32_t set_ec;  //0x40000024
    volatile uint32_t set_sp;  //0x40000028
    volatile uint32_t set_ep;  //0x4000002C
}LCDType;

#define LCD_BASE 0x40000010
#define LCD ((LCDType *)LCD_BASE)

void KEY_ISR(void);