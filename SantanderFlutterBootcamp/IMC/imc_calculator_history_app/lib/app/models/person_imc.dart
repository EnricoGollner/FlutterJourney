
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_imc.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'person_imc.g.dart';

@freezed
class PersonIMC with _$PersonIMC {
  const factory PersonIMC({
    required int id,
    required double height,
    required double weight,
    required double imc,
    required String date,
  }) = _PersonIMC;

  factory PersonIMC.fromJson(Map<String, Object?> json) => _$PersonIMCFromJson(json);
}