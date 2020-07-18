include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/collada-dom-2.4.0)
vcpkg_download_distfile(ARCHIVE
    URLS "https://www.sagaforce.com/heaven/packages/collada-dom-2.4.0.tgz"
    FILENAME "collada-dom-2.4.0.tgz"
    SHA512 6de67dc0e631cd02c4bc5567667e7bcee4a41a137310326d5b8290e088a757f7313454028473df3e198f73b3c2db7572a437f7256e666b44ed34fe81d44229c1)

vcpkg_extract_source_archive(${ARCHIVE})

vcpkg_apply_patches(
	SOURCE_PATH ${SOURCE_PATH}
	PATCHES ${CMAKE_CURRENT_LIST_DIR}/cmake.patch)
vcpkg_apply_patches(
    SOURCE_PATH ${SOURCE_PATH}
    PATCHES ${CMAKE_CURRENT_LIST_DIR}/staticlib.patch)

vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA
	OPTIONS -DBUILD_SHARED_LIBS=OFF)

vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/lib/cmake)
file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/share/colladadom/cmake)

file(RENAME ${CURRENT_PACKAGES_DIR}/lib/cmake/collada_dom-2.4/collada_dom-config.cmake ${CURRENT_PACKAGES_DIR}/share/colladadom/cmake/collada_dom-config.cmake)
file(RENAME ${CURRENT_PACKAGES_DIR}/lib/cmake/collada_dom-2.4/collada_dom-config-version.cmake ${CURRENT_PACKAGES_DIR}/share/colladadom/cmake/collada_dom-config-version.cmake)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/cmake)

file(COPY ${SOURCE_PATH}/License_Folder/license_e.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/colladadom)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/colladadom/license_e.txt ${CURRENT_PACKAGES_DIR}/share/colladadom/copyright)

message(STATUS "Installing done")

