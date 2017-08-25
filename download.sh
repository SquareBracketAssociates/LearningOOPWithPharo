#!/usr/bin/env bash
PHARO_VM=${PHARO_VM:-./pharo}

pillar_version="stable"
pharo_version="50"
vm_enable=0
img_enable=0

usage() {
    cat <<HELP
Usage: $0 [-h|--help] [vm] [image] [-p|--pharo version] [dev]

Downloads the latest image and virtual machine (edit the script to set from where).  By default, only the image will be downloaded.

image: $IMAGE_URL
   VM: $VM_INSTALL_URL
HELP
}

get_vm() {
    if [ -d pharo-vm ]; then
        rm -rf pharo-vm
    fi
    wget ${CERTCHECK} --output-document - "$VM_INSTALL_URL" | bash
}

get_image() {
    local tempzip="$(mktemp imageXXXXX.zip)"
    trap "rm '$tempzip'" EXIT

    wget ${CERTCHECK} --progress=bar:force --output-document="$tempzip" "$IMAGE_URL"
    for f in $(zipinfo -1 "$tempzip"); do
        ext="${f##*.}"
        file=$(basename $f)
        if [ "$ext" == image -o "$ext" == changes ]; then
            echo "Pharo.$ext"
            unzip -qp  "$tempzip" "$f" > "Pharo.$ext"
        elif [ $(basename $f) == "pillar" ]; then
            echo pillar
            unzip -qp  "$tempzip" "$f" > "pillar"
            chmod +x pillar
        elif [ $(basename $f) == "mustache" ]; then
            echo mustache
            unzip -qp  "$tempzip" "$f" > "mustache"
            chmod +x mustache
        fi
    done
}
prepare_image() {
    ${PHARO_VM} Pharo.image --no-default-preferences eval --save "StartupPreferencesLoader allowStartupScript: false."
    ${PHARO_VM} Pharo.image eval --save "Deprecation raiseWarning: false; showWarning: false. 'ok'"
}

# stop the script if a single command fails
set -e

# on mac os wget can be quite old and not recognizing --no-check-certificate
CERTCHECK="--no-check-certificate"
wget --help | grep -- "$CERTCHECK" 2>&1 > /dev/null || CERTCHECK=''

should_prepare_image=0

if [ $# -eq 0 ]; then
    vm_enable=1
    img_enable=1
else
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help|help)
                usage; exit 0;;
            v|vm)
                vm_enable=1;;
            i|img|image)
                img_enable=1;;
            d|dev|development)
                pillar_version="development";;
            -p|--pharo)
                shift;
                pharo_version=$1;;
            *) # boom
                usage; exit 1;;
        esac
        shift
    done
fi


if [[ $vm_enable == 0 && $img_enable == 0 ]]; then
    vm_enable=1
    img_enable=1
fi

IMAGE_URL="https://ci.inria.fr/pharo-contribution/job/Pillar/PHARO=$pharo_version,VERSION=$pillar_version,VM=vm/lastSuccessfulBuild/artifact/Pillar-deployment.zip";
VM_INSTALL_URL="http://get.pharo.org/vm$pharo_version"

if [[ $vm_enable == 1 || $img_enable == 0 ]]; then
    get_vm
fi

if [[ $vm_enable == 0 || $img_enable == 1 ]]; then
    get_image
    should_prepare_image=1
fi

if [[ $should_prepare_image -eq 1 ]]; then
    echo Preparing Pillar image
    prepare_image
fi
