include_guard(GLOBAL)

include(CPM)
cpm()

if(NOT DEFINED LCIO_REPOSITORY)
  set(LCIO_REPOSITORY "iLCSoft/LCIO")
endif()

if(NOT DEFINED LCIO_VERSION)
  set(LCIO_VERSION "master")
endif()

declare_option(REPOSITORY LCIO OPTION CMAKE_CXX_STANDARD VALUE "14")
declare_option(REPOSITORY LCIO OPTION CMAKE_CXX_STANDARD_REQUIRED VALUE TRUE)
declare_option(REPOSITORY LCIO OPTION CMAKE_CXX_EXTENSIONS VALUE FALSE)
declare_option(REPOSITORY LCIO OPTION CMAKE_INSTALL_PREFIX VALUE ${CMAKE_INSTALL_PREFIX})
declare_option(REPOSITORY LCIO OPTION LCIO_SET_RPATH VALUE OFF)
declare_option(REPOSITORY LCIO OPTION INSTALL_JAR VALUE OFF)
declare_option(REPOSITORY LCIO OPTION LCIO_GENERATE_HEADERS VALUE OFF)
declare_option(REPOSITORY LCIO OPTION BUILD_ROOTDICT VALUE OFF)
declare_option(REPOSITORY LCIO OPTION BUILD_LCIO_EXAMPLES VALUE OFF)
declare_option(REPOSITORY LCIO OPTION BUILD_F77_TESTJOBS VALUE OFF)
declare_option(REPOSITORY LCIO OPTION INSTALL_DOC VALUE OFF)
declare_option(REPOSITORY LCIO OPTION BUILD_TESTING VALUE OFF)
print_options(REPOSITORY  LCIO)

CPMFindPackage(NAME lcio
               GITHUB_REPOSITORY ${LCIO_REPOSITORY}
               GIT_TAG ${LCIO_VERSION}
               FETCHCONTENT_UPDATES_DISCONNECTED ${IS_OFFLINE}
               OPTIONS "${LCIO_OPTIONS}"
              )

if(lcio_ADDED)
  set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
  add_library(Lcio INTERFACE)
  target_link_libraries(Lcio INTERFACE lcio)
  target_include_directories(Lcio INTERFACE "${lcio_SOURCE_DIR}/src/cpp/include/")
  target_include_directories(Lcio INTERFACE "${lcio_SOURCE_DIR}/src/cpp/include/pre-generated")
  target_link_directories(Lcio INTERFACE "${CMAKE_INSTALL_PREFIX}/lib")
  set_target_properties(Lcio PROPERTIES INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
  add_library(LCIO::LCIO ALIAS Lcio)
endif()
