import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  factory Trip({
    required String id,
    required String routeId,
    required DateTime departureTime,
    required DateTime arrivalTime,
    required String busId,
    required String driverId,
    required int availableSeats,
    required double price,
    Map<String, dynamic>? busDetails,
    Map<String, dynamic>? routeDetails,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}

// Extension method approach
extension TripMapper on Trip {
  Map<String, dynamic> toMap() => toJson();
}
