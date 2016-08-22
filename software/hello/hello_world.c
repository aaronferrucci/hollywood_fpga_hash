#include <stdio.h>
#include "priv/alt_busy_sleep.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"

typedef struct {
  volatile int *pCSR;
  volatile unsigned short *pMEM;
  int span;
} t_hasher;

void write_led(int val)
{
  IOWR_ALTERA_AVALON_PIO_DATA(
    LEDS_BASE,
    val
  );
}

int read_csr(t_hasher* p_hasher)
{
  return *(p_hasher->pCSR);
}

void write_csr(t_hasher* p_hasher, int val)
{
  *(p_hasher->pCSR) = val;
}

int success(unsigned short r4, unsigned short r6)
{
  return (r4 == 0xfeb1 && r6 == 0x9298);
}

unsigned short swapb(unsigned short val)
{
  return (val >> 8) | ((val & 0xFF) << 8);
}

void rehash(short pw_bytes, unsigned short *r4, unsigned short *r6)
{
  unsigned short swapped = swapb(pw_bytes);
  unsigned short new_r4 = *r6 ^ swapped;
  *r6 = swapb(*r4 + swapped);
  *r4 = new_r4;
}

int test(unsigned short *p)
{
    unsigned short r4 = 0;
    unsigned short r6 = 0;

    rehash(p[0], &r4, &r6);
    rehash(p[1], &r4, &r6);
    rehash(p[2], &r4, &r6);
    return success(r4, r6);
}

void fix(unsigned short p[3])
{
  p[0]--;
  if (p[0] == 0xFFFF)
  {
    p[1]--;
    if (p[1] == 0xFFFF)
    {
      p[2] -= 0x100;
    }
  }
}

void print(unsigned short *p)
{
  printf("%04X%04X%02X\n", p[0], p[1], p[2] >> 8);
}

int dump(t_hasher *p_hasher)
{
  volatile unsigned short *pMem1 = p_hasher->pMEM;

  unsigned short p[3] = {0};
  int accept_count = 0;
  for (int i = 0; i < p_hasher->span / sizeof(unsigned short); ++i)
  {
    if ((i % 4) == 3)
    {
      fix(p);
	  if (test(p)) {
		printf("accept: ");
	    print(p);
	    accept_count++;
	  }
	  p[0] = p[1] = p[2] = 0;
    }
    else
    {
      p[i % 4] = pMem1[i];
    }
  }
  if (accept_count) {
	 printf("hasher at base address 0x%08X produced %d passwords\n", pMem1, accept_count);
  }
  return accept_count;
}

void clear(t_hasher *p_hasher)
{
  volatile unsigned short *pMem1 = p_hasher->pMEM;

  for (int i = 0; i < p_hasher->span / sizeof(unsigned short); ++i)
  {
	  pMem1[i] = 0;
  }
}

/*
  volatile int *pCSR;
  volatile unsigned short *pMEM;
  int span;

 */
