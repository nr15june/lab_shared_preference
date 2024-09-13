import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:labshared_pref/pages/home_page.dart';
import 'package:labshared_pref/pages/first_page.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  // Declare your variable for data
  String? myName;
  // Declare your function to load data
  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myName = prefs.getString("myName");
      print("My name is: $myName");
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple.shade200
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              // Show Your name
              Text(
                myName ?? "รอสักครู่",
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              // Button go to Home Page
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กลาง
                children: [
                  // ปุ่มซ้าย
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15), // กำหนดระยะห่างภายในปุ่ม
                      backgroundColor: Colors.amberAccent.shade700, // สีพื้นหลังของปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // มุมโค้งมนของปุ่ม
                      ),
                      elevation: 5, // เงาของปุ่ม
                      shadowColor: Colors.black.withOpacity(0.3), // สีของเงา
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // สีข้อความ
                        fontWeight: FontWeight.w500, // น้ำหนักข้อความ
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Button go to First Page
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15), // กำหนดระยะห่างภายในปุ่ม
                      backgroundColor: Colors.lightGreen.shade900, // สีพื้นหลังของปุ่ม
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // มุมโค้งมนของปุ่ม
                      ),
                      elevation: 5, // เงาของปุ่ม
                      shadowColor: Colors.black.withOpacity(0.3), // สีของเงา
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // สีข้อความ
                        fontWeight: FontWeight.w500, // น้ำหนักข้อความ
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
