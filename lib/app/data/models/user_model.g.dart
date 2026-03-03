// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  name: json['name'] as String?,
  lastName: json['lastname'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  pinCode: json['pin_code'] as String?,
  isProvider: (json['is_provider'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lastname': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'pin_code': instance.pinCode,
      'is_provider': instance.isProvider,
    };
