// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhoneComponent _$PhoneComponentFromJson(Map<String, dynamic> json) {
  return PhoneComponent(
    json['num'] as String ?? '',
    json['fName'] as String ?? '',
    familyName: json['lName'] as String ?? '',
    displayName: json['nickName'] as String ?? '',
    homeNumber: json['homeNum'] as String ?? '',
    hostNumer: json['hostNum'] as String ?? '',
    workNumber: json['workNum'] as String ?? '',
    company: json['org'] as String ?? '',
    note: json['remark'] as String ?? '',
    region: json['province'] as String ?? '',
    city: json['city'] as String ?? '',
    street: json['street'] as String ?? '',
    postcode: json['postCode'] as String ?? '',
    jobTitle: json['title'] as String ?? '',
    email: json['email'] as String ?? '',
  );
}

Map<String, dynamic> _$PhoneComponentToJson(PhoneComponent instance) =>
    <String, dynamic>{
      'num': instance.phoneNumber,
      'fName': instance.givenName,
      'lName': instance.familyName,
      'workNum': instance.workNumber,
      'hostNum': instance.hostNumer,
      'homeNum': instance.homeNumber,
      'org': instance.company,
      'remark': instance.note,
      'nickName': instance.displayName,
      'province': instance.region,
      'city': instance.city,
      'street': instance.street,
      'postCode': instance.postcode,
      'title': instance.jobTitle,
      'email': instance.email,
    };
