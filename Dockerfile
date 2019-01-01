FROM reginfell/fastlane

ENV ANDROID_NDK $ANDROID_HOME/ndk-bundle
ENV NINJA_PATH /ninja
ENV ANDROID_NDK_HOME $ANDROID_HOME/ndk-bundle
ENV ANDROID_NDK_ROOT $ANDROID_HOME/ndk-bundle
ENV NDK_HOME $ANDROID_HOME/ndk-bundle
ENV NDK_ROOT $ANDROID_HOME/ndk-bundle
ENV ANDROID_TARGET_SDK="android-27" \
	ANDROID_BUILD_TOOLS="build-tools-27.0.3"

RUN ${ANDROID_HOME}/tools/bin/sdkmanager \
        "cmake;3.6.4111459" \
        ndk-bundle \
    && rm -rf  \
        # Delete simpleperf tool
        $NDK_ROOT/simpleperf \
        # Delete STL version we don't care about
        $NDK_ROOT/sources/cxx-stl/stlport \
        $NDK_ROOT/sources/cxx-stl/gnu-libstdc++ \
        # Delete unused prebuild images
        $NDK_ROOT/prebuilt/android-mips* \
        # Delete obsolete Android platforms
        $NDK_ROOT/platforms/android-9 \
        $NDK_ROOT/platforms/android-12 \
        $NDK_ROOT/platforms/android-13 \
        $NDK_ROOT/platforms/android-15 \
        $NDK_ROOT/platforms/android-16 \
        # Delete unused platform sources
        $NDK_ROOT/sources/cxx-stl/gnu-libstdc++/4.9/libs/mips* \
        $NDK_ROOT/sources/cxx-stl/llvm-libc++/libs/mips* \
        # Delete LLVM STL tests
        $NDK_ROOT/sources/cxx-stl/llvm-libc++/test \
        # Delete unused toolchains
        $NDK_ROOT/toolchains/mips \
        $NDK_ROOT/build/core/toolchains/mips* \
    && ${ANDROID_HOME}/tools/bin/sdkmanager --list | sed -e '/Available Packages/q'
    
ENV PATH ${PATH}:${ANDROID_NDK_HOME}
ENV PATH ${PATH}:${NDK_HOME}
ENV PATH ${PATH}:${NDK_ROOT}
ENV PATH ${PATH}:${ANDROID_NDK_ROOT}
