import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
class BusRoute with _$BusRoute {
  const BusRoute._(); // Add this line to include common members

  const factory BusRoute({
    required String id,
    required String origin,
    required String destination,
    required double distance,
    required int estimatedDuration,
    required List<String> stops,
    required double fare,
  }) = _BusRoute;

  factory BusRoute.fromJson(Map<String, dynamic> json) =>
      _$BusRouteFromJson(json);

  factory BusRoute.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return BusRoute.fromJson({
      'id': doc.id,
      'origin': data?['origin'] ?? '',
      'destination': data?['destination'] ?? '',
      'distance': (data?['distance'] ?? 0.0).toDouble(),
      'estimatedDuration': data?['estimatedDuration'] ?? 0,
      'stops': List<String>.from(data?['stops'] ?? []),
      'fare': (data?['fare'] ?? 0.0).toDouble(),
    });
  }

  Map<String, dynamic> toMap() => toJson();
}
