import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class Extra extends StatefulWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  _ExtraState createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {

  File? image;

  cameraImage() async{
    try {
      final imageFile=await ImagePicker().getImage(source: ImageSource.camera);
      if(imageFile==null)return;
      final fileimage = File(imageFile.path);
      setState(() {
        this.image = fileimage;
      });
    } on PlatformException catch (e) {
      print("${e} allow permission");
    }
  }

  galleryImage() async{
    try {
      final imageFile=await ImagePicker().getImage(source: ImageSource.gallery);
      if(imageFile==null)return;
      final fileimage = File(imageFile.path);
      setState(() {
        this.image = fileimage;
      });
    } on PlatformException catch (e) {
      print("${e} allow permission");
      // Fluttertoast.showToast(msg: "${e} allow permission");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network('https://images.ctfassets.net/hrltx12pl8hq/61DiwECVps74bWazF88Cy9/2cc9411d050b8ca50530cf97b3e51c96/Image_Cover.jpg?fit=fill&w=480&h=270',
                  loadingBuilder: (context,child,progress)=>progress==null?child:
                  Container(
                    child: CircularProgressIndicator(),
                  ),
                  height: 200,
                  width: 400,),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  bottomSheet(context);
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Color(0xff9fbed2)),
                    child:image==null? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.camera_alt_rounded,color: Colors.white,size: 40,),
                    ):ClipOval(
                      child: Image.file(image!,width: 100,
                        height: 100,fit: BoxFit.cover,),
                    )
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
  bottomSheet(context){
    showModalBottomSheet(
        context: context,shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),),
        enableDrag: true,
        isDismissible: true,
        builder: (BuildContext ctxt){

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: ()=>Navigator.of(context).pop(),
            child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.1,
              maxChildSize: 1,
              builder: (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 58.0),
                  child: SingleChildScrollView(
                    child: Column(
                     children: [
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                       Text("nhgfdxcfg"),
                     ],
                    ),
                  ),
                );
              },

            ),
          );
        });
  }
}
