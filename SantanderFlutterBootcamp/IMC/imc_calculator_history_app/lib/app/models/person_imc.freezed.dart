// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_imc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonIMC _$PersonIMCFromJson(Map<String, dynamic> json) {
  return _PersonIMC.fromJson(json);
}

/// @nodoc
mixin _$PersonIMC {
  int? get id => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  double get imc => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonIMCCopyWith<PersonIMC> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonIMCCopyWith<$Res> {
  factory $PersonIMCCopyWith(PersonIMC value, $Res Function(PersonIMC) then) =
      _$PersonIMCCopyWithImpl<$Res, PersonIMC>;
  @useResult
  $Res call({int? id, double height, double weight, double imc, String date});
}

/// @nodoc
class _$PersonIMCCopyWithImpl<$Res, $Val extends PersonIMC>
    implements $PersonIMCCopyWith<$Res> {
  _$PersonIMCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? height = null,
    Object? weight = null,
    Object? imc = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      imc: null == imc
          ? _value.imc
          : imc // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonIMCImplCopyWith<$Res>
    implements $PersonIMCCopyWith<$Res> {
  factory _$$PersonIMCImplCopyWith(
          _$PersonIMCImpl value, $Res Function(_$PersonIMCImpl) then) =
      __$$PersonIMCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, double height, double weight, double imc, String date});
}

/// @nodoc
class __$$PersonIMCImplCopyWithImpl<$Res>
    extends _$PersonIMCCopyWithImpl<$Res, _$PersonIMCImpl>
    implements _$$PersonIMCImplCopyWith<$Res> {
  __$$PersonIMCImplCopyWithImpl(
      _$PersonIMCImpl _value, $Res Function(_$PersonIMCImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? height = null,
    Object? weight = null,
    Object? imc = null,
    Object? date = null,
  }) {
    return _then(_$PersonIMCImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      imc: null == imc
          ? _value.imc
          : imc // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonIMCImpl implements _PersonIMC {
  const _$PersonIMCImpl(
      {this.id,
      required this.height,
      required this.weight,
      required this.imc,
      required this.date});

  factory _$PersonIMCImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonIMCImplFromJson(json);

  @override
  final int? id;
  @override
  final double height;
  @override
  final double weight;
  @override
  final double imc;
  @override
  final String date;

  @override
  String toString() {
    return 'PersonIMC(id: $id, height: $height, weight: $weight, imc: $imc, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonIMCImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.imc, imc) || other.imc == imc) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, height, weight, imc, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonIMCImplCopyWith<_$PersonIMCImpl> get copyWith =>
      __$$PersonIMCImplCopyWithImpl<_$PersonIMCImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonIMCImplToJson(
      this,
    );
  }
}

abstract class _PersonIMC implements PersonIMC {
  const factory _PersonIMC(
      {final int? id,
      required final double height,
      required final double weight,
      required final double imc,
      required final String date}) = _$PersonIMCImpl;

  factory _PersonIMC.fromJson(Map<String, dynamic> json) =
      _$PersonIMCImpl.fromJson;

  @override
  int? get id;
  @override
  double get height;
  @override
  double get weight;
  @override
  double get imc;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$PersonIMCImplCopyWith<_$PersonIMCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
