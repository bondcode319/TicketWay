// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      id: json['id'] as String,
      tripId: json['tripId'] as String,
      userId: json['userId'] as String,
      seatNumber: json['seatNumber'] as String,
      bookingTime: DateTime.parse(json['bookingTime'] as String),
      price: (json['price'] as num).toDouble(),
      isUsed: json['isUsed'] as bool? ?? false,
      paymentStatus: json['paymentStatus'] as String,
      paymentMethod: json['paymentMethod'] as String,
      ticketStatus: json['ticketStatus'] as String,
      tripDetails: json['tripDetails'] as Map<String, dynamic>?,
      passengerDetails: json['passengerDetails'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tripId': instance.tripId,
      'userId': instance.userId,
      'seatNumber': instance.seatNumber,
      'bookingTime': instance.bookingTime.toIso8601String(),
      'price': instance.price,
      'isUsed': instance.isUsed,
      'paymentStatus': instance.paymentStatus,
      'paymentMethod': instance.paymentMethod,
      'ticketStatus': instance.ticketStatus,
      'tripDetails': instance.tripDetails,
      'passengerDetails': instance.passengerDetails,
    };
