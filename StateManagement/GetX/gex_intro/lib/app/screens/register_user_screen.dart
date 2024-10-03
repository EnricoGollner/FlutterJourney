import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gex_intro/app/controllers/user_controller.dart';
import 'package:gex_intro/app/screens/data_screen.dart';

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({super.key});

  final UserController userController = Get.find<UserController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('Name: ${userController.user.value.name}'),
            ),
            Obx(() => Text('Age: ${userController.user.value.age}')),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    userController.setUserName(nameController.text);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(labelText: 'Age'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    userController.setAge(int.parse(ageController.text));
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // final String result = await Get.to(() => const DataScreen());
                final String result = await Get.toNamed('/dataScreen');
                debugPrint(result);

                // Get.to(const DataScreen());
              },
              child: const Text('Data Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
