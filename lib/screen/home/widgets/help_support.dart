import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

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
                'Help support',
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
        _buildCard(
          "Report Repair\nWashing Machine",
          cardColor: Color(0xFFF16767),
          image: 'assets/images/washing_machine.svg',
        ),
      ],
    );
  }

  Widget _buildCard(String title, {required Color cardColor, String? image}) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
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
