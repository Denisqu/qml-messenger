# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\backend-client_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\backend-client_autogen.dir\\ParseCache.txt"
  "backend-client_autogen"
  )
endif()
