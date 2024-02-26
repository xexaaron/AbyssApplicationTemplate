import os
from conan import ConanFile
from conan.tools.cmake import CMake
from conan.tools.files import load, copy


class ConanApplication(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps"

    def requirements(self):
        self.requires("abyssengine/1.0")
        self.requires("raylib/5.0")
    def imports(self):
        self.copy("*.dll", dst="bin", src="bin")
        self.copy("*.dylib*", dst="bin", src="lib")

    def configure_cmake(self):
        cmake = super(ConanApplication, self).configure_cmake()
        # Set the path for CMakeUserPresets.json
        return cmake

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()


 