import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_june2022/firebase/cloud_firestore/product_model.dart';


class SendData extends StatefulWidget {
  const SendData({Key? key}) : super(key: key);

  @override
  State<SendData> createState() => _SendDataState();
}

class _SendDataState extends State<SendData> {

  TextEditingController name=TextEditingController();
  TextEditingController price=TextEditingController();

  Future<void> insertData(final product) async{
    FirebaseFirestore fireStore=FirebaseFirestore.instance;
    fireStore.collection("products").add(product).
    then((DocumentReference ref) {
      print(ref.id);
    }).catchError((e){
      print(e);
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
              child: TextField(
                controller: price,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter price"
                ),
              ),
            ),

            ElevatedButton(
                onPressed: (){

                  final pricee=price.text;
                  final namee=name.text;
                  ProductModel product=ProductModel(namee, pricee);
                  insertData(product.toMap());

                },
                child:const Text("Add Item")),
            Expanded(
                child:StreamBuilder<QuerySnapshot>(   // QuerySnapshot-imp
                  stream: FirebaseFirestore.instance.collection("products").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                     if(snapshot.hasError){
                       return Text("There is some erroe");
                     }
                     if (snapshot.connectionState==ConnectionState.waiting){
                       return CircularProgressIndicator();
                     } else {
                       final list=snapshot.data?.docs;
                      return ListView.builder(
                      itemCount: list?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(list?[index]["name"]??''),
                          subtitle: Text(list?[index]["price"]?? ''),
                        );
                      });
                }
              },)
              )
          ],
        ),
      ),
    );
  }
}
