import 'package:data_visualization_app/shared/utils/db_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorageService {
  Future<void> setName(String name) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(DBUtils.nameKey, name);
  }

  Future<String> getName() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(DBUtils.nameKey) ?? '';
  }

  Future<void> setBirthDate(String birthDateFormatted) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(DBUtils.birthDateKey, birthDateFormatted);
  }

  Future<String> getBirthDate() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(DBUtils.birthDateKey) ?? '';
  }

  Future<void> setExperienceLevel(String experienceLevelValue) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(DBUtils.experienceLevelKey, experienceLevelValue);
  }

  Future<String> getExperienceLevel() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(DBUtils.experienceLevelKey) ?? '';
  }

  Future<void> setLanguagesExperience(List<String> languages) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList(DBUtils.experienceLanguagesKey, languages);
  }

  Future<List<String>> getLanguagesExperience() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList(DBUtils.experienceLanguagesKey) ?? List<String>.empty();
  }

  Future<void> saveAllData({
    required String name,
    required String birthDate,
    required String experienceLevel,
    required List<String> languagesExperience,
  }) async {
    await setName(name);
    await setBirthDate(birthDate);
    await setExperienceLevel(experienceLevel);
    await setLanguagesExperience(languagesExperience);
  }
}
