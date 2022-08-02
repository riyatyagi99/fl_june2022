import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class DownloadingFile extends StatefulWidget {
  const DownloadingFile({Key? key}) : super(key: key);

  @override
  State<DownloadingFile> createState() => _DownloadingFileState();
}

class _DownloadingFileState extends State<DownloadingFile> {


  int progress = 0;
  ReceivePort _receivePort = ReceivePort();
  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");
    ///sending the data
    sendPort!.send([id, status, progress]);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");
    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      print("$progress      resume download progress");

    });
    FlutterDownloader.registerCallback(downloadingCallback);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
                onTap: () async{
                  var link="https://www.abposters.com/harry-potter/";
                  String fileName = link!.split('/').last;
                  _download1(link);
                },
                child: Text("Download")),
          ],
        ),

      ),
    );
  }


  void _download1(String url) async {
    final status = await Permission.storage.request();

    try{
      if (status.isGranted) {
        String name = url.split("/").last;    //getApplicationSupportDirectory

        final dir =Platform.isAndroid? await getExternalStorageDirectory():await getApplicationSupportDirectory(); //From path_provider package
        var localPath = dir!.path + name;
        print("$localPath  111111111111111");
        final savedDir = Directory(localPath);
        print("$savedDir  saved dir pathhh");
        final taskid = await FlutterDownloader.enqueue(
          url: url,
          fileName: "$name",
          savedDir: dir.path,
          showNotification: true,
          openFileFromNotification: true,
          saveInPublicStorage: true,
        );
        print(taskid);
        print("$progress  jhvhjb");
        // FlutterDownloader.open(taskId: taskid ?? '');

        if (Platform.isIOS){
          bool waitTask = true;
          while(waitTask) {
            String query = "SELECT * FROM task WHERE task_id='" + taskid! + "'";
            var _tasks = await FlutterDownloader.loadTasksWithRawQuery(query: query);
            String taskStatus = _tasks![0].status.toString();
            int taskProgress = _tasks[0].progress;
            if(taskStatus == "DownloadTaskStatus(3)" && taskProgress == 100){
              waitTask = false;
            }
          }
          await FlutterDownloader.open(taskId: taskid!);
        }


      } else {
        print('Permission Denied');
        if (await Permission.storage.request().isGranted) {
          // Either the permission was already granted before or the user just granted it.
        }
      }
    }catch(e){
      throw Exception('$e eeeeeeeeeeeeeeeeeee');
    }

  }


}
