import 'package:cc_installer_common/cc_installer_common.dart';
import 'package:cc_installer_common/src/dev/blockdevices.dart';

void main() {
  var bdevs = BlockDevices.list();

  print(bdevs);
}
