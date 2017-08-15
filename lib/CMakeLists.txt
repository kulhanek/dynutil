# ==============================================================================
# DynUtil CMake File
# ==============================================================================

CONFIGURE_FILE(starters/pprodJob.in starters/pprodJob)
CONFIGURE_FILE(starters/precycleJob.in starters/precycleJob)

INSTALL(DIRECTORY
            awk equi prod starters
        USE_SOURCE_PERMISSIONS
        DESTINATION
            lib
        )

# ------------------------------------------------------------------------------



