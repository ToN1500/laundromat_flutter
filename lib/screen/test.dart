import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ข้อมูลทดสอบ
  List<Map<String, dynamic>> machines = [
    {
      "id": 1,
      "status": "สามารถใช้งานได้",
      "time_left": 0,
      "coins_inserted": 0,
      "alert": false
    },
    {
      "id": 2,
      "status": "สามารถใช้งานได้",
      "time_left": 0,
      "coins_inserted": 2,
      "alert": false
    },
    {
      "id": 3,
      "status": "ใช้งานอยู่",
      "time_left": 30,
      "coins_inserted": 3,
      "alert": false
    },
    {
      "id": 4,
      "status": "ใช้งานอยู่",
      "time_left": 1,
      "coins_inserted": 3,
      "alert": true
    },
    {
      "id": 5,
      "status": "ซ่อมบำรุง",
      "time_left": 0,
      "coins_inserted": 0,
      "alert": false
    },
  ];

  // ฟังก์ชันจำลองการใส่เหรียญและเริ่มเครื่องซักผ้า
  void insertCoin(int machineId) {
    setState(() {
      for (var machine in machines) {
        if (machine['id'] == machineId) {
          machine['coins_inserted'] += 1;
          if (machine['coins_inserted'] == 3) {
            // สมมุติว่า 3 เหรียญสามารถเริ่มเครื่องได้
            machine['status'] = 'ใช้งานอยู่';
            machine['time_left'] = 30; // สมมุติว่าเครื่องจะทำงาน 30 นาที
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laundromat'),
      ),
      body: ListView.builder(
        itemCount: machines.length,
        itemBuilder: (context, index) {
          var machine = machines[index];
          return ListTile(
            title: Text('Machine ${machine['id']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('เหรียญที่ใส่ไป: ${machine['coins_inserted']}'),
                Text('เวลาเหลือ: ${machine['time_left']} นาที'),
                Text('สถานะ: ${machine['status']}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: machine['status'] == 'ใช้งานอยู่' &&
                          machine['time_left'] <= 1
                      ? Icon(Icons.notifications_active)
                      : Container(),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: machine['time_left'] == 0
                        ? () {
                            setState(() {
                              insertCoin(machine['id']);
                            });
                          }
                        : null,
                    child: Text(machine['time_left'] == 0
                        ? 'ใส่เหรียญ'
                        : machine['status']),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        machine['time_left'] = 0.5;
                        machine['coins_inserted'] = 3;
                        machine['status'] = 'ใช้งานอยู่';
                      });
                    },
                    child: Text('ทดสอบเวลาเหลือน้อยกว่า 1 นาที'),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        machine['time_left'] = 0;
                        machine['coins_inserted'] = 0;
                        machine['status'] = 'สามารถใช้งานได้';
                      });
                    },
                    child: Text('ทดสอบเครื่องทำงานเสร็จ'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
