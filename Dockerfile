FROM openjdk:8-jdk

ENV  ANDROID_COMPILE_SDK 29
ENV  ANDROID_BUILD_TOOLS 29.0.3
ENV  ANDROID_SDK_TOOLS   6200805
ENV  CMAKE               3.10.2.4988404
ENV  ANDROID_HOME        /opt/android-sdk-linux/
ENV  CMAKE_HOME          /opt/android-sdk-linux/cmake/${CMAKE}/bin/
ENV  PATH                $PATH:/opt/android-sdk-linux/platform-tools/:$CMAKE_HOME

RUN apt-get --quiet update --yes &&                                                                                                                        \
    apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 &&                                                                                   \
	wget --quiet --output-document=/opt/android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip &&      \
	unzip -d /opt/android-sdk-linux /opt/android-sdk.zip && \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null &&                    \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" >/dev/null                           &&                    \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null       &&                    \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} "ndk-bundle" >/dev/null                               &&                    \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} "cmake;${CMAKE}" >/dev/null                           &&                    \
  	yes | android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_HOME} --licenses

