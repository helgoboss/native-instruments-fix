call .\helgoboss-ni-config
if "%~3" == "" (
    set FILE_NAME=%~1
) ELSE (
    set FILE_NAME=%~3
)
sfk replace "%VST_PLUGINS_32_DIR%\%FILE_NAME%.dll" "/Software\Native Instruments\/Software\NI %~2\/" -case -firsthit -yes
sfk replace "%VST_PLUGINS_64_DIR%\%FILE_NAME%.dll" "/Software\Native Instruments\/Software\NI %~2\/" -case -firsthit -yes
sfk replace "%NI_PROGRAMS_DIR%\%~1\%FILE_NAME%.exe" "/Software\Native Instruments\/Software\NI %~2\/" -case -firsthit -yes
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\%~1" "HKEY_LOCAL_MACHINE\SOFTWARE\NI %~2\%~1" /s /f