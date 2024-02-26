
file(GLOB_RECURSE additional_sources "src/*.cpp")
file(GLOB entry_point "*.cpp")
list(APPEND additional_sources ${entry_point})

list(APPEND SOURCE_FILES ${additional_sources})
