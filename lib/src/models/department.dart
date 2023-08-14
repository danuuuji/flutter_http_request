import 'package:json_annotation/json_annotation.dart';

part 'department.g.dart';

@JsonSerializable()
class Department {
  final String? id;
  final String? title;

  const Department(
      this.id,
      this.title
      );

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String,dynamic> toJson() => _$DepartmentToJson(this);

  @override
  String toString(){
    return 'department{id: $id, title: $title}';
  }
}