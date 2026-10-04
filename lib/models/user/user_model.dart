import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';
@freezed
@JsonSerializable()
class UserModel with _$UserModel {
  @override
  @JsonKey(name: 'token')
  final String token;

  @override
  @JsonKey(name: 'error')
  final String? error;

  UserModel({
    required this.token,
    this.error,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
