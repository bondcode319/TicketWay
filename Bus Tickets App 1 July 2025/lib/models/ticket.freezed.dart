// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String get id => throw _privateConstructorUsedError;
  String get tripId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get seatNumber => throw _privateConstructorUsedError;
  DateTime get bookingTime => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isUsed => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String get ticketStatus => throw _privateConstructorUsedError;
  Map<String, dynamic>? get tripDetails => throw _privateConstructorUsedError;
  Map<String, dynamic>? get passengerDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String id,
      String tripId,
      String userId,
      String seatNumber,
      DateTime bookingTime,
      double price,
      bool isUsed,
      String paymentStatus,
      String paymentMethod,
      String ticketStatus,
      Map<String, dynamic>? tripDetails,
      Map<String, dynamic>? passengerDetails});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tripId = null,
    Object? userId = null,
    Object? seatNumber = null,
    Object? bookingTime = null,
    Object? price = null,
    Object? isUsed = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? ticketStatus = null,
    Object? tripDetails = freezed,
    Object? passengerDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bookingTime: null == bookingTime
          ? _value.bookingTime
          : bookingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      ticketStatus: null == ticketStatus
          ? _value.ticketStatus
          : ticketStatus // ignore: cast_nullable_to_non_nullable
              as String,
      tripDetails: freezed == tripDetails
          ? _value.tripDetails
          : tripDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      passengerDetails: freezed == passengerDetails
          ? _value.passengerDetails
          : passengerDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String tripId,
      String userId,
      String seatNumber,
      DateTime bookingTime,
      double price,
      bool isUsed,
      String paymentStatus,
      String paymentMethod,
      String ticketStatus,
      Map<String, dynamic>? tripDetails,
      Map<String, dynamic>? passengerDetails});
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tripId = null,
    Object? userId = null,
    Object? seatNumber = null,
    Object? bookingTime = null,
    Object? price = null,
    Object? isUsed = null,
    Object? paymentStatus = null,
    Object? paymentMethod = null,
    Object? ticketStatus = null,
    Object? tripDetails = freezed,
    Object? passengerDetails = freezed,
  }) {
    return _then(_$TicketImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      seatNumber: null == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bookingTime: null == bookingTime
          ? _value.bookingTime
          : bookingTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      ticketStatus: null == ticketStatus
          ? _value.ticketStatus
          : ticketStatus // ignore: cast_nullable_to_non_nullable
              as String,
      tripDetails: freezed == tripDetails
          ? _value._tripDetails
          : tripDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      passengerDetails: freezed == passengerDetails
          ? _value._passengerDetails
          : passengerDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {required this.id,
      required this.tripId,
      required this.userId,
      required this.seatNumber,
      required this.bookingTime,
      required this.price,
      this.isUsed = false,
      required this.paymentStatus,
      required this.paymentMethod,
      required this.ticketStatus,
      final Map<String, dynamic>? tripDetails,
      final Map<String, dynamic>? passengerDetails})
      : _tripDetails = tripDetails,
        _passengerDetails = passengerDetails;

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  final String id;
  @override
  final String tripId;
  @override
  final String userId;
  @override
  final String seatNumber;
  @override
  final DateTime bookingTime;
  @override
  final double price;
  @override
  @JsonKey()
  final bool isUsed;
  @override
  final String paymentStatus;
  @override
  final String paymentMethod;
  @override
  final String ticketStatus;
  final Map<String, dynamic>? _tripDetails;
  @override
  Map<String, dynamic>? get tripDetails {
    final value = _tripDetails;
    if (value == null) return null;
    if (_tripDetails is EqualUnmodifiableMapView) return _tripDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _passengerDetails;
  @override
  Map<String, dynamic>? get passengerDetails {
    final value = _passengerDetails;
    if (value == null) return null;
    if (_passengerDetails is EqualUnmodifiableMapView) return _passengerDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Ticket(id: $id, tripId: $tripId, userId: $userId, seatNumber: $seatNumber, bookingTime: $bookingTime, price: $price, isUsed: $isUsed, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, ticketStatus: $ticketStatus, tripDetails: $tripDetails, passengerDetails: $passengerDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            (identical(other.bookingTime, bookingTime) ||
                other.bookingTime == bookingTime) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.ticketStatus, ticketStatus) ||
                other.ticketStatus == ticketStatus) &&
            const DeepCollectionEquality()
                .equals(other._tripDetails, _tripDetails) &&
            const DeepCollectionEquality()
                .equals(other._passengerDetails, _passengerDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tripId,
      userId,
      seatNumber,
      bookingTime,
      price,
      isUsed,
      paymentStatus,
      paymentMethod,
      ticketStatus,
      const DeepCollectionEquality().hash(_tripDetails),
      const DeepCollectionEquality().hash(_passengerDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {required final String id,
      required final String tripId,
      required final String userId,
      required final String seatNumber,
      required final DateTime bookingTime,
      required final double price,
      final bool isUsed,
      required final String paymentStatus,
      required final String paymentMethod,
      required final String ticketStatus,
      final Map<String, dynamic>? tripDetails,
      final Map<String, dynamic>? passengerDetails}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  String get id;
  @override
  String get tripId;
  @override
  String get userId;
  @override
  String get seatNumber;
  @override
  DateTime get bookingTime;
  @override
  double get price;
  @override
  bool get isUsed;
  @override
  String get paymentStatus;
  @override
  String get paymentMethod;
  @override
  String get ticketStatus;
  @override
  Map<String, dynamic>? get tripDetails;
  @override
  Map<String, dynamic>? get passengerDetails;
  @override
  @JsonKey(ignore: true)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
