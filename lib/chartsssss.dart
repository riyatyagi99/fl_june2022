/*
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';


class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: ChartsRepresentation(),
    );
  }
}

class ChartsRepresentation extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartsRepresentation({Key? key}) : super(key: key);

  @override
  ChartsRepresentationState createState() => ChartsRepresentationState();
}

class ChartsRepresentationState extends State<ChartsRepresentation> {

  List<_SalesData> data1 = [
    _SalesData('1', 1),
    _SalesData('2',8),
    _SalesData('3', 3),
    _SalesData('4', 7),
    _SalesData('5', 5),
    _SalesData('6', 2),
    _SalesData('7', 7),
    _SalesData('8', 9),
    _SalesData('Jan', 55),
    */
/* _SalesData('Jan', 10),
    _SalesData('Jan', 11),
    _SalesData('Jan', 12),
    _SalesData('Jan', 13),
    _SalesData('Jan', 14),
    _SalesData('Jan', 15),
    _SalesData('Jan', 16),
    _SalesData('Jan', 17),
    _SalesData('Jan', 18),
    _SalesData('Jan', 19),
    _SalesData('Jan', 20),
    _SalesData('Jan', 21),
    _SalesData('Jan', 22),
    _SalesData('Jan', 23),
    _SalesData('Jan', 24),
    _SalesData('Jan', 25),*//*

    _SalesData('Jan', 26),
    */
/* _SalesData('Jan', 27),
    _SalesData('Jan', 28),
    _SalesData('Jan', 29),
    _SalesData('Jan', 30),*//*

    //  _SalesData('Feb', 28),
    _SalesData('Feb', 35),
    //  _SalesData('Mar', 34),
    _SalesData('Mar', 45),
    // _SalesData('Apr', 32),
    _SalesData('Apr', 215),
    // _SalesData('May', 40),
    _SalesData('May', 55)
  ];
  List<_SalesData> data2 = [
    // _SalesData('Jan', 35),
    _SalesData('1', 11),
    _SalesData('2', 22),
    _SalesData('3', 33),
    _SalesData('4', 44),
    _SalesData('5', 55),
    _SalesData('6', 66),
    _SalesData('7', 77),

    _SalesData('Jan', 19),
    */
/* _SalesData('Jan', 10),
    _SalesData('Jan', 11),
    _SalesData('Jan', 12),
    _SalesData('Jan', 13),
    _SalesData('Jan', 14),
    _SalesData('Jan', 15),
    _SalesData('Jan', 16),
    _SalesData('Jan', 17),
    _SalesData('Jan', 18),
    _SalesData('Jan', 19),
    _SalesData('Jan', 20),
    _SalesData('Jan', 21),
    _SalesData('Jan', 22),
    _SalesData('Jan', 23),
    _SalesData('Jan', 24),
    _SalesData('Jan', 25),*//*

    _SalesData('Jan', 36),
    */
/* _SalesData('Jan', 27),
    _SalesData('Jan', 28),
    _SalesData('Jan', 29),
    _SalesData('Jan', 30),*//*

    //  _SalesData('Feb', 28),
    _SalesData('Feb', 40),
    //  _SalesData('Mar', 34),
    _SalesData('Mar', 56),
    // _SalesData('Apr', 32),
    _SalesData('Apr', 15),
    // _SalesData('May', 40),
    _SalesData('May', 35)
  ];

  List<_SalesData> data = [
    // _SalesData('Jan', 35),
    _SalesData('1', 1),
    _SalesData('2', 2),
    _SalesData('3', 3),
    _SalesData('4', 4),
    _SalesData('5', 5),
    _SalesData('6', 6),
    _SalesData('7', 7),
    _SalesData('8', 8),
    _SalesData('Jan', 9),
    */
/* _SalesData('Jan', 10),
    _SalesData('Jan', 11),
    _SalesData('Jan', 12),
    _SalesData('Jan', 13),
    _SalesData('Jan', 14),
    _SalesData('Jan', 15),
    _SalesData('Jan', 16),
    _SalesData('Jan', 17),
    _SalesData('Jan', 18),
    _SalesData('Jan', 19),
    _SalesData('Jan', 20),
    _SalesData('Jan', 21),
    _SalesData('Jan', 22),
    _SalesData('Jan', 23),
    _SalesData('Jan', 24),
    _SalesData('Jan', 25),*//*

    _SalesData('Jan', 26),
    */
