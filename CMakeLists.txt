# ==============================================================================
# DynUtil CMake File
# ==============================================================================

CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
#SET(CMAKE_VERBOSE_MAKEFILE ON)

# ==============================================================================
# project setup ----------------------------------------------------------------
# ==============================================================================

# dynutil major version
SET(DYNUTIL_MAJOR_VERSION 4.0)

# dynutil minor version
FIND_PROGRAM(SVN_EXECUTABLE svn
			DOC "subversion command line client")

MACRO(Subversion_GET_REVISION variable)
			EXECUTE_PROCESS(COMMAND ${SVN_EXECUTABLE} info ${CMAKE_CURRENT_SOURCE_DIR}
			  OUTPUT_VARIABLE ${variable}
			  OUTPUT_STRIP_TRAILING_WHITESPACE)
			STRING(REGEX REPLACE "^(.*\n)?Revision: ([^\n]+).*"
			  "\\2" ${variable} "${${variable}}")
ENDMACRO(Subversion_GET_REVISION)

Subversion_GET_REVISION(DYNUTIL_MINOR_VERSION)

SET(DYNUTIL_ALL_VERSION ${DYNUTIL_MAJOR_VERSION}.${DYNUTIL_MINOR_VERSION})

MESSAGE(STATUS "Dynutil version is ${DYNUTIL_ALL_VERSION}")

# ==============================================================================
# install files ----------------------------------------------------------------
# ==============================================================================

ADD_SUBDIRECTORY(bin)
ADD_SUBDIRECTORY(lib)
