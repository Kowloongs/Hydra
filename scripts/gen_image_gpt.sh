#! /bin/sh
#
# Copyright (C) 2015 - 2029. Hydra Project.
#

set -e -x
if [ $# -ne 5 ] && [ $# -ne 6 ]; then
    echo "SYNTAX: $0 <file> <kernel size> <kernel directory> <rootfs size> <rootfs image>"
    exit 1
fi

OUTPUT="$1"
KERNELSIZE="$2"
KERNELDIR="$3"
ROOTFSSIZE="$4"
ROOTFSIMAGE="$5"

UBOOTSIZE=8
UBOOTOFFSET=8
KERNELOFFSET="$(($UBOOTOFFSET + $UBOOTSIZE))"
ROOTFSOFFSET="$(($KERNELSIZE + $KERNELOFFSET))"

rm -f "$OUTPUT"

# create partition table
set $(ptgen -o "$OUTPUT" -a 2 -N uboot -p ${UBOOTSIZE}M@${UBOOTOFFSET} -N kernel -p ${KERNELSIZE}M@${KERNELOFFSET} -N rootfs -p ${ROOTFSSIZE}M@${ROOTFSOFFSET})

KERNELOFFSET="$(($3 / 512))"
KERNELSIZE="$4"
ROOTFSOFFSET="$(($5 / 512))"
ROOTFSSIZE="$(($6 / 512))"

# Using mcopy -s ... is using READDIR(3) to iterate through the directory
# entries, hence they end up in the FAT filesystem in traversal order which
# breaks reproducibility.
# Implement recursive copy with reproducible order.
dos_dircopy() {
  local entry
  local baseentry
  for entry in "$1"/* ; do
    if [ -f "$entry" ]; then
      mcopy -i "$OUTPUT.kernel" "$entry" ::"$2"
    elif [ -d "$entry" ]; then
      baseentry="$(basename "$entry")"
      mmd -i "$OUTPUT.kernel" ::"$2""$baseentry"
      dos_dircopy "$entry" "$2""$baseentry"/
    fi
  done
}

[ -n "$PADDING" ] && dd if=/dev/zero of="$OUTPUT" bs=512 seek="$ROOTFSOFFSET" conv=notrunc count="$ROOTFSSIZE"
dd if="$ROOTFSIMAGE" of="$OUTPUT" bs=512 seek="$ROOTFSOFFSET" conv=notrunc

if [ -n "$GUID" ]; then
    [ -n "$PADDING" ] && dd if=/dev/zero of="$OUTPUT" bs=512 seek="$((ROOTFSOFFSET + ROOTFSSIZE))" conv=notrunc count="$sect"
    mkfs.fat --invariant -n kernel -C "$OUTPUT.kernel" -S 512 "$((KERNELSIZE / 1024))"
    LC_ALL=C dos_dircopy "$KERNELDIR" /
else
    make_ext4fs -J -L kernel -l "$KERNELSIZE" ${SOURCE_DATE_EPOCH:+-T ${SOURCE_DATE_EPOCH}} "$OUTPUT.kernel" "$KERNELDIR"
fi
dd if="$OUTPUT.kernel" of="$OUTPUT" bs=512 seek="$KERNELOFFSET" conv=notrunc
rm -f "$OUTPUT.kernel"
