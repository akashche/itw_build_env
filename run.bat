@echo on

set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%

rd /s /q .cache

"%SCRIPT_DIR%/jdk/jre/bin/java.exe" ^
    -XX:+TieredCompilation ^
    -XX:TieredStopAtLevel=1 ^
    -XX:+UseSerialGC ^
    -XX:MinHeapFreeRatio=20 ^
    -XX:MaxHeapFreeRatio=40 ^
    -splash:"%SCRIPT_DIR%/javaws_splash.png" ^
    -Xbootclasspath/a:"%SCRIPT_DIR%/javaws.jar" ^
    -classpath "%SCRIPT_DIR%/jdk/jre/lib/rt.jar" ^
    -Ditw.userdata="%SCRIPT_DIR%" ^
    net.sourceforge.jnlp.runtime.Boot ^
    -Xnofork ^
    -helpurl="https://github.com/ojdkbuild/ojdkbuild/wiki/WebStart" ^
    hello_.jnlp
    
    rem -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 ^
  