/* _SalesData('Jan', 27),
    _SalesData('Jan', 28),
    _SalesData('Jan', 29),
    _SalesData('Jan', 30),*//*

    //  _SalesData('Feb', 28),
    _SalesData('Feb', 30),
    //  _SalesData('Mar', 34),
    _SalesData('Mar', 36),
    // _SalesData('Apr', 32),
    _SalesData('Apr', 25),
    // _SalesData('May', 40),
    _SalesData('May', 15)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              //Initialize the chart widget
              commonDividedLine(chartName: 'Cartesion Chart'),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis Line'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (SalesData sales, ) => sales.year,
                        yValueMapper: (SalesData sales, ) => sales.sales,
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true)),
                  ]),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis StepLine'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    StepLineSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (SalesData sales, ) => sales.year,
                        yValueMapper: (SalesData sales, ) => sales.sales,
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis Area'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    AreaSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (SalesData sales, ) => sales.year,
                        yValueMapper: (SalesData sales, ) => sales.sales,
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  /// Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis Spline'),
                  /// Enable legend
                  legend: Legend(isVisible: true),
                  /// Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    SplineSeries<_SalesData, String>(
                        color: Colors.orange,
                        dataSource: data,
                        xValueMapper: (SalesData sales, ) => sales.year,
                        yValueMapper: (SalesData sales, ) => sales.sales,
                        name: 'Sales',
                        /// Enable data label ex:- sales
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        ///it provide dash b/w line
                        dashArray: <double>[5,5],
                        ///cardinal properties on spline
                        splineType: SplineType.cardinal,
                        ///tension on spline
                        cardinalSplineTension: .9)
                  ]),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  /// Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis Spline'),
                  /// Enable legend
                  legend: Legend(isVisible: true),
                  /// Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    BarSeries<_SalesData, String>(
                      color: Colors.orange,
                      dataSource: data,
                      xValueMapper: (SalesData sales, ) => sales.year,
                      yValueMapper: (SalesData sales, ) => sales.sales,
                      name: 'Sales',
                      /// Enable data label ex:- sales
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    )
                  ]),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  /// Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis Spline'),
                  /// Enable legend
                  legend: Legend(isVisible: true),
                  /// Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <ChartSeries<_SalesData, String>>[
                    StackedBarSeries<_SalesData, String>(
                      color: Colors.orange,
                      dataSource: data,
                      xValueMapper: (SalesData sales, ) => sales.year,
                      yValueMapper: (SalesData sales, ) => sales.sales,
                      name: 'Sales',
                      /// Enable data label ex:- sales
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                    StackedBarSeries<_SalesData, String>(
                      color: Colors.red,
                      dataSource: data1,
                      xValueMapper: (SalesData sales, ) => sales.year,
                      yValueMapper: (SalesData sales, ) => sales.sales,
                      name: 'Sales',
                      /// Enable data label ex:- sales
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                    StackedBarSeries<_SalesData, String>(
                      color: Colors.green,
                      dataSource: data2,
                      xValueMapper: (SalesData sales, ) => sales.year,
                      yValueMapper: (SalesData sales, ) => sales.sales,
                      name: 'Sales',
                      /// Enable data label ex:- sales
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                    ),
                  ]),
              commonDividedLine(chartName: 'Circular Chart'),
              SfCircularChart(
                series: <CircularSeries<_SalesData, String>>[
                  PieSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (SalesData sales, ) => sales.year,
                    yValueMapper: (SalesData sales, ) => sales.sales,
                    name: 'Sales',
                    /// Enable data label ex:- sales
                    dataLabelSettings: DataLabelSettings(isVisible: true),

                  )
                ],
                /// Chart title
                title: ChartTitle(text: 'Half yearly sales analysis Spline'),
                /// Enable legend
                legend: Legend(isVisible: true),
                /// Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
              SfCircularChart(
                series: <CircularSeries<_SalesData, String>>[
                  DoughnutSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (SalesData sales, ) => sales.year,
                    yValueMapper: (SalesData sales, ) => sales.sales,
                    name: 'Sales',
                    /// Enable data label ex:- sales
                    dataLabelSettings: DataLabelSettings(isVisible: true),

                  )
                ],
                /// Chart title
                title: ChartTitle(text: 'Half yearly sales analysis Spline'),
                /// Enable legend
                legend: Legend(isVisible: true),
                /// Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
              SfCircularChart(
                series: <CircularSeries<_SalesData, String>>[
                  RadialBarSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (SalesData sales, ) => sales.year,
                    yValueMapper: (SalesData sales, ) => sales.sales,
                    name: 'Sales',
                    /// Enable data label ex:- sales
                    dataLabelSettings: DataLabelSettings(isVisible: true),

                  )
                ],
                /// Chart title
                title: ChartTitle(text: 'Half yearly sales analysis Spline'),
                /// Enable legend
                legend: Legend(isVisible: true),
                /// Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
              commonDividedLine(chartName: 'Spark Chart'),
              SfSparkLineChart(
                  marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),

                  //Enable data label
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  //Enable the trackball
                  trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap
                  ),
                  data: <double>[
                    10,6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10
                  ]

              ),
              SfSparkAreaChart(
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                //Enable data label
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                //Enable the trackball
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap
                ),
                axisLineWidth: 0,
                data: <double>[
                  5, 6, 5, 7, 4, 3, 9, 5, 6, 5, 7, 8, 4, 5, 3, 4, 11, 10, 2, 12, 4, 7, 6, 8
                ],
                highPointColor: Colors.red,
                lowPointColor: Colors.red,
                firstPointColor: Colors.orange,
                lastPointColor: Colors.orange,
                borderColor: Colors.red.withOpacity(0.8),
                borderWidth: 2,

              ),
              SfSparkBarChart(

                data: <double>[
                  10, 6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10
                ],
                highPointColor: Colors.red,
                lowPointColor: Colors.green,
                firstPointColor: Colors.orange,
                lastPointColor: Colors.orange,
              ),
              */
