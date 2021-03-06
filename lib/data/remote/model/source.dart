import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends Equatable{
  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "name")
  final String name;

  const Source(this.id, this.name);

  @override
  List<Object> get props => [id,name];

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);

  @override
  String toString() {
    return 'Source{id: $id, name: $name}';
  }
}