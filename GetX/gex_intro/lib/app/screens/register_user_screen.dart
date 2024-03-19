import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gex_intro/app/controllers/user_controller.dart';

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({super.key});

  UserController userController = UserController();

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
          ],
        ),
      ),
    );
  }
}
