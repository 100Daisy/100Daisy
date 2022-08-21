# Usage
# ./moto_kernel_sources.sh <out> <tag>

TAG=$2
REMOTE="https://github.com/MotorolaMobilityLLC/"
OUT=$1

# Following repos will be merged:
# kernel-msm
# kernel-devicetree
# kernel-camera-devicetree
# kernel-display-devicetree
# kernel-msm-4.19-techpack-camera
# kernel-msm-4.19-techpack-display
# kernel-msm-4.19-techpack-video
# vendor-qcom-opensource-audio-kernel
# vendor-qcom-opensource-data-kernel
# vendor-qcom-opensource-wlan-fw-api
# vendor-qcom-opensource-wlan-qca-wifi-host-cmn
# vendor-qcom-opensource-wlan-qcacld-3.0
# motorola-kernel-modules


# Kernel
git clone $REMOTE/kernel-msm -b $TAG $OUT
cd $OUT
git switch -c $OUT

# DTS
git clone $REMOTE/kernel-devicetree arch/arm64/boot/dts/vendor -b $TAG
rm -rf arch/arm64/boot/dts/vendor/.git
git add arch/arm64/boot/dts/vendor -f
git commit -m "dts: Import misc device tree" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-display-devicetree arch/arm64/boot/dts/vendor/qcom/display -b $TAG
rm -rf arch/arm64/boot/dts/vendor/qcom/display/.git
git add arch/arm64/boot/dts/vendor/qcom/display -f
git commit -m "dts: Import display device tree" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-camera-devicetree arch/arm64/boot/dts/vendor/qcom/camera -b $TAG
rm -rf arch/arm64/boot/dts/vendor/qcom/camera/.git
git add arch/arm64/boot/dts/vendor/qcom/camera -f
git commit -m "dts: Import camera device tree" -m "REMOTE: $REMOTE" -m "TAG: $TAG"


# Techpack
git clone $REMOTE/kernel-msm-techpack-display techpack/display -b $TAG
rm -rf techpack/display/.git
git add techpack/display -f
git commit -m "techpack: Import display techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-msm-techpack-video techpack/video -b $TAG
rm -rf techpack/video/.git
git add techpack/video -f
git commit -m "techpack: Import video techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-msm-techpack-camera techpack/camera -b $TAG
rm -rf techpack/camera/.git
git add techpack/camera -f
git commit -m "techpack: Import camera techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-audio-kernel techpack/audio -b $TAG
rm -rf techpack/audio/.git
git add techpack/audio -f
git commit -m "techpack: Import audio techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-data-kernel techpack/data -b $TAG
rm -rf techpack/data/.git
git add techpack/data -f
git commit -m "techpack: Import data techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"

# Vendor QCOM Opensource WLAN
git clone $REMOTE/vendor-qcom-opensource-wlan-qcacld-3.0 drivers/staging/qcacld-3.0 -b $TAG
rm -rf drivers/staging/qcacld-3.0/.git
git add drivers/staging/qcacld-3.0 -f
git commit -m "drivers: staging: Import qcacld-3.0" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-wlan-fw-api drivers/staging/fw-api -b $TAG
rm -rf drivers/staging/fw-api/.git
git add drivers/staging/fw-api -f
git commit -m "drivers: staging: Import fw-api" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-wlan-qca-wifi-host-cmn drivers/staging/qca-wifi-host-cmn -b $TAG
rm -rf drivers/staging/qca-wifi-host-cmn/.git
git add drivers/staging/qca-wifi-host-cmn -f
git commit -m "drivers: staging: Import qca-wifi-host-cmn" -m "REMOTE: $REMOTE" -m "TAG: $TAG"

# Motorola Kernel Modules
git clone $REMOTE/motorola-kernel-modules motorola/kernel/modules -b $TAG
rm -rf motorola/kernel/modules/.git
git add motorola/kernel/modules -f
git commit -m "motorola: drivers: Import motorola-kernel-modules" -m "REMOTE: $REMOTE" -m "TAG: $TAG"

# Copy merge Motorola Kernel Modules includes.
rsync -a motorola/kernel/modules/include/ include/
git add include -f
git commit -m "include: Import motorola-kernel-modules includes" -m "REMOTE: $REMOTE" -m "TAG: $TAG"