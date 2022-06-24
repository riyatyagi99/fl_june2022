import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageOpn extends StatefulWidget {
  const ImageOpn({Key? key}) : super(key: key);

  @override
  State<ImageOpn> createState() => _ImageOpnState();
}

class _ImageOpnState extends State<ImageOpn> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(imageFile != null)
                ClipOval(
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                    /*  gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),*/
                      image: DecorationImage(
                          image: FileImage(imageFile!),
                          fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                )
              else
                ClipOval(
                  child: Container(
                    width: 200,
                    height:200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(55.0),
                    ),
                    child:Icon(Icons.person)
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red,

                ),
                child: TextButton(
                    onPressed: ()=> getImage(source: ImageSource.camera),
                    child: const Text('From Camera ',
                        style: TextStyle(fontSize: 18,color: Colors.white))
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                ),
                child: TextButton(
                    onPressed: ()=> getImage(source: ImageSource.gallery),
                    child: const Text('From Gallery',
                        style: TextStyle(fontSize: 18,color: Colors.white))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  File? imageFile;
  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
      source: source,
    );

    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

}
