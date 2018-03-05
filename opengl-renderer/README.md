# OpenGL Renderer

C++ OpenGL renderer with camera controls, texture loading, and GLSL shaders.

## Dependencies

GLFW and GLM are installed via your system package manager. `glad` and `stb_image` are single-header/single-source libraries fetched locally.

```bash
chmod +x setup_dependencies.sh && ./setup_dependencies.sh
```

Alternatively install manually:

```bash
# Ubuntu / Debian
sudo apt install libglfw3-dev libglm-dev
```

Then generate a [glad](https://glad.dav1d.de) loader for **OpenGL 3.3 Core** and place:
- `glad.c` → `vendor/glad.c`
- `glad/glad.h` → `vendor/glad/glad.h`

Download [stb_image.h](https://github.com/nothings/stb/blob/master/stb_image.h) → `vendor/stb_image.h`

## Build

```bash
cmake -B build . && cmake --build build
./build/opengl-renderer
```

## References

- [LearnOpenGL](https://learnopengl.com/) — tutorials this project follows
