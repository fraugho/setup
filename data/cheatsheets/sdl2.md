# SDL2

Low-level 2D game / multimedia library.

## Compile (C)
```sh
gcc game.c $(sdl2-config --cflags --libs) -o game
gcc game.c -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_mixer -o game
```

## Minimal Example (C)
```c
#include <SDL2/SDL.h>

int main(int argc, char *argv[]) {
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window *win = SDL_CreateWindow("game",
        SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
        800, 600, 0);
    SDL_Renderer *ren = SDL_CreateRenderer(win, -1,
        SDL_RENDERER_ACCELERATED);

    int running = 1;
    SDL_Event e;
    while (running) {
        while (SDL_PollEvent(&e))
            if (e.type == SDL_QUIT) running = 0;

        SDL_SetRenderDrawColor(ren, 0, 0, 0, 255);
        SDL_RenderClear(ren);

        // draw red rectangle
        SDL_SetRenderDrawColor(ren, 255, 0, 0, 255);
        SDL_Rect r = {100, 100, 50, 50};
        SDL_RenderFillRect(ren, &r);

        SDL_RenderPresent(ren);
    }
    SDL_DestroyRenderer(ren);
    SDL_DestroyWindow(win);
    SDL_Quit();
    return 0;
}
```

## Key Functions
```c
// Input
SDL_PollEvent(&e)
e.type == SDL_KEYDOWN
e.key.keysym.sym == SDLK_SPACE
const Uint8 *keys = SDL_GetKeyboardState(NULL);
keys[SDL_SCANCODE_LEFT]

// Textures
SDL_LoadBMP("sprite.bmp")
IMG_LoadTexture(ren, "sprite.png")  // SDL2_image
SDL_RenderCopy(ren, tex, &src, &dst)

// Audio (SDL2_mixer)
Mix_OpenAudio(44100, MIX_DEFAULT_FORMAT, 2, 2048)
Mix_LoadWAV("sfx.wav")
Mix_PlayChannel(-1, sound, 0)

// Timing
SDL_GetTicks()              // ms since init
SDL_Delay(16)               // sleep ms
```
