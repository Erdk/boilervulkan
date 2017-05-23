CXX=g++
CXXFLAGS= -g3 -ggdb -std=c++14 -I$(VULKAN_SDK_PATH)/include
LDFLAGS= -L$(VULKAN_SDK_PATH)/lib `pkg-config --static --libs glfw3` -lvulkan

VulkanTest: main.cpp shaders/vert.spv shaders/frag.spv
	$(CXX) $(CXXFLAGS) -o $@ main.cpp $(LDFLAGS)

shaders/vert.spv: shaders/shader.vert
	$(VULKAN_SDK_PATH)/bin/glslangValidator -V -o shaders/vert.spv shaders/shader.vert

shaders/frag.spv: shaders/shader.frag
	$(VULKAN_SDK_PATH)/bin/glslangValidator -V -o shaders/frag.spv shaders/shader.frag

.PHONY: test clean

test: VulkanTest
	LD_LIBRARY_PATH=$(VULKAN_SDK_PATH)/lib VK_LAYER_PATH=$(VULKAN_SDK_PATH)/etc/explicit_layer.d ./VulkanTest

clean:
	rm -f VulkanTest shaders/*.spv
