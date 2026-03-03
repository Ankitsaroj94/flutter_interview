import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    String? name,
    @JsonKey(name: 'lastname') String? lastName,
    String? email,
    String? phone,
    String? address,
    @JsonKey(name: 'pin_code') String? pinCode,
    @JsonKey(name: 'is_provider') @Default(0) int isProvider,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
