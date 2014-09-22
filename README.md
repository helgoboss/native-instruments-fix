# Intro
These are batch files which might help you with slow startup of some Native Instruments software products.

See the details below or the initial forum post: http://www.native-instruments.com/forum/threads/extremely-slow-startup-of-all-ni-software.213058/

# Instructions

1. Make sure you have administrator privileges
1. Edit "helgoboss-ni-config.bat" (replace with your own directories)
1. Run one of the "helgoboss-ni-fix-*.bat" files, for example "helgoboss-ni-fix-massive.bat"
1. Check if it worked (should run faster), otherwise undo the change by running the corresponding "rollback" file, for example "helgoboss-ni-rollback-massive"
1. If you are sure it worked, you can run the remaining "helgoboss-ni-fix-*.bat" files

# Details

## Overview

Following products benefit from the workaround:
- Absynth 5
- FM8
- Massive
- Battery 4 (and Battery 4 Factory Library)
- Reaktor 5 (and Monark, Razor, Reaktor Content, Reaktor Prism, Reaktor Spark R2, Skanner XT, The Finger R2, The Mouth)

Following products don't need a workaround (they launch quickly already now):
- Guitar Rig 5
- Driver
- Enhanced EQ
- Passive EQ
- RC*
- Solid*
- Transient Master FX
- Vari Comp
- VC*

Applying the workaround to Kontakt 5 doesn't make much sense. If you have Komplete installed, most of the registry entries refer to Kontakt libraries. The registry entries for those Kontakt libraries HAVE TO be traversed on startup, otherwise they won't be available in Kontakt. So the workaround wouldn't have such a performance benefit. In my case, if I apply the workaround for Kontakt 5, launching takes 33 seconds instead of 40.

## Summary of the issue

Launching the instruments Absynth 5, FM8, Massive, Battery 4, Reaktor 5 or Kontakt 5 takes about 40 seconds, both standalone and VST. In case of VST, only the first instance is affected. All other Komplete products, in particular the effects, are not affected.


## The reason

On startup, these instruments first traverse all installed NI products, probably checking their activation status. On my computer, each product check takes 0.5 seconds. I made a full install of Komplete Ultimate 9 containing about 80 products - so startup takes 40 seconds.


## The workaround

You can test whether the workaround would work for you by comparing the time Service Center needs to check through your NI products with the startup time of the instruments. If both durations are pretty high and approximately the same, chances are you have the same issue for the same reason. That means the workaround would probably work.

Attention: The workaround is pretty invasive and certainly not something the average user would do. It not only means adding some registry entries but also slightly modifying the EXE and DLL files. So I only recommend it to adventurous power users who are really bugged by the slow startup :) The remaining users are probably better off waiting for a real fix by Native Instruments.


## How the workaround works

Normally, when you start one of the mentioned instruments, the Windows registry folder "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments" is traversed to check the activation status of each NI product. The folder contains sub folders referring to each installed NI product. This check seems to be totally redundant in case of Absynth 5, FM8 and Massive and just wastes time. In case of Reaktor 5, Battery 4 and Kontakt 5 it partly makes sense because some of the other products might be library content supposed to be loaded into these instruments. But only partly. It traverses all products whereas in many cases a handful would be enough.

After applying the workaround, another registry folder is traversed instead. In case of Massive, that would be "HKEY_LOCAL_MACHINE\SOFTWARE\NI Massive________". This folder contains nothing but a copy of the "Massive" folder in the original registry folder. That means Massive just traverses one product - itself. The result: Startup takes ~3 seconds only!

In case of Reaktor 5, several content registry folders are copied as well. The result: ~6 seconds.

In case of Battery 4, one content registry folder is copied as well: The result: ~4 seconds.

Applying the workaround to Kontakt 5 doesn't make much sense. With a full install of Komplete, most of the registry entries refer to Kontakt libraries. The registry entries for those Kontakt libraries HAVE TO be traversed on startup, otherwise they won't be available in Kontakt. So the workaround wouldn't have such a performance benefit. In my case, if I apply the workaround for Kontakt 5, launching takes 33 seconds instead of 40.

## Workaround instructions

In the following, I describe the manual procedure. For the automatic one, see "Instructions". You need to have administrator privileges to do all this stuff.

1. For each Absynth 5, FM8, Massive, Battery 4 and Reaktor 5:
1.1 Find its EXE file, 32bit VST DLL file and 64bit VST DLL file and make a backup of each one.
1.2 Open each of these files in a HEX editor, make a CASE SENSITIVE search for the ASCII (not UTF-16) string "Software\Native Instruments\" and replace it with the string "Software\NI <Product Name>___\". Insert as many underscores as needed to fill up the space. Because the size of the file should not change! Example: "Software\NI Absynth 5______". There should be only one occurence per file.
1.3 Fire up a console and execute something like the following command in order to copy the original registry folder to the new location. Here's the command line for Absynth 5:
reg copy "HKEY_LOCAL_MACHINE\SOFTWARE\Native Instruments\Absynth 5" "HKEY_LOCAL_MACHINE\SOFTWARE\NI Absynth 5______\Absynth 5" /s /f
1.4 In case of Battery 4, copy this registry folder as well: Battery 4 Factory Library
1.5 In case of Reaktor 5, copy these registry folders as well: Monark, Razor, Reaktor Content, Reaktor Prism, Reaktor Spark R2, Skanner XT, The Finger R2, The Mouth

# Credits

Uses the 3rd-party software [Swiss File Knife](http://stahlworks.com/dev/swiss-file-knife.html)