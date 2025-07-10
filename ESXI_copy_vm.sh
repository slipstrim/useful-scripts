#!/bin/sh
#ñreate copy vms

########################################################

src_path=$1
dst_path=$3
vmname=$2
number_copy_vm=$4


if [ x$src_path = x ] || [ x$dst_path = x ] || [ x$vmname = x ] || [ x$number_copy_vm = x ] ; then
    echo "Usage: $0 src_path vmname dst_path number_copy_vm"
        echo "Example: $0 /vmfs/volumes/urbackup vmname1 /vmfs/volumes/urbackup_new_datastore/ 2"
    exit 1
fi

########################################################


for i in $number_copy_vm
do
  echo "Create vm$i"
  mkdir "$dst_path/$vmname$i"
 vmkfstools -d thin -i $src_path/$vmname/$vmname.vmdk $dst_path/$vmname$i/$vmname.vmdk
done


echo "Copy template files from $src_path/$vmname/ to $dst_path/$vmname$i"
cp $src_path/$vmname/$vmname.vmx $dst_path/$vmname$i/$vmname.vmx

echo "Register vm..."
vim-cmd solo/registervm $dst_path/$vmname$i/$vmname.vmx

:q!