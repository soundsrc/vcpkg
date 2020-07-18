include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO richgel999/rg-etc1
    REF 701f354e19f69f2b7f79cc5c6fdde870467f01bb
    SHA512 c21a6b12b394201c0d755109f3a16f5e0ac5c269c569db3cdfcb319f80692d56ceee8d30df643f72851396abc7d853f3a11c0eee5f59fd17f6ac171ab815343a
    HEAD_REF master)

vcpkg_apply_patches(
	SOURCE_PATH ${SOURCE_PATH}
	PATCHES ${CMAKE_CURRENT_LIST_DIR}/cmake.patch)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY ${CMAKE_CURRENT_LIST_DIR}/copyright DESTINATION ${CURRENT_PACKAGES_DIR}/share/rg-etc1)

message(STATUS "Installing done")

