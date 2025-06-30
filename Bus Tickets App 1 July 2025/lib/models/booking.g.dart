// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      service: json['service'] as String,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'service': instance.service,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'details': instance.details,
    };
