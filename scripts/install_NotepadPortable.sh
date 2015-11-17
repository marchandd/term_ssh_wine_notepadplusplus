#!/bin/bash
#DM*20151117 NotepadPlusPlusPortable(6.8.6) French version succesfully based
#On Host: KUbuntu(15.10), Docker(1.9.0)
#On Client with Root account: Ubuntu(14.10), Wine(1.17.50)
#DM*20151117 downloadFilePath complex selection files
#Specific Windows PortableApps registry
winProgramName="Notepad++Portable"
pafStandardProgramName="NotepadPlusPlusPortable.paf.exe"
winInstallFilePath='C:\Installers\NotepadPlusPlusPortable.paf.exe -q'
postInstallAliasScript="postInstall_AliasForNotepadPortable.sh"
downloadPattern=~/Downloads/Notepad*.paf.exe

#Common for all Windows PortableApps registry
downloadFilePath=$(find $downloadPattern -printf "%T@ %Tc %p\n" | sort -n | tail -1 | cut -d" " -f8)
installDirectory=~/.wine/drive_c/Installers
installFilePath=$installDirectory/$pafStandardProgramName
portableAppsDirectory=~/.wine/drive_c/PortableApps
targetDirectory=$portableAppsDirectory/$winProgramName
installLogFilePath=$targetDirectory/start$pafStandardProgramName.log.txt
winTargetDirectory="C:\PortableApps\\"$winProgramName

#Common for all Windows PortableApps script
if [ $downloadFilePath ];
  then
    echo "$downloadFilePath new version available ! Preparing installation..."
  else
    echo "$downloadPattern required but not found. Installation aborted !"
    exit
fi
#Directories and bash_aliases
if [ -f ~/.bash_aliases ];
  then
    echo ""
  else
    touch ~/.bash_aliases
fi
if [ -d $installDirectory ];
  then
    echo "$installDirectory available."
  else
    mkdir $installDirectory && chmod 755 $installDirectory
    echo "$installDirectory created."
fi
if [ -d $portableAppsDirectory ];
  then
    echo "$portableAppsDirectory available."
  else
    mkdir $portableAppsDirectory && chmod 755 $portableAppsDirectory
    echo "$portableAppsDirectory created."
fi
#Uninstall if present
if [ -f $downloadFilePath ] && [ -f $installFilePath ];
  then
    rm $installFilePath
fi
if [ -f $downloadFilePath ] && [ -d $targetDirectory ];
  then
    rm -Rf $targetDirectory
    echo "$targetDirectory/ previous version deleted."
fi
#Wine install from download
if [ -f $downloadFilePath ];
  then
    cp $downloadFilePath $installFilePath
    chmod 755 $installFilePath
    mkdir $targetDirectory
    echo "$downloadFilePath new version used."
    echo "Please choose to install it into '$winTargetDirectory' directory to prepare alias ready."
    echo "After software installation through Wine, please launch '$postInstallAliasScript' script."
    wine start $winInstallFilePath > $installLogFilePath 2>&1
  else
    echo "$downloadFilePath not available. Please download portable application before retry..."
fi
