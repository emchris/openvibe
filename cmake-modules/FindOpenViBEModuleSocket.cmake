# ---------------------------------
# Finds module Socket
# Adds library to target
# Adds include path
# ---------------------------------
OPTION(DYNAMIC_LINK_OPENVIBE_MODULE_SOCKET "Dynamically link OpenViBE module Socket" ON)

IF(DYNAMIC_LINK_OPENVIBE_MODULE_SOCKET)
	ADD_DEFINITIONS(-DSocket_Shared)
ENDIF(DYNAMIC_LINK_OPENVIBE_MODULE_SOCKET)

IF(DYNAMIC_LINK_OPENVIBE_MODULE_SOCKET)
	SET(OPENVIBE_MODULE_SOCKET_LINKING "")
ELSE(DYNAMIC_LINK_OPENVIBE_MODULE_SOCKET)
	SET(OPENVIBE_MODULE_SOCKET_LINKING "-static")
ENDIF(DYNAMIC_LINK_OPENVIBE_MODULE_SOCKET)

IF(OV_BRANCH_MODULES_SOCKET)
	set(SRC_DIR ${OV_BASE_DIR}/openvibe-modules/socket/${OV_BRANCH_MODULES_SOCKET})
ELSE(OV_BRANCH_MODULES_SOCKET)
	set(SRC_DIR ${OV_BASE_DIR}/openvibe-modules/socket/${OV_TRUNK})
ENDIF(OV_BRANCH_MODULES_SOCKET)

FIND_PATH(PATH_OPENVIBE_MODULES_SOCKET src/socket/defines.h PATHS ${SRC_DIR})
IF(PATH_OPENVIBE_MODULES_SOCKET)
	MESSAGE(STATUS "  Found OpenViBE module Socket...")
	INCLUDE_DIRECTORIES(${PATH_OPENVIBE_MODULES_SOCKET}/src/)

	TARGET_LINK_LIBRARIES(${PROJECT_NAME} openvibe-module-socket${OPENVIBE_MODULE_SOCKET_LINKING})

	ADD_DEFINITIONS(-DTARGET_HAS_Socket)
ELSE(PATH_OPENVIBE_MODULES_SOCKET)
	MESSAGE(STATUS "  FAILED to find OpenViBE module Socket...")
ENDIF(PATH_OPENVIBE_MODULES_SOCKET)
