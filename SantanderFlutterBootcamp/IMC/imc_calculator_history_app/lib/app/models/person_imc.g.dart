// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_imc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonIMCImpl _$$PersonIMCImplFromJson(Map<String, dynamic> json) =>
    _$PersonIMCImpl(
      id: json['id'] as int?,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      imc: (json['imc'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$PersonIMCImplToJson(_$PersonIMCImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'weight': instance.weight,
      'imc': instance.imc,
      'date': instance.date,
    };
