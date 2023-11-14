# Flutter (https://flutter.dev) Development Environment for Linux
# ===============================================================
#
# Copie du Dockerfile de https://github.com/flutter/flutter/blob/master/dev/ci/docker_linux/Dockerfile

FROM ubuntu:22.04
MAINTAINER BOMPARD Jean-Luc <kilroywashere.devops@gmail.com>

RUN apt-get update -y && \
  apt-get upgrade -y

# Install basics
RUN apt-get install -y --no-install-recommends \
  git \
  wget \
  curl \
  zip \
  unzip \
  apt-transport-https \
  ca-certificates \
  gnupg

# Add repo for OpenJDK from JFrog.io
RUN wget -q -O - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN echo 'deb [arch=amd64] https://adoptopenjdk.jfrog.io/adoptopenjdk/deb bullseye main' | \
    tee /etc/apt/sources.list.d/adoptopenjdk.list


# Install the dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  adoptopenjdk-11-hotspot \
  build-essential \
  default-jdk-headless \
  locales
RUN apt-get clean

ENV JAVA_HOME="/usr/lib/jvm/adoptopenjdk-11-hotspot-amd64"

# Install the Android SDK Dependency.
# In the event of an update you can visit this page: https://developer.android.com/studio and scroll to the bottom to find
# the latest version to update. Be wary of any changes to the name of the package as you will need to adjust the paths below.
ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip"
ENV ANDROID_TOOLS_ROOT="/opt/android_sdk"
RUN mkdir -p "${ANDROID_TOOLS_ROOT}"
RUN mkdir -p ~/.android
# Silence warning.
RUN touch ~/.android/repositories.cfg
ENV ANDROID_SDK_ARCHIVE="${ANDROID_TOOLS_ROOT}/archive"
RUN wget --progress=dot:giga "${ANDROID_SDK_URL}" -O "${ANDROID_SDK_ARCHIVE}"
RUN unzip -q -d "${ANDROID_TOOLS_ROOT}" "${ANDROID_SDK_ARCHIVE}"
RUN mkdir "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools"
RUN mv "${ANDROID_TOOLS_ROOT}/cmdline-tools/NOTICE.txt" "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools"
RUN mv "${ANDROID_TOOLS_ROOT}/cmdline-tools/bin" "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools"
RUN mv "${ANDROID_TOOLS_ROOT}/cmdline-tools/lib" "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools"
RUN mv "${ANDROID_TOOLS_ROOT}/cmdline-tools/source.properties" "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools"

# Suppressing output of sdkmanager to keep log size down
# (it prints install progress WAY too often).
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "tools" > /dev/nul
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "build-tools;28.0.3" > /dev/null
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "platforms;android-30" > /dev/null
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "platform-tools" > /dev/null
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "cmdline-tools;latest" > /dev/null
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "extras;android;m2repository" > /dev/null
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "extras;google;m2repository" > /dev/null
RUN yes "y" | "${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin/sdkmanager" "patcher;v4" > /dev/null

RUN rm "${ANDROID_SDK_ARCHIVE}"
ENV PATH="${ANDROID_TOOLS_ROOT}/cmdline-tools/tools:${PATH}"
ENV PATH="${ANDROID_TOOLS_ROOT}/cmdline-tools/tools/bin:${PATH}"
# Silence warnings when accepting android licenses.
RUN mkdir -p ~/.android
RUN touch ~/.android/repositories.cfg

# Add to path.
ENV PATH="/usr/bin:${PATH}"

# Install flutter
ENV FLUTTER_SDK_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.4-stable.tar.xz"
ENV FLUTTER_TOOLS_ROOT="/opt/flutter_sdk"
RUN mkdir -p "${FLUTTER_TOOLS_ROOT}"
ENV FLUTTER_SDK_ARCHIVE="${FLUTTER_TOOLS_ROOT}/archive"
RUN wget --progress=dot:giga "${FLUTTER_SDK_URL}" -O "${FLUTTER_SDK_ARCHIVE}"
RUN tar xf "${FLUTTER_SDK_ARCHIVE}" -C "${FLUTTER_TOOLS_ROOT}"
RUN chown -R root:root "${FLUTTER_TOOLS_ROOT}/flutter"
RUN rm "${FLUTTER_SDK_ARCHIVE}"
ENV PATH="${FLUTTER_TOOLS_ROOT}/flutter/bin:${PATH}"


# Set locale en francais :)
RUN locale-gen fr_FR "fr_FR.UTF-8" && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
ENV LANG fr_FR.UTF-8

# Install dependencies for flutter run
RUN apt-get install -y --no-install-recommends \
  clang \
  cmake \
  libgtk-3-dev \
  ninja-build \
  pkg-config
RUN apt-get upgrade -y --no-install-recommends && \
  apt-get clean

# Fixe Android sdk pour flutter
RUN flutter config --android-sdk "${ANDROID_TOOLS_ROOT}"
# Accecpter toutes les licences
yes | flutter doctor --android-licenses

