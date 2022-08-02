/*
import 'package:flutter/material.dart';
import 'package:flutter_june2022/media_related/predefined.dart';
import 'package:flutter_june2022/media_related/square.dart';

import 'custom_page.dart';



class ImageCropp extends StatefulWidget {
  const ImageCropp({Key? key}) : super(key: key);

  @override
  State<ImageCropp> createState() => _ImageCroppState();
}

class _ImageCroppState extends State<ImageCropp> with SingleTickerProviderStateMixin{
  TabController? controller;
  bool isGallery = true;
  int index = 2;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Cropping Image"),
      centerTitle: false,
      actions: [
        Row(
          children: [
            Text(
              isGallery ? 'Gallery' : 'Camera',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Switch(
              value: isGallery,
              onChanged: (value) => setState(() => isGallery = value),
            ),
          ],
        ),
      ],
    ),
    body: Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            controller: controller,
            indicatorWeight: 3,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: 'Images'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              IndexedStack(
                index: index,
                children: [
                  SquarePage(isGallery: isGallery),
                  CustomPage(isGallery: isGallery),
                  PredefinedPage(isGallery: isGallery),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    bottomNavigationBar: buildBottomBar(),
  );

  Widget buildBottomBar() {
    final style = TextStyle(color: Theme.of(context).accentColor);

    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('Cropper', style: style),
          label: "Suare",
        ),
        BottomNavigationBarItem(
          icon: Text('Cropper', style: style),
        label: 'Custom'
        ),
        BottomNavigationBarItem(
          icon: Text('Cropper', style: style),
        label: 'Predefined'
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }
}
*/

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class ImageCropperr extends StatefulWidget {
  final String title;

  const ImageCropperr({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _ImageCropperrState createState() => _ImageCropperrState();
}

class _ImageCropperrState extends State<ImageCropperr> {
  XFile? _pickedFile;
  CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb ? AppBar(title: Text(widget.title)) : null,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (kIsWeb)
            Padding(
              padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Theme.of(context).highlightColor),
              ),
            ),
          Expanded(child: _body()),
        ],
      ),
    );
  }

  Widget _body() {
    if (_croppedFile != null || _pickedFile != null) {
      return _imageCard();
    } else {
      return _uploaderCard();
    }
  }

  Widget _imageCard() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: kIsWeb ? 24.0 : 16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(kIsWeb ? 24.0 : 16.0),
                child: _image(),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          _menu(),
        ],
      ),
    );
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else if (_pickedFile != null) {
      final path = _pickedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 0.8 * screenWidth,
          maxHeight: 0.7 * screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _menu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            _clear();
          },
          backgroundColor: Colors.redAccent,
          tooltip: 'Delete',
          child: const Icon(Icons.delete),
        ),
        if (_croppedFile == null)
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: () {
                _cropImage();
              },
              backgroundColor: const Color(0xFFBC764A),
              tooltip: 'Crop',
              child: const Icon(Icons.crop),
            ),
          )
      ],
    );
  }

  Widget _uploaderCard() {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          width: kIsWeb ? 380.0 : 320.0,
          height: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Theme.of(context).highlightColor,
                          size: 80.0,
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          'Upload an image to start',
                          style: kIsWeb
                              ? Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                              color: Theme.of(context).highlightColor)
                              : Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                              color:
                              Theme.of(context).highlightColor),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    _uploadImage();
                  },
                  child: const Text('Upload'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _cropImage() async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
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
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Future<void> _uploadImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    }
  }

  void _clear() {
    setState(() {
      _pickedFile = null;
      _croppedFile = null;
    });
  }
}


