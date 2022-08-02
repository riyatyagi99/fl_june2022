import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AudioPlayerDemo extends StatefulWidget {
  const AudioPlayerDemo({Key? key}) : super(key: key);

  @override
  State<AudioPlayerDemo> createState() => _AudioPlayerDemoState();
}

class _AudioPlayerDemoState extends State<AudioPlayerDemo> {
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime= "00:00";
  AudioCache cache=AudioCache();

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: <Widget>[

            Center(child: Image.asset("assets/images/mic.jpeg", fit: BoxFit.fitHeight,)),

            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: 80,

              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7, left: MediaQuery.of(context).size.width*0.1),

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
              ),


              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: (){
                      if(isPlaying){
                        _audioPlayer.pause();

                        setState(() {
                          isPlaying = false;
                        });
                      }else{
                        _audioPlayer.resume();

                        setState(() {
                          isPlaying = true;
                        });
                      }

                    },
                  )  ,

                  SizedBox(width: 16,),

                  IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: (){
                      _audioPlayer.stop();

                      setState(() {
                        isPlaying = false;
                      });

                    },
                  ),

                  Text(currentTime, style: TextStyle(fontWeight: FontWeight.w700),),

                  Text(" | "),

                  Text(completeTime, style: TextStyle(fontWeight: FontWeight.w300),),



                ],
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.audiotrack),
        onPressed: () async{

          FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);

          if (result != null) {
         //   File filePath = File(result.files.single.path!);
            //print("$filePath    jhgfdfghjkhgfdfghjnmjhgf");
            //final status=await _audioPlayer.play(filePath.absolute.path.toString()));
            String url="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
            var status=await _audioPlayer.setSourceUrl(url);

            /*if(status == 1){
              setState(() {
                isPlaying = true;
              });
            }*/

          } else {
            // User canceled the picker
          }

        },
      ),
    );
  }
}

