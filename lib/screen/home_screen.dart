import 'package:flutter/material.dart';
import 'package:laundromat_flutter/screen/home/widgets/another_service.dart';
import 'package:laundromat_flutter/screen/home/widgets/header.dart';
import 'package:laundromat_flutter/screen/home/widgets/help_support.dart';
import 'package:laundromat_flutter/screen/home/widgets/mainbutton.dart';
import 'package:laundromat_flutter/screen/home/widgets/news.dart';
import 'package:laundromat_flutter/screen/home/widgets/status.dart';
import 'package:laundromat_flutter/screen/home/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  int _currentIndex = 0;

  final _pages = [
    _buildMainContent(),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
  ];

  // แยกส่วนของ main content ออกมา
  static Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Header(),
          Status(),
          Mainbutton(),
          News(),
          AnotherService(),
          HelpSupport(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            _pages[_currentIndex],
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: CustomBottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
