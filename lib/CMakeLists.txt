# ==============================================================================
# DynUtil CMake File
# ==============================================================================

CONFIGURE_FILE(starters/pprodJob.in starters/pprodJob)

INSTALL(DIRECTORY
            awk equi prod starters
        USE_SOURCE_PERMISSIONS
        DESTINATION
            lib
        )

# ------------------------------------------------------------------------------



