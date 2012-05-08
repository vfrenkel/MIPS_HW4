#include <stdio.h>
#include <math.h>

/*
 * Bresenham's line algorithm
 *
 * Adapted from the pseudocode from the Wikipedia entry
 *
 * http://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
 *
 * by Stephen A. Edwards
 */

/* Swap the values of a and b, using c as a temporary */
#define SWAP(a, b, c) ((c) = (a), (a) = (b), (b) = (c))

char fb[]; /* Text Framebuffer */

int abs(int x)
{
  return x < 0 ? -x : x;
}

void plot(int x, int y)
{
  fb[x + 64 * y] = '*';
}

void line(int x0, int y0, int x1, int y1)
{
  int ystep, err;
  int dx = abs(x1 - x0);
  int dy = abs(y1 - y0);
  int steep = dx < dy;
  if (steep) {
    SWAP(x0, y0, err);
    SWAP(x1, y1, err);
  }
  if (x1 < x0) {
    SWAP(x0, x1, err);
    SWAP(y0, y1, err);
  }
  dx = x1 - x0;
  dy = abs(y1 - y0);
  ystep = y0 < y1 ? 1 : -1;
  err = dx >> 1;
  for (;;) {
    if (steep) plot(y0, x0); else plot(x0, y0);
    if (x0 == x1) break;
    x0++;
    err -= dy;
    if (err < 0) {
      y0 += ystep;
      err += dx;
    }
  }
}

int main()
{
  /* Draw a star */
  line(31, 1, 47, 28);
  line(57, 11, 14, 28);
  line(47, 28, 4, 11);
  line(14, 28, 30, 1);
  line(4, 11, 57, 11);

  printf("%s", fb);
  return 0;
}

char fb[] =
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n"
  "                                                               \n";
