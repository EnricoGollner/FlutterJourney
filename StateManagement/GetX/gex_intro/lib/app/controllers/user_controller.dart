import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:gex_intro/app/model/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;

  void setUserName(String name) {
    user.update((userObject) {
      userObject?.name = name;
    });
  }

  void setAge(int age) {
    user.update((userObject) {
      userObject?.age = age;
    });
  }
}
