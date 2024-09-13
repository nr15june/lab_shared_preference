import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:labshared_pref/pages/another_page.dart';
import 'package:labshared_pref/pages/first_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        title: const Text("Home Page"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amberAccent.shade700,
      ),
      backgroundColor: Colors.amber.shade50,
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
            // Button go to Another Page
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnotherPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // กำหนดระยะห่างภายในปุ่ม
                backgroundColor:
                    Colors.deepPurple.shade400, // สีพื้นหลังของปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // มุมโค้งมนของปุ่ม
                ),
                elevation: 5, // เงาของปุ่ม
                shadowColor: Colors.black.withOpacity(0.3), // สีของเงา
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white, // สีข้อความ
                  fontWeight: FontWeight.w500, // น้ำหนักข้อความ
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
