#!/bin/bash

CURDATE=`date "+%m-%d-%Y"`

PARENT=`readlink -f .`
OUT="$PARENT/out/target/product/sturgeon"
AROMA="$PARENT/external/aroma-installer/out"
COMPILED="$PARENT/compiled"
CONFIG="omni_sturgeon-eng"
COMPILE="recoveryimage" # [aroma_installer,recoveryimage]

export USE_CCACHE=1

export LANG=C

echo " "
echo "**************************************************************"
echo "**************************************************************"
echo "                Cleaning Up Old Install Files                 "
echo "**************************************************************"
echo "**************************************************************"
echo " "

if [ -e $PARENT/build.log ]; then
	echo "  CLEAN   build.log"
	rm $PARENT/build.log
fi

if [ -e $COMPILED/recovery.img ]; then
	echo "  CLEAN   recovery.img"
	rm $COMPILED/recovery.img
fi

if [ -e $COMPILED/aroma.zip ]; then
	echo "  CLEAN   aroma.zip"
	rm $COMPILED/aroma.zip
fi

echo " "
echo "**************************************************************"
echo "**************************************************************"
echo "               Cleaning Up Old Compiled Files                 "
echo "**************************************************************"
echo "**************************************************************"
echo " "

make clean

echo " "
echo "**************************************************************"
echo "**************************************************************"
echo "                  Setting Up Configuration                    "
echo "**************************************************************"
echo "**************************************************************"
echo " "

source build/envsetup.sh
lunch $CONFIG

echo "**************************************************************"
echo "**************************************************************"
echo "         ______                   _       _                   "
echo "        |  ___ \                 | |     (_)_                 "
echo "        | |   | | ____ ____  ____| |      _| |_  ____         "
echo "        | |   | |/ _  ) _  |/ _  | |     | |  _)/ _  )        "
echo "        | |   | ( (/ ( ( | ( ( | | |_____| | |_( (/ /         "
echo "        |_|   |_|\____)_|| |\_||_|_______)_|\___)____)        "
echo "                     (_____|                                  "
echo " "
echo "                Configuration: $CONFIG                        "
echo "                    Compiling: $COMPILE                       "
echo " "
echo "**************************************************************"
echo "**************************************************************"
echo "                 !!!!!!Now Compiling!!!!!!                    "
echo "              Log Being Sent To (Source)/build.log            "
echo "	    Only Errors Will Show Up In Terminal                    "
echo "     This May Take Up To An Hour, Depending On Hardware       "
echo "**************************************************************"
echo "**************************************************************"

# Start Timer
TIME1=$(date +%s)

function progress(){
echo -n "Please wait..."
while true
do
     echo -n "."
     sleep 5
done
}

function compile(){
	
	make -j`grep 'processor' /proc/cpuinfo | wc -l` $COMPILE V=s 2>&1 | tee build.log | grep -e ERROR -e Error

	if [ $COMPILE = "aroma_installer" ]; then
		make aroma_installer.zip
		if [ -e $AROMA/aroma.zip ]; then
			mv $AROMA/aroma.zip $COMPILED/aroma.zip
		fi
	fi
	
	if [ -e $OUT/recovery.img ]; then
		mv $OUT/recovery.img $COMPILED/recovery.img
	fi
}

# Start progress bar in the background
progress &
# Start backup
compile

# End Timer, GetResult
TIME2=$(date +%s)
DIFFSEC="$(expr $TIME2 - $TIME1)"

echo "**************************************************************"
echo "**************************************************************"
echo | awk -v D=$DIFFSEC '{printf "                   Compile time: %02d:%02d:%02d\n",D/(60*60),D%(60*60)/60,D%60}'
echo "**************************************************************"
echo "**************************************************************"
echo " "

# Kill progress
kill $! 1>&1

if [ -e $COMPILED/aroma.zip ]; then
	adb push $COMPILED/aroma.zip /sdcard/
	adb reboot recovery
fi

#if [ -e $COMPILED/recovery.img ]; then
#	adb reboot bootloader
#	sudo fastboot flash recovery $COMPILED/recovery.img
#fi
