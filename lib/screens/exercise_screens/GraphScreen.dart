import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:weightchopper_flutter_project/CustomWidgets/SizeConfig.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final List<Feature> features = [
    Feature(
      title: "Flutter",
      color: Colors.blue,
      data: [0.9, 1, 1.2, 0.8, 0.6, 0.3],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MySize.size200,
      child: LineGraph(
        fontFamily: "OpenSans",
        features: features,
        graphOpacity: 0.2,
        size: const Size(420, 450),
        labelX: const [
          '6 mar',
          '8 mar',
          '10 mar',
          '12 mar',
          '14 mar',
        ],
        labelY: const [
          '76',
          '80',
          '84',
          '88',
          '90',
        ],
        showDescription: false,
        graphColor: Colors.black87,
      ),
    );
  }
}
