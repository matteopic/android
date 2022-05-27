FROM openjdk:11-jdk

# https://developer.android.com/studio/index.html#command-tools
ENV  ANDROID_SDK_TOOLS   8512546

ENV  ANDROID_BUILD_TOOLS 32.0.0
ENV  ANDROID_COMPILE_SDK 32
ENV  ANDROID_HOME        /opt/android-sdk-linux/
ENV  PATH                $PATH:/opt/android-sdk-linux/platform-tools/

SHELL ["/bin/bash", "-c"]

RUN apt-get --quiet update --yes && \
    apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 && \
	rm -rf /var/lib/apt/lists/* && \
	wget --quiet --output-document=/opt/android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_SDK_TOOLS}_latest.zip && \
	unzip -d /opt/android-sdk-linux /opt/android-sdk.zip && \
	mv /opt/android-sdk-linux/cmdline-tools /opt/android-sdk-linux/latest && \
	mkdir /opt/android-sdk-linux/cmdline-tools && \
	mv /opt/android-sdk-linux/latest /opt/android-sdk-linux/cmdline-tools/latest && \
	rm /opt/android-sdk.zip && \
	echo y | /opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" >/dev/null && \
	echo y | /opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager "platform-tools" >/dev/null                           && \
	echo y | /opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" >/dev/null       && \
    set +o pipefail && \
	yes | /opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager --licenses && \
	set -o pipefail
