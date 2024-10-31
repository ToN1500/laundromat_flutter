import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:laundromat_flutter/screen/forgotpassword_screen.dart';
import 'package:laundromat_flutter/screen/home_screen.dart';
import 'package:laundromat_flutter/screen/signup_screen.dart';
import 'package:laundromat_flutter/screen/widgets/passwordtextfield.dart';
import 'package:laundromat_flutter/screen/widgets/usernametextfield.dart';
import 'package:laundromat_flutter/service/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthService>();

    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 799,
          padding: const EdgeInsets.only(
            top: 80,
            left: 28,
            right: 28,
            bottom: 40,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          color: Color(0xFF2167A7),
                          fontSize: 24,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Sign in to continue',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 16,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 200,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20.30,
                        top: 20.79,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 159.41,
                            height: 159.41,
                            decoration: ShapeDecoration(
                              color: Color(0xFF2167A7),
                              shape: OvalBorder(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: ShapeDecoration(
                              color: Color(0xFF2167A7),
                              shape: OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: Color(0xFF00EFFF),
                                  blurRadius: 100,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36.14,
                        top: 36.63,
                        child: Container(
                          width: 126.73,
                          height: 126.73,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: SvgPicture.asset(
                            'assets/images/Laundry_login.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 183,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 90,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UsernameTextField(
                              hintText: 'กรุณากรอกชื่อผู้ใข้งาน',
                              // controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณากรอกชื่อผู้ใข้งาน';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            PasswordTextField(
                              hintText: 'กรุณากรอกรหัสผ่าน',
                              // controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'กรุณากรอกรหัสผ่าน';
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        height: 75,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                authService.login('test@test.com', 'password');
                              },
                              child: Container(
                                width: double.infinity,
                                height: 44,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                decoration: ShapeDecoration(
                                  color: Color(0xFF2267A8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0xFF9ED0FF),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Kanit',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotpasswordScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Forgot Password?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF2167A7),
                                    fontSize: 14,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: ShapeDecoration(
                            color:
                                Colors.black.withOpacity(0.30000001192092896),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Colors.black
                                    .withOpacity(0.30000001192092896),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'or',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.30000001192092896),
                          fontSize: 16,
                          fontFamily: 'Kanit',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: ShapeDecoration(
                            color:
                                Colors.black.withOpacity(0.30000001192092896),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Colors.black
                                    .withOpacity(0.30000001192092896),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Social Media Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/Google.svg',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/Facebook.svg',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/Line.svg',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/Apple logo.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xFF2167A7)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
