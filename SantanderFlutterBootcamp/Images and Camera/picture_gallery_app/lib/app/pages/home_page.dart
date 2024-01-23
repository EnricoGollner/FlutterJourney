import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:picture_gallery_app/app/pages/widgets/custom_profile_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture & Gallery'),
      ),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        padding: const EdgeInsets.only(top: 70),
        child: Column(children: [
          CustomProfileCard(profileImage: _image, editImage: _showDialogToEditImage)
        ],)
      )
    );
  }

  void _showDialogToEditImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Gallery'),
              onTap: () async {
                await _pickImage(source: ImageSource.gallery).then((_) => Navigator.pop(context));
                
              },
            ),
            ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () async {
                  await _pickImage(source: ImageSource.camera).then((_) =>  Navigator.pop(context));
                }),
          ],
        );
      },
    );
  }

  Future<void> _pickImage({required ImageSource source}) async {
    final ImagePicker picker = ImagePicker();

    picker.pickImage(source: source).then((xFile) async {
      if (xFile != null) {
        //Saving image into app directory
        // String path = (await  getApplicationDocumentsDirectory()).path;
        // await xFile.saveTo('$path/${basename(xFile.path)}');

        // Using Gallery Saver package to save images into galery (android.permission.WRITE_EXTERNAL_STORAGE required - AndroidManifest.xml)
        // GallerySaver.saveImage(xFile.path);
        
        await cropImage(xFile).then((croppedImageFile) {
          if (croppedImageFile != null) {
            setState(() =>  _image = File(croppedImageFile.path));
          }
        });     
      }
    });
  }

  Future<CroppedFile?> cropImage(XFile file) async {
    return await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
  }
}
