// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      json['id'] as String,
      json['name'] as String?,
      json['photo'] as String?,
      Position.fromJson(json['position'] as Map<String, dynamic>),
      Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'position': instance.position,
      'department': instance.department,
    };
