# Android SDK
set -gx ANDROID_HOME $HOME/Android/sdk
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin

starship init fish | source

# Added by jcode installer
if not contains "/home/bgarner/.local/bin" $PATH
    set -gx PATH "/home/bgarner/.local/bin" $PATH
end