/*Padding(
                padding: const EdgeInsets.all(8.0),
                //Initialize the spark charts widget
                child: SfSparkLineChart.custom(
                  //Enable the trackball
                  trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                  //Enable marker
                  marker: SparkChartMarker(
                      displayMode: SparkChartMarkerDisplayMode.all),
                  //Enable data label
                  labelDisplayMode: SparkChartLabelDisplayMode.all,
                  xValueMapper: (int index) => data[index].year,
                  yValueMapper: (int index) => data[index].sales,
                  dataCount: 5,
                ),
              ),*//*

              commonDividedLine(chartName: 'Pyramid Chart'),
              SfPyramidChart(

                // Chart title
                title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series:
                PyramidSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (SalesData sales, ) => sales.year,
                    yValueMapper: (SalesData sales, ) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ),
              commonDividedLine(chartName: 'Funnel Chart'),
              SfFunnelChart(

                // Chart title
                title: ChartTitle(text: 'Half yearly sales analysis '),
                // Enable legend
                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series:
                FunnelSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (SalesData sales, ) => sales.year,
                    yValueMapper: (SalesData sales, ) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ),
            ]),
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _SalesDataMonth {
  _SalesDataMonth(this.year, this.sales);

  final String year;
  final double sales;
}

class _SalesDataDay {
  _SalesDataDay(this.year, this.sales);

  final String year;
  final double sales;
}

Widget commonDividedLine({required String chartName}){
  return  Padding(
    padding: const EdgeInsets.fromLTRB(10,10.0,10.0,10.0),
    child: Center(child: Column(
      children: [
        Divider(color: Colors.black,height: 5,thickness: 5,),
        SizedBox(height: 8.0,),
        Text(chartName,style:TextStyle(fontSize: 20,fontWeight: FontWeight.w700) ,),
      ],
    )),
  );
}


*/
