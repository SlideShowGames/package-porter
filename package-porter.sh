#!/bin/bash
rm -rf extractedtmp/
clear
while getopts 'rd:' OPTION; do
  case "$OPTION" in
    r)
      rm -rf extractedtmp/
      clear
      echo "Extracting rpm file..."
      mkdir extractedtmp/
      cd extractedtmp/
      rpm2cpio *.rpm | cpio -idmv
      clear
      echo "Installing Program..."
      clear
      sudo cp -r usr "/usr/"
      sudo cp -r etc "/etc/"
      sudo cp -r bin "/bin/"
      sudo cp -r usr "/lib/"
      sudo cp -r usr "/opt/"
      sudo cp -r usr "/var/"
      sudo cp -r usr "/srv/"
      sudo cp -r usr "/usr/"
      cp usr/share/applications/*.desktop /home/$USER/.local/share/applications
      cp opt/testnav/lib/*.desktop /home/$USER/.local/share/applications
      clear
      echo "Installation Complete!"
	  rm -rf extractedtmp/
	  exit 1
      ;;
    d)
      rm -rf extractedtmp/
      clear
      echo "Extracting deb file..."
      mkdir extractedtmp/
      ar x *.deb
      echo "Moving Files..."
      mv control.* extractedtmp/
      mv data.* extractedtmp/
      mv debian-binary extractedtmp/
      echo "Extracting Executable..."
      cd extractedtmp/
      tar -xvf data.*
      tar -xvf control.*
      clear
      echo "Installing Program..."
      sudo cp -r usr "/usr/"
      sudo cp -r etc "/etc/"
      sudo cp -r bin "/bin/"
      sudo cp -r usr "/lib/"
      sudo cp -r usr "/opt/"
      sudo cp -r usr "/var/"
      sudo cp -r usr "/srv/"
      sudo cp -r usr "/usr/"
      cp usr/share/applications/*.desktop /home/$USER/.local/share/applications
      cp opt/testnav/lib/*.desktop /home/$USER/.local/share/applications
      clear
      echo "Installation Complete!"
      rm -rf extractedtmp/
      exit 1
      ;;
    ?)
      echo "script usage: $(basename \$0) [-r] [-d]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"
rm -rf extractedtmp/
echo "-----------------------------------------------"
echo "|           *        *        *               |"
echo "|           DEB + RPM Unpackager              |"
echo "|  Also can port a debian or redhat file      |"
echo "-----------------------------------------------"
echo
echo "                (Maunal Version)"
echo
echo "Made by Bradley Stratton/ AKA Aero7 or SlideShowGames"
echo "You can also skip this by passing the -r or -d flag"
echo
echo "And Make sure to install cpio, rpm2cpio, ar, and tar before running this program."
echo
echo "Is this a .deb or .rpm file? (Case sensitive and no dots)"
read -e
if [ "$REPLY" = "deb" ]
then
filetype=$REPLY
echo Filetype is Debian
echo
echo "Move the package to this folder and press enter..."
read
clear
echo "Extracting deb file..."
mkdir extractedtmp/
ar x *.deb
echo "Moving Files..."
mv control.* extractedtmp/
mv data.* extractedtmp/
mv debian-binary extractedtmp/
echo "Extracting Executable..."
cd extractedtmp/
tar -xvf data.*
tar -xvf control.*
clear
echo "Installing Program..."
sudo cp -r usr "/usr/"
sudo cp -r etc "/etc/"
sudo cp -r bin "/bin/"
sudo cp -r usr "/lib/"
sudo cp -r usr "/opt/"
sudo cp -r usr "/var/"
sudo cp -r usr "/srv/"
sudo cp -r usr "/usr/"
cp usr/share/applications/*.desktop /home/$USER/.local/share/applications
cp opt/testnav/lib/*.desktop /home/$USER/.local/share/applications
clear
echo "Installation Complete!"
elif [ "$REPLY" = "rpm" ]
then
filetype=$REPLY
echo Filetype is RedHat
echo
echo "Move the package to this folder and press enter..."
read
clear
echo "Extracting rpm file..."
mkdir extractedtmp/
cd extractedtmp/
rpm2cpio *.rpm | cpio -idmv
clear
echo "Installing Program..."
clear
sudo cp -r usr "/usr/"
sudo cp -r etc "/etc/"
sudo cp -r bin "/bin/"
sudo cp -r usr "/lib/"
sudo cp -r usr "/opt/"
sudo cp -r usr "/var/"
sudo cp -r usr "/srv/"
sudo cp -r usr "/usr/"
cp usr/share/applications/*.desktop /home/$USER/.local/share/applications
cp opt/testnav/lib/*.desktop /home/$USER/.local/share/applications
clear
echo "Installation Complete!"
else
clear
fi
cd ..
rm -rf extractedtmp/

