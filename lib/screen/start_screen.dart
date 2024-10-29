import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laundromat_flutter/screen/login_screen.dart';
import 'package:laundromat_flutter/screen/signup_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 667,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 80),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      left: 18.44,
                      top: 17.73,
                      child: Opacity(
                        opacity: 0.10,
                        child: Container(
                          width: 163.83,
                          height: 163.83,
                          decoration: ShapeDecoration(
                            color: Color(0xFF2167A7),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5.67,
                      top: 5.67,
                      child: Opacity(
                        opacity: 0.10,
                        child: Container(
                          width: 188.65,
                          height: 188.65,
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
                      left: 34.04,
                      top: 29.08,
                      child: Container(
                        width: 139.72,
                        height: 139.72,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(),
                        child: SvgPicture.asset(
                          'assets/images/Detergent.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Hello!',
                style: TextStyle(
                  color: Color(0xFF2167A7),
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Lorem ipsum dolor sit amet consectetur. Adipiscing et amet volutpat lectus. Aliquam fringilla netus eu tempus parturient. Turpis sit in purus aliquam. Tellus pellentesque habitant id dictumst curabitur.',
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 106,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    const SizedBox(height: 18),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: ShapeDecoration(
                          color: Colors.black.withOpacity(0.05000000074505806),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF2167A7)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'SIGNUP',
                              style: TextStyle(
                                color: Color(0xFF2167A7),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
