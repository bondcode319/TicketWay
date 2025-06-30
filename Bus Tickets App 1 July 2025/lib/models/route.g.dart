// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusRouteImpl _$$BusRouteImplFromJson(Map<String, dynamic> json) =>
    _$BusRouteImpl(
      id: json['id'] as String,
      origin: json['origin'] as String,
      destination: json['destination'] as String,
      distance: (json['distance'] as num).toDouble(),
      estimatedDuration: (json['estimatedDuration'] as num).toInt(),
      stops: (json['stops'] as List<dynamic>).map((e) => e as String).toList(),
      fare: (json['fare'] as num).toDouble(),
    );

Map<String, dynamic> _$$BusRouteImplToJson(_$BusRouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'destination': instance.destination,
      'distance': instance.distance,
      'estimatedDuration': instance.estimatedDuration,
      'stops': instance.stops,
      'fare': instance.fare,
    };
