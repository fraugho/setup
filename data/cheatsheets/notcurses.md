# notcurses

Powerful terminal graphics library (C).

## Compile
```sh
gcc game.c $(pkg-config --cflags --libs notcurses) -o game
```

## Minimal Example (C)
```c
#include <notcurses/notcurses.h>

int main(void) {
    struct notcurses_options opts = { .flags = NCOPTION_SUPPRESS_BANNERS };
    struct notcurses *nc = notcurses_init(&opts, NULL);
    struct ncplane *std = notcurses_stdplane(nc);

    ncplane_putstr_yx(std, 0, 0, "hello terminal");
    notcurses_render(nc);
    notcurses_getc_blocking(nc, NULL);  // wait for key

    notcurses_stop(nc);
    return 0;
}
```

## Key Concepts
```c
// Planes (layered drawing surfaces)
ncplane_create(parent, &opts)
ncplane_putstr_yx(plane, y, x, "text")
ncplane_putchar_yx(plane, y, x, 'A')
ncplane_set_fg_rgb8(plane, r, g, b)
ncplane_set_bg_rgb8(plane, r, g, b)

// Rendering
notcurses_render(nc)             // flush to screen

// Input
notcurses_getc_blocking(nc, &ni) // blocking input
notcurses_getc_nblock(nc, &ni)   // non-blocking

// Images & video
ncvisual_from_file("image.png")
ncvisual_blit(nc, visual, &opts)

// Pixels (sixel/kitty graphics)
// Supports true pixel rendering in kitty terminal
```

## Features
- True color, Unicode, emoji
- Sixel and Kitty graphics protocol
- Video playback in terminal
- Fade effects, animations
- Widget toolkit (menus, plots, readers)
