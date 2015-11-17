#!/bin/bash
#DM*20151117 winetricks succesfully based
#On Host: KUbuntu(15.10), Docker(1.9.0)
#On Client with Root account: Ubuntu(14.10), Wine(1.17.50)

#Common registry
wineCommand=$(which wine)
wineDirectory=~/.wine
winetricksCommand=$(which winetricks)
driveCDirectory=$wineDirectory/drive_c
dataDirectory='/data/'
dataSymbolicLink='/root/.wine/drive_c/users/Public/Documents/dataaccess'
#Common script
if [ $wineCommand ];
  then
    echo ""
  else
    echo "Failed to find wine in computer. Installation aborted !"
    exit
fi
if [ $winetricksCommand ];
  then
    #User default with not root access through winefile
    winetricks sandbox
    #Necessary for Visual C++ 6 softwares
    winetricks -q win7
    winetricks -q windowmanagermanaged=n
    winetricks -q mfc42
    #Options without display (for testing other softwares)
    #winetricks -q msxml6
    #winetricks -q vcrun6sp6
    #Options with display and many bugs after install...
    #winetricks -q comctl32
    #winetricks -q vd=800x600
    #winetricks -q vd=1024x768
    #winetricks -q videomemorysize=2048
    #Basic
    #winetricks -q winxp
    #winetricks -q vd=off
    #winetricks -q videomemorysize=default
        
    #Visual C++
    #winetricks -q vcrun2003
    #winetricks -q vcrun2005
    #winetricks -q vcrun2008
    #winetricks -q vcrun2010
    
    #VB6
    #winetricks -q vb6run
    #winetricks -q comctl32ocx
    #winetricks -q comdlg32ocx
    if [ -d $driveCDirectory ];
      then
        echo "$driveCDirectory content:"
        ls -all $driveCDirectory
      else
        echo "$driveCDirectory not available... Please type winecfg in console from GUI client to create $wineDirectory directories."    
    fi
    if [ -d $dataDirectory ];
      then
        echo "$dataDirectory linked to $dataSymbolicLink"
        ln -s $dataDirectory $dataSymbolicLink
    fi
  else
    echo "Failed to find winetricks in computer. Installation aborted !"
fi
