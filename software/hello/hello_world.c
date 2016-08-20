#include <stdio.h>
#include "priv/alt_busy_sleep.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"

void write_led(int val)
{
  IOWR_ALTERA_AVALON_PIO_DATA(
    LEDS_BASE,
    val
  );
}

int main()
{
  int count = 0;
  printf("Hello Max10!\n");
  while (1) {
	  alt_busy_sleep(100000);
	  write_led(count++);
	  printf("count: %d\n", count);
  }

  return 0;
}
