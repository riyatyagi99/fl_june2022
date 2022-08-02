/*
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_june2022/media_related/utils.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SquarePage extends StatefulWidget {
  final bool isGallery;

  const SquarePage({
    Key? key,
    required this.isGallery,
  }) : super(key: key);

  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
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
      cropImage: cropSquareImage,
    );

    if (file == null) return;
    setState(() => imageFiles.add(file));
  }

  Future<CroppedFile?> cropSquareImage(XFile imageFile) async =>
      await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [CropAspectRatioPreset.square],
        compressQuality: 70,
        compressFormat: ImageCompressFormat.jpg,
       c
      );


}
*/
