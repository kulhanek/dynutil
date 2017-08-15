# ==============================================================================
# DynUtil CMake File
# ==============================================================================

INSTALL(FILES
            extract-mdout
            extract-minout
            pequi-prep
            pprod
            pprod-prep
            precycle
            precycle-prep
        DESTINATION
            bin
        PERMISSIONS
            OWNER_EXECUTE GROUP_EXECUTE WORLD_EXECUTE OWNER_READ GROUP_READ WORLD_READ
        )

