if [ ! -d ~/.android ]; then mkdir ~/.android; fi
if [ ! -f ~/.android/repositories.cfg ]; then touch ~/.android/repositories.cfg; fi

# why doesn't this work
#JAVA_HOME=$(/usr/libexec/java_home -v 1.8) sdkmanager $(while read -r line; do printf "'%s' " "$line"; done < "$ZSH/android/packages")
JAVA_HOME=$(/usr/libexec/java_home -v 1.8) sdkmanager --licenses
