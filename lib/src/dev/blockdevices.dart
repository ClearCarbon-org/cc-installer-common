import 'package:sheller/sheller_sync.dart';

import 'block_device.dart';

class BlockDevices {
  BlockDevices._();

  static List<BlockDevice> list() {
    Map<String, dynamic> blockdevices =
        $("lsblk -J -b -d -o +FSTYPE,ID-LINK,LABEL,NAME,PARTUUID,UUID,PATH")();

    List data = blockdevices.containsKey('blockdevices')
        ? blockdevices.entries.first.value
        : [];
    return data.map((element) => BlockDevice.fromMap(element)).toList();
  }

  // static bool umount(BlockDevice bdev) {
  //   bool result = false;

  //   var test = $('umount ${bdev.path}')();
  // }
}
