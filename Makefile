CXX=g++
CXXFLAGS= -g3 -ggdb -std=c++14 -I$(VULKAN_SDK)/include
LDFLAGS= -L$(VULKAN_SDK)/lib `pkg-config --static --libs glfw3` -lvulkan
GLSLV=$(VULKAN_SDK)/bin/glslangValidator

boilerv: main.cpp shaders/vert.spv shaders/frag.spv
	$(CXX) $(CXXFLAGS) -o $@ main.cpp $(LDFLAGS)

shaders/vert.spv: shaders/shader.vert
	$(GLSLV) -V -o shaders/vert.spv shaders/shader.vert

shaders/frag.spv: shaders/shader.frag
	$(GLSLV) -V -o shaders/frag.spv shaders/shader.frag

.PHONY: test clean all

all: boilerv

test: boilerv
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./boilerv

clean:
	rm -f boilerv shaders/*.spv
