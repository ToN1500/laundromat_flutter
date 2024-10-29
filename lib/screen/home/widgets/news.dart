import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildCard("How to use",cardColor: Colors.blue,subtitle: "loremipsumloremipsumloremipsum",image: 'assets/images/Laundry.svg'),
        _buildCard("Coupon Discout",cardColor: Colors.green,subtitle: "loremipsumloremipsumloremipsum",image: 'assets/images/Money.svg'),
      ],
    );
  }

  Widget _buildCard(String title,
      {required Color cardColor, String? subtitle, String? image}) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [cardColor, cardColor.withOpacity(0.5)],
        ),
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Text(
                      subtitle!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 82,
            height: 82,
            decoration: BoxDecoration(),
            child: SvgPicture.asset(
                    image!,
                  ),
          ),
        ],
      ),
    );
  }
}
