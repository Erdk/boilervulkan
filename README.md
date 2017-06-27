# boilerv

Repositiory with implementation of Vulkan's boilerplate functions. Playground on which I'm learning how different Vulkan components work with each other.

This code was build and tested only on Linux, but it should be easly portable.

## Installation

```
$ # Install g++, glfw and glm devel packages
$ # Download and install Vulkan SDK https://www.lunarg.com/vulkan-sdk/
$ git clone https://github.com/Erdk/boilervulkan
$ cd boilervulkan
$ make
$ make test

```

## Credits

Written according to https://vulkan-tutorial.com/Introduction and https://github.com/Overv/VulkanTutorial (<- most likely you're looking for this repo instead of mine ;))

stb_image.h - MIT License, https://github.com/nothings/stb

tiny_obj_loader - MIT License, https://github.com/syoyo/tinyobjloader

textures/texture.jpg - CC0 Public Domain, https://pixabay.com/en/statue-sculpture-figure-1275469/

Unfortunately I don't have rights to:

- textures/chalet.jpg
- models/chalet.obj

So if you want to test this program first you have to download them from https://vulkan-tutorial.com/Loading_models