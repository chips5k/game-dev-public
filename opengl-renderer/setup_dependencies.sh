#!/usr/bin/env bash
# setup_dependencies.sh
# Installs GLFW and GLM via system package manager and downloads
# single-header glad and stb_image into vendor/.

set -e

echo "Installing GLFW and GLM..."
sudo apt-get install -y libglfw3-dev libglm-dev

echo "Fetching glad..."
mkdir -p vendor
# Download a minimal glad loader for OpenGL 3.3 Core
# Visit https://glad.dav1d.de and generate for gl 3.3 core, then drop glad.c + glad/glad.h here
# Or use the Python glad generator:
#   pip install glad
#   glad --profile core --out-path vendor --generator c --spec gl --no-loader
echo "  Run: glad --profile core --out-path vendor --generator c --spec gl"
echo "  then move vendor/src/glad.c -> vendor/glad.c and vendor/include/glad/glad.h -> vendor/glad/glad.h"

echo "Fetching stb_image..."
curl -fsSL https://raw.githubusercontent.com/nothings/stb/master/stb_image.h -o vendor/stb_image.h
# Compile wrapper
cat > vendor/stb_image.cpp << 'EOF'
#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"
EOF

echo "Done. Build with:"
echo "  cmake -B build . && cmake --build build"
