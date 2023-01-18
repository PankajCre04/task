import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../const_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool upComing = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.34,
                padding: const EdgeInsets.symmetric(vertical: 43, horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.account_circle_rounded),
                        ),
                        Text(
                          "Ready to pay bills?",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You have 12 unpaid bills this month",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        "Pay all bills at once",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white.withOpacity(0.4),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  upComing = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: upComing ? Colors.white : Colors.white.withOpacity(0.0),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.calendar_month,
                                          size: 17,
                                          color: upComing ? Colors.blue : Colors.white,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " Upcoming(12)",
                                        style: TextStyle(color: upComing ? Colors.blue : Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  upComing = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  //color: upComing ? Colors.white.withOpacity(0.4) : Colors.white,
                                  color: upComing ? Colors.white.withOpacity(0.0) : Colors.white,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.watch_later_outlined,
                                          size: 17,
                                          color: upComing ? Colors.white : Colors.blue,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " Later this month(5)",
                                        style: TextStyle(color: upComing ? Colors.white : Colors.blue, fontWeight: FontWeight.w500, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.29,
              child: Container(
                width: size.width * 0.9,
                height: 190,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Overdue",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            unPaidBilldetails[0]['imagePath'],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            unPaidBilldetails[0]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            unPaidBilldetails[0]['duedates'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                        const Spacer(),
                        Text(
                          "${unPaidBilldetails[0]['price']}\$",
                          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
                        ),
                        Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value) {
                              print(value); //selected value
                            })
                      ],
                    ),
                    Divider(),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        SizedBox(
                          width: 35,
                          height: 35,
                          child: Image.asset(
                            unPaidBilldetails[1]['imagePath'],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            unPaidBilldetails[1]['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            unPaidBilldetails[1]['duedates'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                        const Spacer(),
                        Text(
                          "${unPaidBilldetails[1]['price']}\$",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                        Radio(
                            value: "radio value",
                            groupValue: "group value",
                            onChanged: (value) {
                              print(value); //selected value
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.54,
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.37,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Due this week",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                      child: ListView.builder(
                          itemCount: unPaidBilldetails.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          //    physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Slidable(
                              key: UniqueKey(),
                              endActionPane: const ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: null,
                                    backgroundColor: Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.monetization_on_rounded,
                                    label: 'Pay',
                                  ),
                                ],
                              ),
                              child: Column(
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
                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text(
                                          unPaidBilldetails[index]['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          unPaidBilldetails[index]['duedates'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ]),
                                      const Spacer(),
                                      Text(
                                        "${unPaidBilldetails[index]['price']}\$",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) {
                                            print(value); //selected value
                                          })
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    color: Colors.grey.shade300,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
