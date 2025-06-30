import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required String id,
    required String tripId,
    required String userId,
    required String seatNumber,
    required DateTime bookingTime,
    required double price,
    @Default(false) bool isUsed,
    required String paymentStatus,
    required String paymentMethod,
    required String ticketStatus,
    Map<String, dynamic>? tripDetails,
    Map<String, dynamic>? passengerDetails,
  }) = _Ticket;

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  factory Ticket.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    return Ticket.fromJson({
      'id': doc.id,
      'tripId': data?['tripId'] ?? '',
      'userId': data?['userId'] ?? '',
      'seatNumber': data?['seatNumber'] ?? '',
      'bookingTime':
          (data?['bookingTime'] as Timestamp?)?.toDate() ?? DateTime.now(),
      'price': (data?['price'] ?? 0.0).toDouble(),
      'isUsed': data?['isUsed'] ?? false,
      'paymentStatus': data?['paymentStatus'] ?? 'Pending',
      'paymentMethod': data?['paymentMethod'] ?? '',
      'ticketStatus': data?['ticketStatus'] ?? 'Active',
      'tripDetails': data?['tripDetails'],
      'passengerDetails': data?['passengerDetails'],
    });
  }

  Map<String, dynamic> toMap() => toJson();
}
