import 'package:flutter/material.dart';
import 'package:laundromat_flutter/screen/Notification_page.dart';
import 'package:laundromat_flutter/screen/find_a_branch_page.dart';
import 'package:laundromat_flutter/screen/home_page.dart';
import 'package:laundromat_flutter/screen/report_screen.dart';
import 'package:provider/provider.dart';

import '../language_povider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.isEnglish;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[300]!, Colors.blue[500]!],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, right: 0, left: 0),
                    alignment: Alignment.topRight,
                    child: PopupMenuButton<String>(
                      onSelected: (String value) {
                        languageProvider.setLanguage(value == 'English');
                      },
                      itemBuilder: (BuildContext context) {
                        return {'ไทย', 'English'}.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                      },
                      icon: const Icon(Icons.language, color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/logo.png'),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                isEnglish ? 'Home' : 'หน้าหลัก',
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.pin_drop),
              title: Text(
                isEnglish ? 'Find a branch' : 'ค้นหาสาขา',
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text(
                isEnglish ? 'Report' : 'รายงานปัญหา',
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                isEnglish ? 'Settings' : 'ตั้งค่า',
                style: const TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text(
                isEnglish ? 'Logout' : 'ออกจากระบบ',
                style: const TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 4;
                });
              },
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
            ),
            Spacer(),
            // Social media icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    // Add Facebook link code here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.alternate_email_outlined),
                  onPressed: () {
                    // Add Twitter link code here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.facebook),
                  onPressed: () {
                    // Add Instagram link code here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[300]!, Colors.blue[500]!],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        title: Text('LANDNES'),
      ),
      body: Center(
        child: _selectedIndex == 0
            ? HomePage()
            : _selectedIndex == 1
                ? FindABranchPage()
                : _selectedIndex == 2
                    ? NotificationPage()
                    : null
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[400],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: isEnglish ? 'Home' : 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: isEnglish ? 'Find a branch' : 'ค้นหาสาขา',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: isEnglish ? 'Notification' : 'แจ้งเตือน',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
