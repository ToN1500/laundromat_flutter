import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildCard("Search\nWashing Machine", image: 'assets/images/button1.svg')),
              Expanded(child: _buildCard("Scan\nWashing Machine", image: 'assets/images/button2.svg')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, {required String image}) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 40),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
                    image,
                  ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 10,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
