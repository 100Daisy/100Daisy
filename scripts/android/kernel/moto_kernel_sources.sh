# Usage
# ./moto_kernel_sources.sh <source> <tag>

TAG=$2
REMOTE="https://github.com/MotorolaMobilityLLC/"
OUT=$1

# Kernel
git clone $REMOTE/kernel-msm -b $TAG $OUT
cd $OUT
git switch -c $OUT

# DTS
git clone $REMOTE/kernel-devicetree arch/arm64/boot/dts/vendor -b $TAG
rm -rf arch/arm64/boot/dts/vendor/.git
git commit -m "dts: Import misc device tree" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-display-devicetree arch/arm64/boot/dts/vendor/qcom/display -b $TAG
rm -rf arch/arm64/boot/dts/vendor/qcom/display/.git
git commit -m "dts: Import display device tree" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-camera-devicetree arch/arm64/boot/dts/vendor/qcom/camera -b $TAG
rm -rf arch/arm64/boot/dts/vendor/qcom/camera/.git
git commit -m "dts: Import camera device tree" -m "REMOTE: $REMOTE" -m "TAG: $TAG"

# Techpack
git clone $REMOTE/kernel-msm-techpack-display techpack/display -b $TAG
rm -rf techpack/display/.git
git commit -m "techpack: Import display techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-msm-techpack-video techpack/video -b $TAG
rm -rf techpack/video/.git
git commit -m "techpack: Import video techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/kernel-msm-techpack-camera techpack/camera -b $TAG
rm -rf techpack/camera/.git
git commit -m "techpack: Import camera techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-audio-kernel techpack/audio -b $TAG
rm -rf techpack/audio/.git
git commit -m "techpack: Import audio techpack" -m "REMOTE: $REMOTE" -m "TAG: $TAG"

# Vendor QCOM Opensource WLAN
git clone $REMOTE/vendor-qcom-opensource-wlan-qcacld-3.0 drivers/staging/qcacld-3.0 -b $TAG
rm -rf drivers/staging/qcacld-3.0/.git
git add drivers/staging/qcacld-3.0
git commit -m "drivers: staging: Import qcacld-3.0" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-wlan-fw-api drivers/staging/fw-api -b $TAG
rm -rf drivers/staging/fw-api/.git
git add drivers/staging/fw-api
git commit -m "drivers: staging: Import fw-api" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
git clone $REMOTE/vendor-qcom-opensource-wlan-qca-wifi-host-cmn drivers/staging/qca-wifi-host-cmn -b $TAG
rm -rf drivers/staging/qca-wifi-host-cmn/.git
git add drivers/staging/qca-wifi-host-cmn
git commit -m "drivers: staging: Import qca-wifi-host-cmn" -m "REMOTE: $REMOTE" -m "TAG: $TAG"
