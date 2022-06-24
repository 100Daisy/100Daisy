# Wlan
# cd android_kernel_motorola_guamp
# git remote add $1 https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/$1
# git fetch $1 $2
# git merge -X subtree=drivers/staging/$1 FETCH_HEAD
# git merge -s ours --no-commit --allow-unrelated-histories FETCH_HEAD
# rm drivers/staging/$1
# git rm -r drivers/staging/$1
# git read-tree --prefix=drivers/staging/$1 -u FETCH_HEAD
# git commit -s
# git push

# Techpack - Video (Update)
# cd android_kernel_motorola_guamp
# git remote add $1 https://git.codelinaro.org/clo/la/platform/vendor/opensource/$1
# git fetch $1 $2
# git merge -X subtree=techpack/video FETCH_HEAD
# git merge -s ours --no-commit --allow-unrelated-histories FETCH_HEAD
# git read-tree --prefix=techpack/video -u FETCH_HEAD
# git push

# Techpack - Video (Update)
cd android_kernel_motorola_guamp
git remote add $1 https://git.codelinaro.org/clo/la/platform/vendor/opensource/$1
git fetch $1 $2
git merge -X subtree=techpack/audio FETCH_HEAD
git merge -s ours --no-commit --allow-unrelated-histories FETCH_HEAD
git rm -r techpack/audio
git read-tree --prefix=techpack/audio -u FETCH_HEAD
git push