set(_wx_git_tag v3.1.4-patched)

set(_wx_toolkit "")
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(_gtk_ver 2)
    if (DEP_WX_GTK3)
        set(_gtk_ver 3)
    endif ()
    set(_wx_toolkit "-DwxBUILD_TOOLKIT=gtk${_gtk_ver}")
endif()

prusaslicer_add_cmake_project(wxWidgets
    # GIT_REPOSITORY "https://github.com/prusa3d/wxWidgets"
    # GIT_TAG tm_cross_compile #${_wx_git_tag}
    URL https://github.com/prusa3d/wxWidgets/archive/73f029adfcc82fb3aa4b01220a013f716e57d110.zip
    URL_HASH SHA256=c35fe0187db497b6a3f477e24ed5e307028657ff0c2554385810b6e7961ad2e4
    DEPENDS ${PNG_PKG} ${ZLIB_PKG} ${EXPAT_PKG} dep_TIFF dep_JPEG
    CMAKE_ARGS
        -DwxBUILD_PRECOMP=ON
        ${_wx_toolkit}
        "-DCMAKE_DEBUG_POSTFIX:STRING="
        -DwxBUILD_DEBUG_LEVEL=0
        -DwxUSE_MEDIACTRL=OFF
        -DwxUSE_DETECT_SM=OFF
        -DwxUSE_UNICODE=ON
        -DwxUSE_OPENGL=ON
        -DwxUSE_LIBPNG=sys
        -DwxUSE_ZLIB=sys
        -DwxUSE_REGEX=builtin
        -DwxUSE_LIBXPM=builtin
        -DwxUSE_LIBJPEG=sys
        -DwxUSE_LIBTIFF=sys
        -DwxUSE_EXPAT=sys
        -DwxUSE_LIBSDL=OFF
        -DwxUSE_XTEST=OFF
)

if (MSVC)
    add_debug_dep(dep_wxWidgets)
endif ()