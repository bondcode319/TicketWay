// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusRoute _$BusRouteFromJson(Map<String, dynamic> json) {
  return _BusRoute.fromJson(json);
}

/// @nodoc
mixin _$BusRoute {
  String get id => throw _privateConstructorUsedError;
  String get origin => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  int get estimatedDuration => throw _privateConstructorUsedError;
  List<String> get stops => throw _privateConstructorUsedError;
  double get fare => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusRouteCopyWith<BusRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusRouteCopyWith<$Res> {
  factory $BusRouteCopyWith(BusRoute value, $Res Function(BusRoute) then) =
      _$BusRouteCopyWithImpl<$Res, BusRoute>;
  @useResult
  $Res call(
      {String id,
      String origin,
      String destination,
      double distance,
      int estimatedDuration,
      List<String> stops,
      double fare});
}

/// @nodoc
class _$BusRouteCopyWithImpl<$Res, $Val extends BusRoute>
    implements $BusRouteCopyWith<$Res> {
  _$BusRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? distance = null,
    Object? estimatedDuration = null,
    Object? stops = null,
    Object? fare = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int,
      stops: null == stops
          ? _value.stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fare: null == fare
          ? _value.fare
          : fare // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusRouteImplCopyWith<$Res>
    implements $BusRouteCopyWith<$Res> {
  factory _$$BusRouteImplCopyWith(
          _$BusRouteImpl value, $Res Function(_$BusRouteImpl) then) =
      __$$BusRouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String origin,
      String destination,
      double distance,
      int estimatedDuration,
      List<String> stops,
      double fare});
}

/// @nodoc
class __$$BusRouteImplCopyWithImpl<$Res>
    extends _$BusRouteCopyWithImpl<$Res, _$BusRouteImpl>
    implements _$$BusRouteImplCopyWith<$Res> {
  __$$BusRouteImplCopyWithImpl(
      _$BusRouteImpl _value, $Res Function(_$BusRouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? origin = null,
    Object? destination = null,
    Object? distance = null,
    Object? estimatedDuration = null,
    Object? stops = null,
    Object? fare = null,
  }) {
    return _then(_$BusRouteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      estimatedDuration: null == estimatedDuration
          ? _value.estimatedDuration
          : estimatedDuration // ignore: cast_nullable_to_non_nullable
              as int,
      stops: null == stops
          ? _value._stops
          : stops // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fare: null == fare
          ? _value.fare
          : fare // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusRouteImpl extends _BusRoute {
  const _$BusRouteImpl(
      {required this.id,
      required this.origin,
      required this.destination,
      required this.distance,
      required this.estimatedDuration,
      required final List<String> stops,
      required this.fare})
      : _stops = stops,
        super._();

  factory _$BusRouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusRouteImplFromJson(json);

  @override
  final String id;
  @override
  final String origin;
  @override
  final String destination;
  @override
  final double distance;
  @override
  final int estimatedDuration;
  final List<String> _stops;
  @override
  List<String> get stops {
    if (_stops is EqualUnmodifiableListView) return _stops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stops);
  }

  @override
  final double fare;

  @override
  String toString() {
    return 'BusRoute(id: $id, origin: $origin, destination: $destination, distance: $distance, estimatedDuration: $estimatedDuration, stops: $stops, fare: $fare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusRouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.estimatedDuration, estimatedDuration) ||
                other.estimatedDuration == estimatedDuration) &&
            const DeepCollectionEquality().equals(other._stops, _stops) &&
            (identical(other.fare, fare) || other.fare == fare));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      origin,
      destination,
      distance,
      estimatedDuration,
      const DeepCollectionEquality().hash(_stops),
      fare);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusRouteImplCopyWith<_$BusRouteImpl> get copyWith =>
      __$$BusRouteImplCopyWithImpl<_$BusRouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusRouteImplToJson(
      this,
    );
  }
}

abstract class _BusRoute extends BusRoute {
  const factory _BusRoute(
      {required final String id,
      required final String origin,
      required final String destination,
      required final double distance,
      required final int estimatedDuration,
      required final List<String> stops,
      required final double fare}) = _$BusRouteImpl;
  const _BusRoute._() : super._();

  factory _BusRoute.fromJson(Map<String, dynamic> json) =
      _$BusRouteImpl.fromJson;

  @override
  String get id;
  @override
  String get origin;
  @override
  String get destination;
  @override
  double get distance;
  @override
  int get estimatedDuration;
  @override
  List<String> get stops;
  @override
  double get fare;
  @override
  @JsonKey(ignore: true)
  _$$BusRouteImplCopyWith<_$BusRouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
