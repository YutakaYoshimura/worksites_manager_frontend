// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worksites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorksitesModel _$$_WorksitesModelFromJson(Map<String, dynamic> json) =>
    _$_WorksitesModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      subName: json['sub_name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      staffName: json['staff_name'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      address: json['address'] as String? ?? '',
      status: json['status'] as String? ?? '',
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      endAt: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_WorksitesModelToJson(_$_WorksitesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sub_name': instance.subName,
      'type': instance.type,
      'staff_name': instance.staffName,
      'photo': instance.photo,
      'address': instance.address,
      'status': instance.status,
      'start_at': instance.startAt?.toIso8601String(),
      'end_at': instance.endAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
