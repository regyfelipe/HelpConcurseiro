import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPicker extends StatelessWidget {
  final File? avatarImage;
  final Function(ImageSource) onImagePicked;

  const AvatarPicker({
    Key? key,
    required this.avatarImage,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageSourceOptions(context),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: avatarImage != null ? FileImage(avatarImage!) : null,
        child: avatarImage == null ? Icon(Icons.camera_alt, size: 50) : null,
      ),
    );
  }

  void _showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Galeria'),
              onTap: () {
                Navigator.pop(context);
                onImagePicked(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Câmera'),
              onTap: () {
                Navigator.pop(context);
                onImagePicked(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }
}
