import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../language_povider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.isEnglish;
    return Scaffold(
      appBar: AppBar(
        title:  Text(isEnglish ? 'Report' : 'รายงาน'),
      ),
      body:  Center(
        child: Text(isEnglish ? 'Report Screen' : 'หน้ารายงาน'),
      ),
    );
  }
}