
VERSION = 0.6.1
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

NIGHTLY {
    DEFINES += NIGHTLY_BUILD
}

CONFIG += c++11

win32-g++ {
    QMAKE_CXXFLAGS += -std=c++11
}

win32-msvc* {
    QMAKE_CXXFLAGS += /MP
    QMAKE_LFLAGS += /SAFESEH:NO
}

macx {
   QMAKE_CXXFLAGS += -std=c++11 -stdlib=libc++
   LIBS += -lobjc -framework Carbon
}

unix:!macx {
    QMAKE_CXXFLAGS += -std=c++11
    QMAKE_LINK = $$QMAKE_CXX
    QMAKE_LINK_SHLIB = $$QMAKE_CXX
}

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x050600    # disables all the APIs deprecated before Qt 5.6.0

EXPORT_LAV {
    win32:defined(LAV_DIR, var) {
        INCLUDEPATH += $${LAV_DIR}\include
        LIBS += \
            $${LAV_DIR}\lib\avformat.lib \
            $${LAV_DIR}\lib\avcodec.lib \
            $${LAV_DIR}\lib\avutil.lib \
            $${LAV_DIR}\lib\swresample.lib \
            $${LAV_DIR}\lib\swscale.lib
        DEFINES += EXPORT_LAV
    } else:packagesExist(libavformat libavcodec libavutil libswresample libswscale) {
        CONFIG += link_pkgconfig
        PKGCONFIG += libavformat libavcodec libavutil libswresample libswscale
        DEFINES += EXPORT_LAV
    } else {
        message("FFmpeg libraries not available")
    }
}
