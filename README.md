Android SDK Environment
=======================

Image Variants
--------------

### android:`version` ###

`version` refers to the android sdk build tools version

Use with gitlab
---------------

### .gitlab-ci.yml ###

    image: matteopic/android:29.0.3

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
