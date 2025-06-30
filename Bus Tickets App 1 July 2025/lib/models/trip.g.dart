// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      routeId: json['routeId'] as String,
      departureTime: DateTime.parse(json['departureTime'] as String),
      arrivalTime: DateTime.parse(json['arrivalTime'] as String),
      busId: json['busId'] as String,
      driverId: json['driverId'] as String,
      availableSeats: (json['availableSeats'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      busDetails: json['busDetails'] as Map<String, dynamic>?,
      routeDetails: json['routeDetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'routeId': instance.routeId,
      'departureTime': instance.departureTime.toIso8601String(),
      'arrivalTime': instance.arrivalTime.toIso8601String(),
      'busId': instance.busId,
      'driverId': instance.driverId,
      'availableSeats': instance.availableSeats,
      'price': instance.price,
      'busDetails': instance.busDetails,
      'routeDetails': instance.routeDetails,
    };
