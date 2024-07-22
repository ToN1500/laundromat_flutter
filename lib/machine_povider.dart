import 'package:flutter/material.dart';

class MachinePovider extends ChangeNotifier {
 List<Map<String, dynamic>> _machines = [
    {
      "id": 1,
      "status": 1,
      "time_left": 0,
      "coins_inserted": 0,
      "alert": false
    },
    {
      "id": 2,
      "status": 1,
      "time_left": 0,
      "coins_inserted": 2,
      "alert": false
    },
    {
      "id": 3,
      "status": 2,
      "time_left": 30,
      "coins_inserted": 3,
      "alert": false
    },
    {
      "id": 4,
      "status": 2,
      "time_left": 1,
      "coins_inserted": 3,
      "alert": true
    },
    {
      "id": 5,
      "status": 3,
      "time_left": 0,
      "coins_inserted": 0,
      "alert": false
    },
  ];
  // status: 1 = สามารถใช้งานได้ , Available
  // status: 2 = ใช้งานอยู่ , In use
  // status: 3 = ซ่อมบำรุง , maintain

  List<Map<String, dynamic>> get machines => _machines;

  
}
