import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
class Bus with _$Bus {
  const factory Bus({
    required String id,
    required String busNumber,
    required String plateNumber,
    required int totalSeats,
    required String busType,
    required List<String> amenities,
    required String operatorId,
  }) = _Bus;

  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

  factory Bus.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return Bus.fromJson({
      'id': doc.id,
      'busNumber': data?['busNumber'] ?? '',
      'plateNumber': data?['plateNumber'] ?? '',
      'totalSeats': data?['totalSeats'] ?? 0,
      'busType': data?['busType'] ?? 'Standard',
      'amenities': List<String>.from(data?['amenities'] ?? []),
      'operatorId': data?['operatorId'] ?? '',
    });
  }

  Map<String, dynamic> toMap() => toJson();
}
