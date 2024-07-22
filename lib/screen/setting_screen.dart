import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../language_povider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.isEnglish;
    return Scaffold(
      appBar: AppBar(
        title:  Text(isEnglish ? 'Setting' : 'ตั้งค่า'),
      ),
      body:  Center(
        child: Text(isEnglish ? 'Setting Screen' : 'หน้าตั้งค่า'),
      ),
    );
  }
}