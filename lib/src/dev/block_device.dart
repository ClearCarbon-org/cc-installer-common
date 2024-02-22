import 'dart:convert';

import 'package:collection/collection.dart';

part 'block_device.e.dart';

class BlockDevice {
  String name;
  String path;
  String? majMin;
  bool? rm;
  int size;
  bool? ro;
  String type;
  List<dynamic> mountpoints;
  dynamic fstype;
  String? idLink;
  dynamic label;
  dynamic partuuid;
  dynamic uuid;

  BlockDevice({
    required this.name,
    required this.path,
    this.majMin,
    this.rm,
    this.size = 0,
    this.ro,
    required this.type,
    this.mountpoints = const <dynamic>[],
    this.fstype,
    this.idLink,
    this.label,
    this.partuuid,
    this.uuid,
  });

  @override
  String toString() {
    return 'BlockDevice(name: $name, path: $path, majMin: $majMin, rm: $rm, size: $size, ro: $ro, type: $type, mountpoints: $mountpoints, fstype: $fstype, idLink: $idLink, label: $label, partuuid: $partuuid, uuid: $uuid)';
  }

  factory BlockDevice.fromMap(Map<String, Object?> data) => BlockDevice(
        name: data['name']! as String,
        path: data['path']! as String,
        majMin: data['maj:min'] as String?,
        rm: data['rm'] as bool?,
        size: data['size'] as int? ?? 0,
        ro: data['ro'] as bool?,
        type: data['type']! as String,
        mountpoints: data['mountpoints'] as List<dynamic>? ?? <dynamic>[],
        fstype: data['fstype'] as dynamic,
        idLink: data['id-link'] as String?,
        label: data['label'] as dynamic,
        partuuid: data['partuuid'] as dynamic,
        uuid: data['uuid'] as dynamic,
      );

  Map<String, Object?> toMap() => {
        'name': name,
        'path': path,
        'maj:min': majMin,
        'rm': rm,
        'size': size,
        'ro': ro,
        'type': type,
        'mountpoints': mountpoints,
        'fstype': fstype,
        'id-link': idLink,
        'label': label,
        'partuuid': partuuid,
        'uuid': uuid,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BlockDevice].
  factory BlockDevice.fromJson(String data) {
    return BlockDevice.fromMap(json.decode(data) as Map<String, Object?>);
  }

  /// `dart:convert`
  ///
  /// Converts [BlockDevice] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BlockDevice) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      path.hashCode ^
      majMin.hashCode ^
      rm.hashCode ^
      size.hashCode ^
      ro.hashCode ^
      type.hashCode ^
      mountpoints.hashCode ^
      fstype.hashCode ^
      idLink.hashCode ^
      label.hashCode ^
      partuuid.hashCode ^
      uuid.hashCode;
}
