import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String userId,
    required String service,
    required DateTime date,
    required String status,
    Map<String, dynamic>? details,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return Booking.fromJson({
      'id': doc.id,
      'userId': data?['userId'] ?? '',
      'service': data?['service'] ?? '',
      'date': (data?['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      'status': data?['status'] ?? 'pending',
      'details': data?['details'],
    });
  }
}