#define NUM_HASHERS 32
int main()
{
  t_hasher h0 = {
    (volatile int*)PW_GEN_0_BASE,
    (volatile unsigned short*)PW_MEM_0_BASE,
    PW_MEM_0_SPAN
  };
  t_hasher h1 = {
    (volatile int*)PW_GEN_1_BASE,
    (volatile unsigned short*)PW_MEM_1_BASE,
    PW_MEM_1_SPAN
  };
  t_hasher h2 = {
    (volatile int*)PW_GEN_2_BASE,
    (volatile unsigned short*)PW_MEM_2_BASE,
    PW_MEM_2_SPAN
  };
  t_hasher h3 = {
    (volatile int*)PW_GEN_3_BASE,
    (volatile unsigned short*)PW_MEM_3_BASE,
    PW_MEM_1_SPAN
  };
  t_hasher h4 = {
    (volatile int*)PW_GEN_4_BASE,
    (volatile unsigned short*)PW_MEM_4_BASE,
    PW_MEM_4_SPAN
  };
  t_hasher h5 = {
    (volatile int*)PW_GEN_5_BASE,
    (volatile unsigned short*)PW_MEM_5_BASE,
    PW_MEM_5_SPAN
  };
  t_hasher h6 = {
    (volatile int*)PW_GEN_6_BASE,
    (volatile unsigned short*)PW_MEM_6_BASE,
    PW_MEM_6_SPAN
  };
  t_hasher h7 = {
    (volatile int*)PW_GEN_7_BASE,
    (volatile unsigned short*)PW_MEM_7_BASE,
    PW_MEM_7_SPAN
  };
  t_hasher h8 = {
    (volatile int*)PW_GEN_8_BASE,
    (volatile unsigned short*)PW_MEM_8_BASE,
    PW_MEM_8_SPAN
  };
  t_hasher h9 = {
    (volatile int*)PW_GEN_9_BASE,
    (volatile unsigned short*)PW_MEM_9_BASE,
    PW_MEM_9_SPAN
  };
  t_hasher h10 = {
    (volatile int*)PW_GEN_10_BASE,
    (volatile unsigned short*)PW_MEM_10_BASE,
    PW_MEM_10_SPAN
  };
  t_hasher h11 = {
    (volatile int*)PW_GEN_11_BASE,
    (volatile unsigned short*)PW_MEM_11_BASE,
    PW_MEM_11_SPAN
  };
  t_hasher h12 = {
    (volatile int*)PW_GEN_12_BASE,
    (volatile unsigned short*)PW_MEM_12_BASE,
    PW_MEM_12_SPAN
  };
  t_hasher h13 = {
    (volatile int*)PW_GEN_13_BASE,
    (volatile unsigned short*)PW_MEM_13_BASE,
    PW_MEM_13_SPAN
  };
  t_hasher h14 = {
    (volatile int*)PW_GEN_14_BASE,
    (volatile unsigned short*)PW_MEM_14_BASE,
    PW_MEM_14_SPAN
  };
  t_hasher h15 = {
    (volatile int*)PW_GEN_15_BASE,
    (volatile unsigned short*)PW_MEM_15_BASE,
    PW_MEM_15_SPAN
  };
  t_hasher h16 = {
    (volatile int*)PW_GEN_16_BASE,
    (volatile unsigned short*)PW_MEM_16_BASE,
    PW_MEM_16_SPAN
  };
  t_hasher h17 = {
    (volatile int*)PW_GEN_17_BASE,
    (volatile unsigned short*)PW_MEM_17_BASE,
    PW_MEM_17_SPAN
  };
  t_hasher h18 = {
    (volatile int*)PW_GEN_18_BASE,
    (volatile unsigned short*)PW_MEM_18_BASE,
    PW_MEM_18_SPAN
  };
  t_hasher h19 = {
    (volatile int*)PW_GEN_19_BASE,
    (volatile unsigned short*)PW_MEM_19_BASE,
    PW_MEM_19_SPAN
  };
  t_hasher h20 = {
    (volatile int*)PW_GEN_20_BASE,
    (volatile unsigned short*)PW_MEM_20_BASE,
    PW_MEM_20_SPAN
  };
  t_hasher h21 = {
    (volatile int*)PW_GEN_21_BASE,
    (volatile unsigned short*)PW_MEM_21_BASE,
    PW_MEM_21_SPAN
  };
  t_hasher h22 = {
    (volatile int*)PW_GEN_22_BASE,
    (volatile unsigned short*)PW_MEM_22_BASE,
    PW_MEM_22_SPAN
  };
  t_hasher h23 = {
    (volatile int*)PW_GEN_23_BASE,
    (volatile unsigned short*)PW_MEM_23_BASE,
    PW_MEM_23_SPAN
  };
  t_hasher h24 = {
    (volatile int*)PW_GEN_24_BASE,
    (volatile unsigned short*)PW_MEM_24_BASE,
    PW_MEM_24_SPAN
  };
  t_hasher h25 = {
    (volatile int*)PW_GEN_25_BASE,
    (volatile unsigned short*)PW_MEM_25_BASE,
    PW_MEM_25_SPAN
  };
  t_hasher h26 = {
    (volatile int*)PW_GEN_26_BASE,
    (volatile unsigned short*)PW_MEM_26_BASE,
    PW_MEM_26_SPAN
  };
  t_hasher h27 = {
    (volatile int*)PW_GEN_27_BASE,
    (volatile unsigned short*)PW_MEM_27_BASE,
    PW_MEM_27_SPAN
  };
  t_hasher h28 = {
    (volatile int*)PW_GEN_28_BASE,
    (volatile unsigned short*)PW_MEM_28_BASE,
    PW_MEM_28_SPAN
  };
  t_hasher h29 = {
    (volatile int*)PW_GEN_29_BASE,
    (volatile unsigned short*)PW_MEM_29_BASE,
    PW_MEM_29_SPAN
  };
  t_hasher h30 = {
    (volatile int*)PW_GEN_30_BASE,
    (volatile unsigned short*)PW_MEM_30_BASE,
    PW_MEM_30_SPAN
  };
  t_hasher h31 = {
    (volatile int*)PW_GEN_31_BASE,
    (volatile unsigned short*)PW_MEM_31_BASE,
    PW_MEM_31_SPAN
  };

  t_hasher *hashers[] = {
    &h0,
    &h1,
    &h2,
    &h3,
    &h4,
    &h5,
    &h6,
    &h7,
    &h8,
    &h9,
    &h10,
    &h11,
    &h12,
    &h13,
    &h14,
    &h15,
    &h16,
    &h17,
    &h18,
    &h19,
    &h20,
    &h21,
    &h22,
    &h23,
    &h24,
    &h25,
    &h26,
    &h27,
    &h28,
    &h29,
    &h30,
    &h31,
  };

  int count = 0;
  printf("Hollywood hasher\n");
  printf("setting 'run' to 0\n");
  for (int i = 0; i < NUM_HASHERS; ++i) {
    write_csr(hashers[i], 0);
  }

  printf("clearing dual-port memory\n");
  for (int i = 0; i < NUM_HASHERS; ++i) {
    clear(hashers[i]);
  }
  printf("setting 'run' to 1\n");
  for (int i = 0; i < NUM_HASHERS; ++i) {
    write_csr(hashers[i], 1);
  }
  printf("waiting for hashing engine\n");
  // wait for the last - it was started last, so when it's finished,
  // all should be.
  while(read_csr(hashers[NUM_HASHERS - 1])) {
    alt_busy_sleep(1000000);
    write_led(count++);
    printf("count: %d\n", count);
  }

  int num_passwords = 0;
  for (int i = 0; i < NUM_HASHERS; ++i) {
    num_passwords += dump(hashers[i]);
  }
  printf("%d hashing engines found %d passwords total\n", NUM_HASHERS, num_passwords);
  return 0;
}
