import 'package:flutter/material.dart';
import 'package:laundromat_flutter/screen/home_screen.dart';
import 'package:provider/provider.dart';

import '../language_povider.dart';
import '../machine_povider.dart';
import 'find_a_branch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final machinePovider = Provider.of<MachinePovider>(context);
    final isEnglish = languageProvider.isEnglish;
    final machines = machinePovider.machines;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.pin_drop,
                ),
                SizedBox(width: 5),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            index: 1,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      isEnglish
                          ? 'Kaeo Na Ma Branch, Nai Mueang Subdistrict, Mueang District, Lamphun Province'
                          : 'สาขา แก้วหน้าม้า ต.ในเมือง อ.เมือง จ.ลำพูน',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.visible,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Consumer<MachinePovider>(
              builder: (context, machineProvider, child) {
                double screenwidth = MediaQuery.of(context).size.width;
                int crossAxisCount = screenwidth > 1200
                    ? 4
                    : screenwidth > 800
                        ? 3
                        : 2;
                double childAspectRatio = screenwidth > 800 ? 3 / 2 : 1;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // จำนวนคอลัมน์
                    childAspectRatio:
                        childAspectRatio, // อัตราส่วนระหว่างความกว้างและความสูง
                    mainAxisSpacing: 10.0, // ระยะห่างระหว่างแถว
                    crossAxisSpacing: 10.0, // ระยะห่างระหว่างคอลัมน์
                    mainAxisExtent: 250.0,
                  ),
                  itemCount: machineProvider.machines.length,
                  itemBuilder: (context, index) {
                    final machine = machines[index];

                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.blue[100],
                              title: Center(
                                child: Text(
                                  isEnglish
                                      ? 'Machine : ${machine['id']}'
                                      : 'เครื่อง : ${machine['id']}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        isEnglish ? 'Status : ' : 'สถานะ : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isEnglish
                                            ? machine['status'] == 1
                                                ? 'Available'
                                                : machine['status'] == 2
                                                    ? 'In use'
                                                    : 'maintain'
                                            : machine['status'] == 1
                                                ? 'สามารถใช้งานได้'
                                                : machine['status'] == 2
                                                    ? 'ใช้งานอยู่'
                                                    : 'ซ่อมบำรุง',
                                        style: TextStyle(
                                          color: machine['status'] == 1
                                              ? Colors.green
                                              : machine['status'] == 2
                                                  ? Colors.yellow
                                                  : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        isEnglish
                                            ? 'Time left : '
                                            : 'เหลือเวลา : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        isEnglish
                                            ? '${machine['time_left']} minutes'
                                            : '${machine['time_left']} นาที',
                                        style: TextStyle(
                                          color: machine['time_left'] > 1
                                              ? Colors.green
                                              : machine['time_left'] <= 1 &&
                                                      machine['time_left'] > 0
                                                  ? Colors.yellow
                                                  : Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        isEnglish
                                            ? 'Coins inserted : '
                                            : 'เหรียญที่ใส่ไป : ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${machine['coins_inserted']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  if (machine['status'] == 2 &&
                                      machine['time_left'] <= 1)
                                    Row(
                                      children: [
                                        Icon(Icons.notifications_active),
                                        SizedBox(width: 5),
                                        Text('แจ้งเตือนไปยังกลุ่มไลน์สาขานี้แล้ว',style: TextStyle(color: Colors.green),),
                                      ],
                                    ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // ปิด Dialog
                                  },
                                  child: Text('ปิด'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[300]!, Colors.blue[500]!],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/machine.png',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            Text(
                              isEnglish
                                  ? 'Machine : ${machine['id']}'
                                  : 'เครื่อง : ${machine['id']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: machine['status'] == 1
                                      ? Colors.green
                                      : machine['status'] == 2
                                          ? Colors.yellow
                                          : Colors.red,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  isEnglish
                                      ? machine['status'] == 1
                                          ? 'Available'
                                          : machine['status'] == 2
                                              ? 'In use'
                                              : 'maintain'
                                      : machine['status'] == 1
                                          ? 'สามารถใช้งานได้'
                                          : machine['status'] == 2
                                              ? 'ใช้งานอยู่'
                                              : 'ซ่อมบำรุง',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                machine['status'] == 2 &&
                                        machine['time_left'] <= 1
                                    ? Icon(Icons.notifications_active)
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
