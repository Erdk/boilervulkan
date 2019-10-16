CXX=g++
CXXFLAGS= -std=c++17 -I$(VULKAN_SDK)/include -I.
CXXDEBUG= -g3 -ggdb
CXXREL= -march=native -O2
LDFLAGS= -L$(VULKAN_SDK)/lib `pkg-config --static --libs glfw3` -lvulkan
GLSLV=$(VULKAN_SDK)/bin/glslangValidator

boilerv: main.cpp shaders/vert.spv shaders/frag.spv
	$(CXX) $(CXXDEBUG) $(CXXFLAGS) -o $@ main.cpp $(LDFLAGS)

boilervrel: main.cpp shaders/vert.spv shaders/frag.spv
	$(CXX) $(CXXREL) $(CXXFLAGS) -o $@ main.cpp $(LDFLAGS) -DNDEBUG

shaders/vert.spv: shaders/shader.vert
	$(GLSLV) -V -o shaders/vert.spv shaders/shader.vert

shaders/frag.spv: shaders/shader.frag
	$(GLSLV) -V -o shaders/frag.spv shaders/shader.frag

.PHONY: test clean all rel dbg

all: boilerv

rel: boilervrel

dbg: boilerv

test: boilerv
	LD_LIBRARY_PATH=$(VULKAN_SDK)/lib VK_LAYER_PATH=$(VULKAN_SDK)/etc/explicit_layer.d ./boilerv

clean:
	rm -f boilerv boilervrel shaders/*.spv
