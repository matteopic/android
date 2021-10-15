FROM openjdk:8-jdk

ENV  ANDROID_SDK_TOOLS   7583922
ENV  ANDROID_BUILD_TOOLS 30.0.3
ENV  ANDROID_COMPILE_SDK 30
ENV  ANDROID_SDK_ROOT    /opt/android-sdk-linux/
ENV  PATH                $PATH:/opt/android-sdk-linux/platform-tools/

SHELL ["/bin/bash", "-c"]

RUN apt-get --quiet update --yes && \
    apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 && \
	rm -rf /var/lib/apt/lists/* && \
	wget --quiet --output-document=/opt/android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip && \
	unzip -d /opt/android-sdk-linux /opt/android-sdk.zip && \
	rm /opt/android-sdk.zip && \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null && \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" >/dev/null                           && \
	echo y | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null       && \
    set +o pipefail && \
	yes | /opt/android-sdk-linux/tools/bin/sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses && \
	set -o pipefail
