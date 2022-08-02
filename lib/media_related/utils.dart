/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<File?> pickMedia({
    required bool isGallery,
    Future<File> Function(File file)? cropImage,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().getImage(source: source);

    if (pickedFile == null) return null;

    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);

      return cropImage(file);
    }
  }
}

class FloatingButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const FloatingButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    backgroundColor: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 2, color: Theme.of(context).accentColor),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Icon(Icons.add, color: Theme.of(context).accentColor),
    onPressed: onClicked,
  );
}



class ImageListWidget extends StatelessWidget {
  final List<File> imageFiles;

  const ImageListWidget({
    Key? key,
    required this.imageFiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GridView.count(
    physics: BouncingScrollPhysics(),
    padding: EdgeInsets.all(12),
    crossAxisCount: 2,
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
    children: imageFiles
        .map((imageFile) => ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.file(imageFile),
    ))
        .toList(),
  );
}*/
