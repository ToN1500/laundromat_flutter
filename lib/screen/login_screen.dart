import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _isEnglish = false; // ตัวแปรเพื่อเก็บสถานะภาษา
  bool _obscureText = true; // ตัวแปรเพื่อจัดการสถานะการแสดงรหัสผ่าน

  @override
  Widget build(BuildContext context) {
    // กำหนดสีพื้นหลังของ gradient
    final backgroundGradient = LinearGradient(
      colors: [Colors.blue[200]!, Colors.blue[500]!],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundGradient, // ใช้ gradient เดียวกัน
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 0, right: 10, left: 10),
              alignment: Alignment.topRight,
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    _isEnglish = value == 'English';
                  });
                },
                itemBuilder: (BuildContext context) {
                  return {'ไทย', 'English'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                icon: Icon(Icons.language, color: Colors.white),
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          _isEnglish ? 'Please Login' : 'โปรดเข้าสู่ระบบ',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Colors.white),
                            labelText:
                                _isEnglish ? 'Username' : 'ผู้ใช้งานระบบ',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white.withOpacity(0.1),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: TextFormField(
                          controller: _password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.password, color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            labelText: _isEnglish ? 'Password' : 'รหัสผ่าน',
                            labelStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white.withOpacity(0.1),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Text(
                          style: GoogleFonts.prompt(
                              fontSize: 15, color: Colors.blue),
                          _isEnglish ? 'Login' : 'เข้าสู่ระบบ',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
