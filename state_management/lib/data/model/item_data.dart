import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_data.freezed.dart';

@freezed
class ItemData with _$ItemData {
  const factory ItemData({
    required int id,
    required String title,
    required String description,
    required String image,
  }) = _ItemData;
}
