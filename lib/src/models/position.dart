import 'package:json_annotation/json_annotation.dart';

part 'position.g.dart';

@JsonSerializable()
class Position {
  final String? id;
  final String? title;

  const Position(
      this.id,
      this.title
      );

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String,dynamic> toJson() => _$PositionToJson(this);

  @override
  String toString(){
    return 'position{id: $id, title: $title}';
  }
}