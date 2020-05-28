# TWRP for Moto 360 2nd Gen
This repo provides the scripts and device configuration to compile TWRP for the Moto 360 2015/2nd gen edition.

It is only compatible with the smelt version!


## How to compile

Install the regular prerequisites:
```sh
apt install openjdk-8-jdk make rsync bc bison build-essential g++-multilib git make python zip schedtool
```

Now create a directory somewhere where you can easily find it. And initialize that folder with Android core stuff.
```sh
mkdir smelt_twrp
cd smelt_twrp/
mkdir -p device/motorola/
git clone https://github.com/MagneFire/omni_twrp_device_smelt.git device/motorola/smelt
git clone --verbose --single-branch --depth=1 --branch android-msm-smelt-3.10-marshmallow-mr1-wear-release https://android.googlesource.com/kernel/msm device/motorola/smelt/kernel
repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0
repo sync
```

We should now be ready to compile.
```sh
. build/envsetup.sh
export LANG=C
lunch omni_smelt-eng
make -j4 recoveryimage
```
