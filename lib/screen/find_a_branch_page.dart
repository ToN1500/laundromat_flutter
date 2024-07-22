import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../language_povider.dart';

class FindABranchPage extends StatefulWidget {
  const FindABranchPage({super.key});

  @override
  State<FindABranchPage> createState() => _FindABranchPageState();
}

class _FindABranchPageState extends State<FindABranchPage> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.isEnglish;
    return Scaffold(
      body: Center(
        child : Text(isEnglish ? 'Find A Branch Page' : 'หน้าค้นหาสาขา'),
      )
    );
  }
}