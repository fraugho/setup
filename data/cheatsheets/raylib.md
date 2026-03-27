# raylib

Simple 2D/3D game library. Works with C, Zig, Rust.

## Compile (C)
```sh
gcc game.c -lraylib -lm -lpthread -ldl -lrt -lX11 -o game
# or simpler with pkg-config:
gcc game.c $(pkg-config --libs --cflags raylib) -o game
```

## Minimal Example (C)
```c
#include "raylib.h"

int main(void) {
    InitWindow(800, 600, "my game");
    SetTargetFPS(60);

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(BLACK);
        DrawText("hello", 10, 10, 20, WHITE);
        DrawRectangle(100, 100, 50, 50, RED);
        EndDrawing();
    }
    CloseWindow();
    return 0;
}
```

## Core Functions
```c
// Window
InitWindow(w, h, title)     CloseWindow()
SetTargetFPS(60)            GetFPS()
WindowShouldClose()         IsWindowResized()

// Drawing
BeginDrawing()              EndDrawing()
ClearBackground(color)
DrawPixel(x, y, color)
DrawLine(x1, y1, x2, y2, color)
DrawRectangle(x, y, w, h, color)
DrawCircle(x, y, r, color)
DrawText(text, x, y, size, color)

// Textures (sprites)
LoadTexture(path)           UnloadTexture(tex)
DrawTexture(tex, x, y, WHITE)
DrawTextureRec(tex, srcRect, pos, WHITE)  // sprite sheet

// Input
IsKeyPressed(KEY_SPACE)     IsKeyDown(KEY_RIGHT)
IsMouseButtonPressed(0)     GetMousePosition()

// Audio
InitAudioDevice()           LoadSound(path)
PlaySound(snd)              LoadMusicStream(path)
```

## Zig
```sh
# Use raylib-zig bindings
# or link via build.zig
```
