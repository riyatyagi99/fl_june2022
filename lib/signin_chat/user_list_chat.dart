import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentication_class.dart';
import 'chat_screen.dart';
import 'google_signin.dart';


class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;


  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:Text("People List"),
         centerTitle: true,
        actions: [
          _user.photoURL != null
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipOval(
            child: Material(
                color:Colors.grey,
                child: Image.network(
                  _user.photoURL!,
                  fit: BoxFit.fitHeight,
                ),
            ),
          ),
              )
              : ClipOval(
            child: Material(
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color:Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          _isSigningOut
              ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          )
              : ElevatedButton(
            onPressed: () async {
              setState(() {
                _isSigningOut = true;
              });
              await Authentication.signOut(context: context);
              setState(() {
                _isSigningOut = false;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GoogleSignInBtn(),
                ),
              );
            },
            child:Icon(Icons.exit_to_app)
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').limit(1).where('id', isNotEqualTo:(_user.uid)).snapshots(),
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if ((snapshot.data?.docs.length ?? 0) > 0) {
                  return ListView.builder(
                   // padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) => buildItem(context, snapshot.data?.docs[index]),
                    itemCount: snapshot.data?.docs.length,
                    //controller: listScrollController,
                  );
                } else {
                  return Center(
                    child: Text("No users For chat"),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color:Colors.deepOrange,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}


Widget buildItem(BuildContext context,DocumentSnapshot? doc){
  return Flexible(
      child: Column(
        children: [
          Container(
            color: Colors.orange,
          width: MediaQuery.of(context).size.width,
           padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>Chat(peerId:doc?['id'],peerName: doc?['name'],)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: Text(doc?['name'])),
                  CircleAvatar(
                    radius:25,
                    backgroundImage:NetworkImage(doc?['photoUrl']),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
        
      ));

}


//User Infolist
/*Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),

              SizedBox(height: 16.0),
              Text(
                'Hello',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                _user.displayName!,
                style: TextStyle(
                  color:Colors.yellow,
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( ${_user.email!} )',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                'You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.8),
                    fontSize: 14,
                    letterSpacing: 0.2),
              ),
              SizedBox(height: 16.0),


              ElevatedButton(
                  onPressed: (){
             */