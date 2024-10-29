import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tab_Bar extends StatelessWidget {
  const Tab_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 15),
      child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                    'assets/images/Home.svg',
                  ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                    'assets/images/Laundry_tabbar.svg',
                  ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                    'assets/images/File.svg',
                  ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: SvgPicture.asset(
                    'assets/images/User.svg',
                  ),
                  ),
                ],
              ),
            ),
     
    );
  }
}
