// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentImpl _$$PaymentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      method: json['method'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      ticketId: json['ticketId'] as String?,
    );

Map<String, dynamic> _$$PaymentImplToJson(_$PaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'method': instance.method,
      'timestamp': instance.timestamp.toIso8601String(),
      'ticketId': instance.ticketId,
    };
