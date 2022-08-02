/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_june2022/media_related/utils.dart';
import 'package:image_cropper/image_cropper.dart';

class PredefinedPage extends StatefulWidget {
  final bool isGallery;

  const PredefinedPage({
    Key? key,
    required this.isGallery,
  }) : super(key: key);

  @override
  _PredefinedPageState createState() => _PredefinedPageState();
}

class _PredefinedPageState extends State<PredefinedPage> {
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
      cropImage: cropPredefinedImage,
    );

    if (file == null) return;
    setState(() => imageFiles.add(file));
  }

  Future<CroppedFile?> cropPredefinedImage(File imageFile) async =>
      await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
        ],
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
}
*/
