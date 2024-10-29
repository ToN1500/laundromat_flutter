import 'package:flutter/material.dart';
import 'package:laundromat_flutter/screen/home/widgets/another_service.dart';
import 'package:laundromat_flutter/screen/home/widgets/help_support.dart';
import 'package:laundromat_flutter/screen/home/widgets/news.dart';
import 'package:laundromat_flutter/screen/home/widgets/header.dart';
import 'package:laundromat_flutter/screen/home/widgets/mainbutton.dart';
import 'package:laundromat_flutter/screen/home/widgets/status.dart';
import 'package:laundromat_flutter/screen/home/widgets/tab_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
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
          ),
        ),
      ),
      bottomNavigationBar: Tab_Bar(),
    );
  }
}
