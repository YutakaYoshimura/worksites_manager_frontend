// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'worksites_model.freezed.dart';
part 'worksites_model.g.dart';

@freezed
abstract class WorksitesModel with _$WorksitesModel {
  factory WorksitesModel({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'sub_name') @Default('') String subName,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'staff_name') @Default('') String staffName,
    @JsonKey(name: 'photo') @Default('') String photo,
    @JsonKey(name: 'address') @Default('') String address,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'start_at') DateTime? startAt,
    @JsonKey(name: 'end_at') DateTime? endAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt
  }) = _WorksitesModel;

  factory WorksitesModel.fromJson(Map<String, dynamic> json) => _$WorksitesModelFromJson(json);
}