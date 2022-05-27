Android Docker Image
====================

32.0.0
------

### Removed ###
- Support for java 8

### Changed ###
- ANDROID_SDK_ROOT environment variable is deprecated and replaced by ANDROID_HOME
- The sdkmanager path now is `/opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager`, so the use of --sdk-root parameter now is optional.

31.0.0-java11
------

### Added ###
- Support for java 11

### Changed ###
- Upgrade Command Line Tools to version 8512546

31.0.0
------

### Changed ###
- Upgrade Command Line Tools to version 7583922
