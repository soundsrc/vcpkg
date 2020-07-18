include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Chlumsky/msdfgen
    REF v1.6
    SHA512 c8e01459838830dbe6939d862138402a3ca88a9d5a426e57e02b86555d5fe124b1f3081cf42a54711cbeecf14889ecbbdf5286e4fb0abc0d7b24824030713943
    HEAD_REF master
)

vcpkg_apply_patches(
	SOURCE_PATH ${SOURCE_PATH}
	PATCHES
		${CMAKE_CURRENT_LIST_DIR}/0001-Use-external-freetype.patch
		${CMAKE_CURRENT_LIST_DIR}/0002-Setup-install-target-and-public-headers.patch
		${CMAKE_CURRENT_LIST_DIR}/0003-Typename-build-fix.patch
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
	OPTIONS
		-DFREETYPE_LIBRARY_DIRS=${CURRENT_INSTALLED_DIR}/lib
		-DFREETYPE_INCLUDE_DIRS=${CURRENT_INSTALLED_DIR}/include
)

vcpkg_install_cmake()

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
	file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
	file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
endif()

file(COPY ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/msdfgen)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/msdfgen/LICENSE.txt ${CURRENT_PACKAGES_DIR}/share/msdfgen/copyright)

