// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError;
  DateTime get departureTime => throw _privateConstructorUsedError;
  DateTime get arrivalTime => throw _privateConstructorUsedError;
  String get busId => throw _privateConstructorUsedError;
  String get driverId => throw _privateConstructorUsedError;
  int get availableSeats => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  Map<String, dynamic>? get busDetails => throw _privateConstructorUsedError;
  Map<String, dynamic>? get routeDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {String id,
      String routeId,
      DateTime departureTime,
      DateTime arrivalTime,
      String busId,
      String driverId,
      int availableSeats,
      double price,
      Map<String, dynamic>? busDetails,
      Map<String, dynamic>? routeDetails});
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? busId = null,
    Object? driverId = null,
    Object? availableSeats = null,
    Object? price = null,
    Object? busDetails = freezed,
    Object? routeDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      availableSeats: null == availableSeats
          ? _value.availableSeats
          : availableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      busDetails: freezed == busDetails
          ? _value.busDetails
          : busDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      routeDetails: freezed == routeDetails
          ? _value.routeDetails
          : routeDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String routeId,
      DateTime departureTime,
      DateTime arrivalTime,
      String busId,
      String driverId,
      int availableSeats,
      double price,
      Map<String, dynamic>? busDetails,
      Map<String, dynamic>? routeDetails});
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? busId = null,
    Object? driverId = null,
    Object? availableSeats = null,
    Object? price = null,
    Object? busDetails = freezed,
    Object? routeDetails = freezed,
  }) {
    return _then(_$TripImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as String,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as String,
      availableSeats: null == availableSeats
          ? _value.availableSeats
          : availableSeats // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      busDetails: freezed == busDetails
          ? _value._busDetails
          : busDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      routeDetails: freezed == routeDetails
          ? _value._routeDetails
          : routeDetails // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl implements _Trip {
  _$TripImpl(
      {required this.id,
      required this.routeId,
      required this.departureTime,
      required this.arrivalTime,
      required this.busId,
      required this.driverId,
      required this.availableSeats,
      required this.price,
      final Map<String, dynamic>? busDetails,
      final Map<String, dynamic>? routeDetails})
      : _busDetails = busDetails,
        _routeDetails = routeDetails;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String id;
  @override
  final String routeId;
  @override
  final DateTime departureTime;
  @override
  final DateTime arrivalTime;
  @override
  final String busId;
  @override
  final String driverId;
  @override
  final int availableSeats;
  @override
  final double price;
  final Map<String, dynamic>? _busDetails;
  @override
  Map<String, dynamic>? get busDetails {
    final value = _busDetails;
    if (value == null) return null;
    if (_busDetails is EqualUnmodifiableMapView) return _busDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _routeDetails;
  @override
  Map<String, dynamic>? get routeDetails {
    final value = _routeDetails;
    if (value == null) return null;
    if (_routeDetails is EqualUnmodifiableMapView) return _routeDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Trip(id: $id, routeId: $routeId, departureTime: $departureTime, arrivalTime: $arrivalTime, busId: $busId, driverId: $driverId, availableSeats: $availableSeats, price: $price, busDetails: $busDetails, routeDetails: $routeDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.availableSeats, availableSeats) ||
                other.availableSeats == availableSeats) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._busDetails, _busDetails) &&
            const DeepCollectionEquality()
                .equals(other._routeDetails, _routeDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      routeId,
      departureTime,
      arrivalTime,
      busId,
      driverId,
      availableSeats,
      price,
      const DeepCollectionEquality().hash(_busDetails),
      const DeepCollectionEquality().hash(_routeDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  factory _Trip(
      {required final String id,
      required final String routeId,
      required final DateTime departureTime,
      required final DateTime arrivalTime,
      required final String busId,
      required final String driverId,
      required final int availableSeats,
      required final double price,
      final Map<String, dynamic>? busDetails,
      final Map<String, dynamic>? routeDetails}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String get id;
  @override
  String get routeId;
  @override
  DateTime get departureTime;
  @override
  DateTime get arrivalTime;
  @override
  String get busId;
  @override
  String get driverId;
  @override
  int get availableSeats;
  @override
  double get price;
  @override
  Map<String, dynamic>? get busDetails;
  @override
  Map<String, dynamic>? get routeDetails;
  @override
  @JsonKey(ignore: true)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
