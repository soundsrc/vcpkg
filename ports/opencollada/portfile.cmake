include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO KhronosGroup/OpenCOLLADA
    REF v1.6.66
    SHA512 62c5eca0d4ba7e61673b446579a36d2dccab5a9d73f3e73eecba5bab78a30f4cb85b218c3d698cb888e34726e585b0bd921da845f3b77085c80f9dea31bc0507
    HEAD_REF master
	PATCHES isnan.patch)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY ${SOURCE_PATH}/README DESTINATION ${CURRENT_PACKAGES_DIR}/share/opencollada)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/opencollada/README ${CURRENT_PACKAGES_DIR}/share/opencollada/copyright)

message(STATUS "Installing done")

