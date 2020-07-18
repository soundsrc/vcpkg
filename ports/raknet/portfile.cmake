include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO facebookarchive/RakNet
    REF 1a169895a900c9fc4841c556e16514182b75faf8
    SHA512 1db84ae06f1ecb9f63a116967451f9fbbe4e09360ef4e9f6e612269f0074d094b02d1d5f2485b2c96e856533cb332fa97e6f3b0384ca24288c5e04aa3799288f
    HEAD_REF master)

vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES
            "${CMAKE_CURRENT_LIST_DIR}/000-install-path.patch"
)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	OPTIONS
		-DCMAKE_INSTALL_PREFIX=${CURRENT_PACKAGES_DIR}
		-DRAKNET_ENABLE_DLL=FALSE
		-DRAKNET_ENABLE_SAMPLES=FALSE
	PREFER_NINJA)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/raknet)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/raknet/LICENSE ${CURRENT_PACKAGES_DIR}/share/raknet/copyright)

message(STATUS "Installing done")

