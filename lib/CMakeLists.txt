# ==============================================================================
# DynUtil CMake File
# ==============================================================================

CONFIGURE_FILE(prod/cpu1ns/pprodJob.in prod/cpu1ns/pprodJob)
CONFIGURE_FILE(prod/gpu10ns/pprodJob.in prod/gpu10ns/pprodJob)

CONFIGURE_FILE(recycle/cpu1ns/precycleJob.in recycle/cpu1ns/precycleJob)
CONFIGURE_FILE(recycle/gpu10ns/precycleJob.in recycle/gpu10ns/precycleJob)

CONFIGURE_FILE(starters/precycleCPMD-starter.in starters/precycleCPMD-starter)

INSTALL(DIRECTORY
            awk equi prod recycle starters
        USE_SOURCE_PERMISSIONS
        DESTINATION
            lib
        PATTERN ".svn" EXCLUDE
        )

# ------------------------------------------------------------------------------



