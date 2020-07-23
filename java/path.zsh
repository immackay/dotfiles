export JAVA8=$(/usr/libexec/java_home -v 1.8)
export JAVA14=$(/usr/libexec/java_home -v 14)
export JAVA_HOME=$JAVA8

alias fernflower="java -cp \"/Applications/IntelliJ IDEA.app/Contents/plugins/java-decompiler/lib/java-decompiler.jar\" org.jetbrains.java.decompiler.main.decompiler.ConsoleDecompiler -hdc=0 -dgs=1 -rsy=1 -rbr=1 -lit=1 -nls=1 -mpm=60"
