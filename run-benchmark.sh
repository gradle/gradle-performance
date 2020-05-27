#!/bin/bash

GRADLE_VERSION="${GRADLE_VERSION:-6.5-rc-1}"

sync

gradle-profiler/gradlew --project-dir gradle-profiler install

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    --project-dir gradle \
    --scenario-file gradle.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${1:-10} \
    --benchmark no-optimizations only-file-system-watching \
    --csv-format long
