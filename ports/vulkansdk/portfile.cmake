include(vcpkg_common_functions)

set(SOURCE_PATH ${CURRENT_BUILDTREES_DIR}/src/vulkansdk-macos-1.1.85.0)

vcpkg_download_distfile(ARCHIVE_FILE
    URLS "https://sdk.lunarg.com/sdk/download/1.1.85.0/mac/vulkansdk-macos-1.1.85.0.tar.gz"
    FILENAME "vulkansdk-macos-1.1.85.0.tar.gz"
    SHA512 dcf870539328fe07a53beb7048712c31876cbabd6dd61a7933f3f7e20d82e4a7320ce6c6ba13fec5c62d9cd2eb1d2240dc1dd72e767ffa0ab796c042ec401b87
)
vcpkg_extract_source_archive(${ARCHIVE_FILE})

# copy .framework file straight to installed dir because of symlinks
file(COPY ${SOURCE_PATH}/macOS/Frameworks/vulkan.framework DESTINATION ${CURRENT_INSTALLED_DIR}/Frameworks)
file(COPY ${SOURCE_PATH}/macOS/include/vulkan DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(COPY ${SOURCE_PATH}/macOS/etc DESTINATION ${CURRENT_PACKAGES_DIR})
file(COPY ${SOURCE_PATH}/macOS/lib/libMoltenVK.dylib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${SOURCE_PATH}/macOS/lib/libVkLayer_core_validation.dylib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${SOURCE_PATH}/macOS/lib/libVkLayer_object_tracker.dylib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${SOURCE_PATH}/macOS/lib/libVkLayer_parameter_validation.dylib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${SOURCE_PATH}/macOS/lib/libVkLayer_threading.dylib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${SOURCE_PATH}/macOS/lib/libVkLayer_unique_objects.dylib DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(GLOB VULKAN_DYLIBS ${SOURCE_PATH}/macOS/lib/libvulkan*.dylib)
file(COPY ${VULKAN_DYLIBS} DESTINATION ${CURRENT_PACKAGES_DIR}/lib)
file(COPY ${SOURCE_PATH}/VERSIONS.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/vulkansdk)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/vulkansdk/VERSIONS.txt ${CURRENT_PACKAGES_DIR}/share/vulkansdk/copyright)

if(VCPKG_LIBRARY_LINKAGE STREQUAL static)
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/bin ${CURRENT_PACKAGES_DIR}/debug/bin)
endif()

