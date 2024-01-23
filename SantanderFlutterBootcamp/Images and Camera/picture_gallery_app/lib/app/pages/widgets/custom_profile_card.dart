import 'dart:io';

import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final File? profileImage;
  final void Function(BuildContext context) editImage;

  const CustomProfileCard({super.key, required this.profileImage, required this.editImage});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => editImage(context),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: profileImage != null
                          ? FileImage(profileImage!)
                          : const AssetImage('assets/profile.webp') as ImageProvider,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 17,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('User Name'),
          ],
        );
  }
}