import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BatterLevelMC extends StatefulWidget {
  const BatterLevelMC({Key? key}) : super(key: key);

  @override
  State<BatterLevelMC> createState() => _BatterLevelMCState();
}

class _BatterLevelMCState extends State<BatterLevelMC> {


  String battery_level="Waiting";
  static const battery_channel= MethodChannel('june_learnings/battery');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(battery_level,style: TextStyle(fontSize: 20),),
            ElevatedButton(
                onPressed: getBatteryLevel,
                child:const Text("Get battery %")),
          ],
        ),
      ),
    );
  }

  Future getBatteryLevel() async{

    final arguments={'name':'Ria  ki battery is'};

    String batt_perc=await battery_channel.invokeMethod('getBatteryLevel', arguments);
    setState(()=> battery_level='$batt_perc ');
  }
}
