import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User {
  late int? id;
  late String? name;

  User({
    this.id,
    this.name,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => '[id: $id, name: $name,]';
}
