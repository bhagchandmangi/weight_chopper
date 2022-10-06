import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartSyncFusion extends StatefulWidget {
  const LineChartSyncFusion({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _LineChartSyncFusionState createState() => _LineChartSyncFusionState();
}

class _LineChartSyncFusionState extends State<LineChartSyncFusion> {
  List<SalesData>? _chartData;
  // TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    // _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SfCartesianChart(
        enableAxisAnimation: true,
        enableSideBySideSeriesPlacement: true,

        // title: ChartTitle(text: 'Yearly sales analysis'),
        legend: Legend(isVisible: false),
        // tooltipBehavior: _tooltipBehavior,
        series: <SplineSeries>[
          SplineSeries<SalesData, double>(
              name: 'Sales',
              dataSource: _chartData!,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
              color: Colors.blue,
              width: 1,
              opacity: 1,
              isVisible: true,
              // sortingOrder: SortingOrder.ascending,
              xAxisName: "mar",

              // dashArray: <double>[5, 5],
              splineType: SplineType.natural,
              cardinalSplineTension: 0.9)
        ],
        primaryXAxis: NumericAxis(
          labelFormat: '{value} mar',
          labelAlignment: LabelAlignment.center,
          majorGridLines: const MajorGridLines(width: 0),
          labelStyle: GoogleFonts.openSans(
            fontSize: 10,
          ),
          // anchorRangeToVisiblePoints: true,
          // decimalPlaces: 4,
          // axisLine: AxisLine(color: Colors.red),
          interval: 2,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          anchorRangeToVisiblePoints: false,
          interval: 40,
          axisLine: const AxisLine(color: Colors.transparent),
          labelStyle: GoogleFonts.openSans(
            fontSize: 10,
          ),
          // labelFormat: '{value}M',
          // numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
        ),
      ),
    );
  }

  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(6, 95),
      SalesData(8, 95),
      SalesData(10, 50),
      SalesData(10, 50),
      SalesData(12, 0),
      // SalesData(12, 10),
      // SalesData(12, 5),
      // SalesData(12, 40),
      // SalesData(4, 30),
      // SalesData(10, 40),
      // SalesData(12, 50),
      // SalesData(14, 60),
      // SalesData(16, 70),
      // SalesData(18, 80),
      // SalesData(20, 90),
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
