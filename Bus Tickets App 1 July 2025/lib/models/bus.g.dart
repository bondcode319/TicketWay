// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusImpl _$$BusImplFromJson(Map<String, dynamic> json) => _$BusImpl(
      id: json['id'] as String,
      busNumber: json['busNumber'] as String,
      plateNumber: json['plateNumber'] as String,
      totalSeats: (json['totalSeats'] as num).toInt(),
      busType: json['busType'] as String,
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      operatorId: json['operatorId'] as String,
    );

Map<String, dynamic> _$$BusImplToJson(_$BusImpl instance) => <String, dynamic>{
      'id': instance.id,
      'busNumber': instance.busNumber,
      'plateNumber': instance.plateNumber,
      'totalSeats': instance.totalSeats,
      'busType': instance.busType,
      'amenities': instance.amenities,
      'operatorId': instance.operatorId,
    };
