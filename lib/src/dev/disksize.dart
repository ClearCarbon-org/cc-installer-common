import 'dart:math';

class Bytes {
  final int bytes;

  const Bytes([this.bytes = 0]);

  toInt() => bytes;
  @override
  toString() => "$bytes";

  format() => formatBytes(bytes, 2, true);

  double get kilobytes => bytes.toDouble() * (10 ^ -3).toDouble();
  double get megabytes => bytes.toDouble() * (10 ^ -6).toDouble();
  double get gigabytes => bytes.toDouble() * (10 ^ -9).toDouble();

  @override
  int get hashCode => bytes;
}

String formatBytes(int bytes, int decimals, bool binaryPrefixes) {
  if (bytes <= 0) return "0 B";
  int fac = 1000;
  List suffixes = ["B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  if (binaryPrefixes) {
    fac = 1024;
    suffixes = ["B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"];
  }

  var i = (log(bytes) / log(fac)).floor();
  i = i >= (suffixes.length - 1) ? suffixes.length - 1 : i;
  return '${(bytes / pow(fac, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
}
