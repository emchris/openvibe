# ---------------------------------
# Finds module System
# Adds library to target
# Adds include path
# ---------------------------------
OPTION(DYNAMIC_LINK_OPENVIBE_MODULE_SYSTEM "Dynamically link OpenViBE module System" ON)

IF(DYNAMIC_LINK_OPENVIBE_MODULE_SYSTEM)
	ADD_DEFINITIONS(-DSystem_Shared)
ENDIF(DYNAMIC_LINK_OPENVIBE_MODULE_SYSTEM)

IF(DYNAMIC_LINK_OPENVIBE_MODULE_SYSTEM)
	SET(OPENVIBE_MODULE_SYSTEM_LINKING "")
ELSE(DYNAMIC_LINK_OPENVIBE_MODULE_SYSTEM)
	SET(OPENVIBE_MODULE_SYSTEM_LINKING "-static")
ENDIF(DYNAMIC_LINK_OPENVIBE_MODULE_SYSTEM)


IF(OV_BRANCH_MODULES_SYSTEM)
	set(SRC_DIR ${OV_BASE_DIR}/openvibe-modules/system/${OV_BRANCH_MODULES_SYSTEM})
ELSE(OV_BRANCH_MODULES_SYSTEM)
	set(SRC_DIR ${OV_BASE_DIR}/openvibe-modules/system/${OV_TRUNK})
ENDIF(OV_BRANCH_MODULES_SYSTEM)

FIND_PATH(PATH_OPENVIBE_MODULES_SYSTEM src/system/defines.h PATHS ${SRC_DIR})
IF(PATH_OPENVIBE_MODULES_SYSTEM)
	MESSAGE(STATUS "  Found OpenViBE module System...")
	INCLUDE_DIRECTORIES(${PATH_OPENVIBE_MODULES_SYSTEM}/src/)

	TARGET_LINK_LIBRARIES(${PROJECT_NAME} openvibe-module-system${OPENVIBE_MODULE_SYSTEM_LINKING})

	ADD_DEFINITIONS(-DTARGET_HAS_System)
ELSE(PATH_OPENVIBE_MODULES_SYSTEM)
	MESSAGE(STATUS "  FAILED to find OpenViBE module System...")
ENDIF(PATH_OPENVIBE_MODULES_SYSTEM)
