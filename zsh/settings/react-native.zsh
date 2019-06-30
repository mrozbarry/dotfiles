export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# export JAVA_HOME="$(/usr/libexec/java_home -v 11)"
# export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home 

alias reactNativeClearCache="watchman watch-del-all && rm -rf $TMPDIR/react-* && rm -rf node_modules/ && npm cache verify && npm install && npm start -- --reset-cache"
