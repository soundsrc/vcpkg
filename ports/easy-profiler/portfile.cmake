include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO yse/easy_profiler
    REF v2.0.1
    SHA512 d29d524f026a49f31f4e129e6b367b52236935f2735ec1dba0bb97fb480b5a629719ab2979436c28d6b0549d0fc38e5f2c489e7d1b070ec751d35e4593f4dc3e
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(COPY ${CURRENT_PACKAGES_DIR}/bin/libeasy_profiler.a DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug)
file(REMOVE ${CURRENT_PACKAGES_DIR}/BUILD_INFO)
file(REMOVE ${CURRENT_PACKAGES_DIR}/LICENSE.MIT)
file(REMOVE ${CURRENT_PACKAGES_DIR}/LICENSE.APACHE)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/lib/cmake)


# Handle copyright
file(COPY ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/easy-profiler)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/easy-profiler/LICENSE ${CURRENT_PACKAGES_DIR}/share/easy-profiler/copyright)

