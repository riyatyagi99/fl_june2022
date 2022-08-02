/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_june2022/media_related/utils.dart';
import 'package:image_cropper/image_cropper.dart';


class CustomPage extends StatefulWidget {
  final bool isGallery;

  const CustomPage({
    Key? key,
    required this.isGallery,
  }) : super(key: key);

  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  List<File> imageFiles = [];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ImageListWidget(imageFiles: imageFiles),
    floatingActionButton: FloatingButtonWidget(onClicked: onClickedButton),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );

  Future onClickedButton() async {
    final file = await Utils.pickMedia(
      isGallery: widget.isGallery,
      cropImage: cropCustomImage,
    );

    if (file == null) return;
    setState(() => imageFiles.add(file));
  }

  static Future<CroppedFile?> cropCustomImage(File imageFile) async =>
      await ImageCropper().cropImage(
        aspectRatio: CropAspectRatio(ratioX: 16, ratioY: 9),
        sourcePath: imageFile.path,

        uiSettings: [
        AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: Colors.red,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
        IOSUiSettings(
     aspectRatioLockEnabled: false,
     )
        ],
      );

}*/
