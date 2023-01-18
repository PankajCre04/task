import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:task/const_data.dart';

class SpendScreen extends StatefulWidget {
  const SpendScreen({Key? key}) : super(key: key);
  static const String routeName = "/spendScreen";
  @override
  State<SpendScreen> createState() => _SpendScreenState();
}

class _SpendScreenState extends State<SpendScreen> {
  String? selectedValue;
  List<String> monthList = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  final List<Feature> features = [
    Feature(
      title: "Flutter",
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Container(
            color: Colors.blue.shade900,
            width: double.infinity,
            height: size.height * 0.12,
            padding: EdgeInsets.only(top: size.height * 0.05),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.099),
                    child: const Text(
                      "How much I spend",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "How much I spend",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                'Month',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: monthList
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: size.height * 0.36,
                    color: Colors.white,
                    child: graph(size),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "September bills",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: unPaidBilldetails.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Image.asset(
                                      unPaidBilldetails[index]['imagePath'],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    unPaidBilldetails[index]['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${unPaidBilldetails[index]['price']}\$",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Divider(
                                color: Colors.grey.shade300,
                              ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget graph(Size size) {
    return LineGraph(
      features: features,
      size: Size(size.width, size.height * 0.36),
      labelX: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      labelY: const ['25%', '45%', '65%', '75%', '85%', '100%'],
      showDescription: false,
      graphColor: Colors.black87,
    );
    // return Container(
    //   child: LineChart(
    //     LineChartData(
    //       maxX: 8,
    //       maxY: 8,
    //       minX: 0,
    //       minY: 0,
    //       lineBarsData: [
    //         LineChartBarData(
    //           spots: [
    //             const FlSpot(0, 0),
    //             const FlSpot(5, 5),
    //             const FlSpot(7, 6),
    //             const FlSpot(8, 4),
    //           ],
    //           isCurved: true,
    //           barWidth: 0,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
