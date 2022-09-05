import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_june2022/provider/counter.dart';
import 'package:flutter_june2022/provider/multiprovider.dart';
import 'package:flutter_june2022/redux_state_management/redux.dart';
import 'package:flutter_june2022/signin_chat/google_signin.dart';
import 'package:flutter_june2022/signin_chat/user_list_chat.dart';
import 'package:flutter_june2022/stream_future_builder/stream_builder.dart';
import 'package:flutter_june2022/video_audio_call/audio_video_call.dart';
import 'package:provider/provider.dart';

import 'downloading_file/file_download.dart';
import 'google_mapss/google_mapssss.dart';
import 'local_auth/LocalAuth.dart';
import 'extrass/bottomsheet_scrollable.dart';
import 'cubit/weather_cubit.dart';
import 'cubit/weather_repo.dart';
import 'cubit/weather_view.dart';
import 'extension__methods/extension_custom_methods.dart';
import 'extrass/audio_palyer.dart';
import 'extrass/responsive.dart';
import 'firebase/cloud_firestore/cloud_fs_send_data.dart';
import 'firebase/firebase_operations.dart';
import 'media_related/image_cropper.dart';
import 'method_channels/battery_level.dart';
import 'mobx/counter.dart';
import 'package:redux/redux.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  User? firebaseUser = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //change Notifier
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              MultiProvider(
                                providers: [
                                  ChangeNotifierProvider(
                                      create: (BuildContext context) =>
                                          Counter1()),
                                  ChangeNotifierProvider(
                                      create: (BuildContext context) =>
                                          Counter2()),
                                ],
                                child: MultiProviderPkg(),
                              )
                          ));


                      /* Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context)=> ChangeNotifierProvider(
                            create: (BuildContext context)=>Counter1(),
                            child: MultiProviderPkg(),)
                          ));*/

                      //value notifier
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context)=> ChangeNotifierProvider<ValueNotifier<int>>(
                            create: (BuildContext context)=>ValueNotifier<int>(0),
                            child: MultiProviderPkg(),)
                          ));*/

                    },
                    child: const Text("Provider Pkg")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              BlocProvider(
                                create: (context) =>
                                    WeatherCubit(FakeWeatherRepository()),
                                child: WeatherView(),
                              ),
                          ));
                    },
                    child: const Text("weather")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StreamDemo()));
                    },
                    child: const Text("streams")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomExtnWidgets()));
                    },
                    child: const Text("extensions")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FBOperations()));
                    },
                    child: const Text("FBOperations")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CounterWithMobX()));
                    },
                    child: const Text("MobX")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AudioPlayerDemo()));
                    },
                    child: const Text("AudioPlayer")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BatterLevelMC()));
                    },
                    child: const Text("MC")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Extra()));
                    },
                    child: const Text("Bottomsheet")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResponsiveDesign()));
                    },
                    child: const Text("Responsive")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FingerprintPage()));
                    },
                    child: const Text("LocaalAuth")),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              ImageCropperr(title: "Image Cropping")));
                    },
                    child: const Text("Image cropper")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DownloadingFile()));
                    },
                    child: const Text("DownloadingFile")),

                ElevatedButton(
                    onPressed: () {
                      if (firebaseUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoogleSignInBtn()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoogleSignInBtn()));
                      }
                    },
                    child: const Text("Sign-In and Chat")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoogleMapsss()));
                    },
                    child: const Text("Google Maps")),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AudioVideoCall()));
                    },
                    child: const Text("Communication")),
                ElevatedButton(
                    onPressed: () {
                      final store = Store<int>(counterReducer, initialState: 0);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReduxState(store: store,)));
                    },
                    child: const Text("Reduxxx")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
