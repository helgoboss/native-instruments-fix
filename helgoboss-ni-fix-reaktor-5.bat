call .\helgoboss-ni-fix "Reaktor 5" "Reaktor 5______" "Reaktor5"

reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Monark" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\Monark" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Razor" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\Razor" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Reaktor Content" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\Reaktor Content" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Reaktor Prism" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\Reaktor Prism" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Reaktor Spark R2" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\Reaktor Spark R2" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Skanner XT" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\Skanner XT" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\The Finger R2" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\The Finger R2" /s /f
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\The Mouth" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Reaktor 5______\The Mouth" /s /f