
//import 'dart:html';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_june2022/extension__methods/extension_widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProfileStorage extends StatefulWidget {
  const ProfileStorage({Key? key}) : super(key: key);

  @override
  State<ProfileStorage> createState() => _ProfileStorageState();
}

class _ProfileStorageState extends State<ProfileStorage> {

  String? imageLink;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),

              imageLink!=null ?
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 100,
                child: SizedBox(
                    height: 150,width:150,
                    child: ClipOval(child: Image.network(imageLink ?? '',fit: BoxFit.cover,))),
              ):
              const CircleAvatar(
                backgroundColor: Colors.amberAccent,
                radius: 100,
                child: Icon(Icons.person,size: 70,),
              ),

              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () async{

                    final file = await ImagePicker().pickImage(source: ImageSource.gallery,);
                    
                    if(file?.path != null){
                      setState(() {
                        image = File(file!.path);
                      });
                    }
                    print("$image kjhgfdsasdfghjklkjhgfdsadfghjkl");

                     Reference pictureFolderRef = FirebaseStorage.instance
                         .ref()
                         .child('profilePic')
                         .child('image');


                     pictureFolderRef.putFile(image!).whenComplete(()=>null).then((storageTask)async{
                       String link = await storageTask.ref.getDownloadURL();
                       print("uploaded");
                       setState(() {
                         imageLink = link;
                       });
                     });


                  },
                  child:const Text("Select Picture")),

            ],
          ),
        ),
      ),

    );
  }
}
