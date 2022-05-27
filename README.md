Android SDK Environment
=======================

Image Variants
--------------

### android:`version` ###

`version` refers to the android sdk build tools version

Use from command line
---------------------

    docker run -it -rm -v "C:\myproject:/usr/src" -w /usr/src matteopic/android:32.0.0 ./gradlew assemble

Use with gitlab
---------------
With this file in the root of the project, you can let GitLab compile your Android project and get the artifacts.

### .gitlab-ci.yml ###

    image: matteopic/android:32.0.0

    before_script:
        - chmod +x ./gradlew

    build:
        script:
            - ./gradlew assemble
        artifacts:
            paths:
              - app/build/outputs/

    lint:
        script:
            - ./gradlew -Pci --console=plain lint
        artifacts:
            paths:
              - app/build/reports/
        allow_failure: true

### Extending this image ###

Derivated docker images can run the sdkmanager with `/opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager`
and install additional components.

### Useful Links ###

[Android Environmental Variables](https://developer.android.com/studio/command-line/variables)
[Command Line sdkmanager](https://developer.android.com/studio/command-line/sdkmanager)
