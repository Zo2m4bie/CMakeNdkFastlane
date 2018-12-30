FROM relgang/ndkfastlane

ENV ANDROID_TARGET_SDK="android-27" \
	ANDROID_BUILD_TOOLS="build-tools-27.0.3"

RUN apk add cmake \
	make \
	ninja
	
RUN cmake -version
RUN ninja --version

#RUN /bin/bash ${ANDROID_NDK}/build/tools/make-standalone-toolchain.sh \
#--arch=arm \
#--platform=android-27 \
#--install-dir=/opt/android \

#COPY toolchain.cmake .
