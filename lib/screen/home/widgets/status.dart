import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  late Timer _timer;
  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // อัปเดตเวลาใหม่ทุกวินาที
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now(); // อัปเดตเวลาปัจจุบัน
      });
    });
  }

  @override
  void dispose() {
    // ยกเลิก Timer เมื่อ widget ถูกลบออก
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // จัดรูปแบบเวลา
    final String formattedTime = DateFormat('HH:mm:ss').format(_now); // เวลา
    final String formattedDay = DateFormat('EEEE').format(_now);       // วันในสัปดาห์
    final String formattedDate = DateFormat('dd MMM yyyy').format(_now); // วันที่

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 72,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    formattedTime,
                    style: TextStyle(
                      color: Color(0xFF2167A7),
                      fontSize: 48,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              formattedDay,
                              style: TextStyle(
                                color: Color(0xFF2167A7),
                                fontSize: 14,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                color: Color(0xFF2167A7),
                                fontSize: 10,
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: SvgPicture.asset(
                    'assets/images/Sun.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
