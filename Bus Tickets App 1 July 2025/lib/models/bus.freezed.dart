// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bus _$BusFromJson(Map<String, dynamic> json) {
  return _Bus.fromJson(json);
}

/// @nodoc
mixin _$Bus {
  String get id => throw _privateConstructorUsedError;
  String get busNumber => throw _privateConstructorUsedError;
  String get plateNumber => throw _privateConstructorUsedError;
  int get totalSeats => throw _privateConstructorUsedError;
  String get busType => throw _privateConstructorUsedError;
  List<String> get amenities => throw _privateConstructorUsedError;
  String get operatorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusCopyWith<Bus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusCopyWith<$Res> {
  factory $BusCopyWith(Bus value, $Res Function(Bus) then) =
      _$BusCopyWithImpl<$Res, Bus>;
  @useResult
  $Res call(
      {String id,
      String busNumber,
      String plateNumber,
      int totalSeats,
      String busType,
      List<String> amenities,
      String operatorId});
}

/// @nodoc
class _$BusCopyWithImpl<$Res, $Val extends Bus> implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? busNumber = null,
    Object? plateNumber = null,
    Object? totalSeats = null,
    Object? busType = null,
    Object? amenities = null,
    Object? operatorId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      busNumber: null == busNumber
          ? _value.busNumber
          : busNumber // ignore: cast_nullable_to_non_nullable
              as String,
      plateNumber: null == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
      busType: null == busType
          ? _value.busType
          : busType // ignore: cast_nullable_to_non_nullable
              as String,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusImplCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$$BusImplCopyWith(_$BusImpl value, $Res Function(_$BusImpl) then) =
      __$$BusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String busNumber,
      String plateNumber,
      int totalSeats,
      String busType,
      List<String> amenities,
      String operatorId});
}

/// @nodoc
class __$$BusImplCopyWithImpl<$Res> extends _$BusCopyWithImpl<$Res, _$BusImpl>
    implements _$$BusImplCopyWith<$Res> {
  __$$BusImplCopyWithImpl(_$BusImpl _value, $Res Function(_$BusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? busNumber = null,
    Object? plateNumber = null,
    Object? totalSeats = null,
    Object? busType = null,
    Object? amenities = null,
    Object? operatorId = null,
  }) {
    return _then(_$BusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      busNumber: null == busNumber
          ? _value.busNumber
          : busNumber // ignore: cast_nullable_to_non_nullable
              as String,
      plateNumber: null == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
      busType: null == busType
          ? _value.busType
          : busType // ignore: cast_nullable_to_non_nullable
              as String,
      amenities: null == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      operatorId: null == operatorId
          ? _value.operatorId
          : operatorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusImpl implements _Bus {
  const _$BusImpl(
      {required this.id,
      required this.busNumber,
      required this.plateNumber,
      required this.totalSeats,
      required this.busType,
      required final List<String> amenities,
      required this.operatorId})
      : _amenities = amenities;

  factory _$BusImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusImplFromJson(json);

  @override
  final String id;
  @override
  final String busNumber;
  @override
  final String plateNumber;
  @override
  final int totalSeats;
  @override
  final String busType;
  final List<String> _amenities;
  @override
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  @override
  final String operatorId;

  @override
  String toString() {
    return 'Bus(id: $id, busNumber: $busNumber, plateNumber: $plateNumber, totalSeats: $totalSeats, busType: $busType, amenities: $amenities, operatorId: $operatorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.busNumber, busNumber) ||
                other.busNumber == busNumber) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.totalSeats, totalSeats) ||
                other.totalSeats == totalSeats) &&
            (identical(other.busType, busType) || other.busType == busType) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            (identical(other.operatorId, operatorId) ||
                other.operatorId == operatorId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      busNumber,
      plateNumber,
      totalSeats,
      busType,
      const DeepCollectionEquality().hash(_amenities),
      operatorId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      __$$BusImplCopyWithImpl<_$BusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusImplToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'busNumber': busNumber,
      'plateNumber': plateNumber,
      'totalSeats': totalSeats,
      'busType': busType,
      'amenities': amenities,
      'operatorId': operatorId,
    };
  }
}

abstract class _Bus implements Bus {
  const factory _Bus(
      {required final String id,
      required final String busNumber,
      required final String plateNumber,
      required final int totalSeats,
      required final String busType,
      required final List<String> amenities,
      required final String operatorId}) = _$BusImpl;

  factory _Bus.fromJson(Map<String, dynamic> json) = _$BusImpl.fromJson;

  @override
  String get id;
  @override
  String get busNumber;
  @override
  String get plateNumber;
  @override
  int get totalSeats;
  @override
  String get busType;
  @override
  List<String> get amenities;
  @override
  String get operatorId;
  @override
  @JsonKey(ignore: true)
  _$$BusImplCopyWith<_$BusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
