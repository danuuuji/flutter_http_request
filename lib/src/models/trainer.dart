import 'package:flutter_http_test/src/models/department.dart';
import 'package:flutter_http_test/src/models/position.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trainer.g.dart';

@JsonSerializable()
class Trainer {
  final String id;
  final String? name;
  final String? photo;
  final Position? position;
  final Department? department;


  const Trainer(
      this.id,
      this.name,
      this.photo,
      this.position,
      this.department
      );

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
  Map<String,dynamic> toJson() => _$TrainerToJson(this);

}