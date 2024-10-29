import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnotherService extends StatelessWidget {
  const AnotherService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(),
              ),
              const SizedBox(width: 10),
              Text(
                'Another service',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Divider(),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
                child: _buildCard('Soon',
                    image: 'assets/images/Scissors.svg')),
            Expanded(
                child: _buildCard('Soon',
                    image: 'assets/images/Scissors.svg'))
          ],
        ),
      ],
    );
  }

  Widget _buildCard(String title, {required String image}) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 20,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Row(
                children: [
                  Text("TESTTEST\nTESTTEST", style: TextStyle(color: Colors.black)),
                  SvgPicture.asset(
                    image,
                  ),
                ],
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
