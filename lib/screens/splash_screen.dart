import 'package:flutter/material.dart';
import 'package:task/screens/bottombar_screen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  List details = [
    {
      'about': "Invoice issued",
      "date": "24.08.2018",
    },
    {
      'about': "Payment date",
      "date": "31.09.2018",
    },
    {
      "about": "Description",
      "date": "Invoice nr.412313",
    }
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.04),
              const Text(
                "taupex",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: size.width * 0.64,
                height: size.height * 0.28,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Incredit Group",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.circle_outlined,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListView.builder(
                        itemCount: details.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    details[index]['about'],
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                                  ),
                                  Spacer(),
                                  Text(
                                    details[index]['date'],
                                    style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "This application allows you to pay bills ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                "at one place ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, BottombarScreen.routeName);
                },
                child: ButtonWidget("Facebook", Icons.facebook, Colors.blue.shade800),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, BottombarScreen.routeName);
                },
                child: ButtonWidget("Google", Icons.g_mobiledata_rounded, Colors.red.shade800),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, BottombarScreen.routeName);
                },
                child: ButtonWidget("E-mail", Icons.email, Colors.white),
              ),
              const Spacer(),
              Text(
                "By logging into account you are agreeing with our",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Terms condition and policy",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey.shade300,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget ButtonWidget(String name, IconData icon, Color backColor) {
    return Container(
      width: double.maxFinite,
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: backColor),
      child: Row(
        children: [
          Icon(icon, color: backColor == Colors.white ? Colors.blue : Colors.white),
          Expanded(
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                  color: backColor == Colors.white ? Colors.blue : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
