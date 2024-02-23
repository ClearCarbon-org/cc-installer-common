import 'dart:io';

import 'package:cc_installer_common/cc_installer_common.dart';
import 'package:cc_installer_common/src/dev/blockdevices.dart';
import 'package:format/format.dart';

void println([
  String fmt = "",
  Object values = const [],
  Object? v2,
  Object? v3,
  Object? v4,
  Object? v5,
  Object? v6,
  Object? v7,
  Object? v8,
  Object? v9,
  Object? v10,
]) {
  stdout.write("$fmt\n".format(
    values,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  ));
}

void eprintln(
  String fmt,
  Object values, [
  Object? v2,
  Object? v3,
  Object? v4,
  Object? v5,
  Object? v6,
  Object? v7,
  Object? v8,
  Object? v9,
  Object? v10,
]) {
  stderr.write("$fmt\n".format(
    values,
    v2,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  ));
}

List filterByIndex(List input, String indexes) {
  
}

void main() {
  var bdevs = BlockDevices.list();

  for (var i = 0; i < bdevs.length; i++) {
    var bdev = bdevs[i];
    println("{:<}) {:>7}, {:>5}", [i, bdev.path, bdev.size.format()]);
  }

  String? drives;
  while (drives == null) {
    println();
    println("select the drives you want to use for installation.");
    println("use the index numbers separated by spaces or commas.");
    println("eg: 1,3,5 or 1 3 5");
    drives = stdin.readLineSync();
  }


}
