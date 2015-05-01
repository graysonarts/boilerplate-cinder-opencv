if(EXISTS ${CMAKE_SOURCE_DIR}/.git)
    FIND_PACKAGE(Git)
    if(GIT_FOUND)
        EXECUTE_PROCESS(
            COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
            WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            OUTPUT_VARIABLE "project_BUILD_VERSION"
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        MESSAGE(STATUS "Git Version: ${project_BUILD_VERSION}")
    else()
        SET(project_BUILD_VERSION 0)
    endif()
endif()

set(project_MAJOR_VERSION 0)
set(project_MINOR_VERSION 0)
set(project_PATCH_VERSION 0)
set(project_VERSION
    ${project_MAJOR_VERSION}.${project_MINOR_VERSION}.${project_PATCH_VERSION}-${project_BUILD_VERSION})

CONFIGURE_FILE(${CMAKE_SOURCE_DIR}/version.h.in ${CMAKE_CURRENT_BINARY_DIR}/bin/version.h @ONLY)
