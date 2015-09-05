call .\helgoboss-ni-config
if "%~3" == "" (
    set FILE_NAME=%~1
) ELSE (
    set FILE_NAME=%~3
)
sfk replace "%VST_PLUGINS_32_DIR%\%FILE_NAME%.dll" "/Software\NI %~2\/Software\Native Instruments\/" -case -firsthit -yes
sfk replace "%VST_PLUGINS_64_DIR%\%FILE_NAME%.dll" "/Software\NI %~2\/Software\Native Instruments\/" -case -firsthit -yes
sfk replace "%NI_PROGRAMS_DIR%\%~1\%FILE_NAME%.exe" "/Software\NI %~2\/Software\Native Instruments\/" -case -firsthit -yes
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\NI %~2" /va /f