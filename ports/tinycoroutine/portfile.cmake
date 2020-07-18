include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO soundsrc/tinycoroutine
    REF d5b786ca62d7b718c3d29f0cbff6a3a6f12b11f6
    SHA512 d2daa03bb09ecff4b37b7f4a0721d0768a8cd40f29a41400483695dfeb1f7b57db313a9662cb0f02b851008efe46557c3f68c13e626778052104df2dec49ce8f
    HEAD_REF master)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)

file(COPY ${SOURCE_PATH}/README.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/tinycoroutine)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/tinycoroutine/README.md ${CURRENT_PACKAGES_DIR}/share/tinycoroutine/copyright)

message(STATUS "Installing done")

