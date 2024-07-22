import 'package:flutter/material.dart';
import 'package:laundromat_flutter/language_povider.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = languageProvider.isEnglish;
    var notify = [
      {
        "id": 1,
        "branch_th": 'สาขา แก้วหน้าม้า ต.ในเมือง อ.เมือง จ.ลำพูน',
        "branch_en":
            'Kaeo Na Ma Branch, Nai Mueang Subdistrict, Mueang District, Lamphun Province',
        "machine": 4,
        "alert": true
      },
    ];
    return Scaffold(
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notify.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue[50],
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                leading: Image.asset('assets/images/machine.png'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        
                        backgroundColor: Colors.blue[100],
                        title: Center(
                          child: Text(
                            isEnglish ? 'Notification' : 'แจ้งเตือน',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: isEnglish
                                        ? 'Machine ${notify[index]['machine']} at branch ${notify[index]['branch_en']} will expire in'
                                        : 'เครื่อง ${notify[index]['machine']} ที่สาขา ${notify[index]['branch_th']} จะหมดเวลาในอีก',
                                  ),
                                  TextSpan(
                                    text: isEnglish ? ' 1 minute' : ' 1 นาที',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20, top: 20),
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                            
                              children: [
                                Text(isEnglish ? 'Check notifications through this branch Line group.' : 'ดูการแจ้งเตือนผ่านกลุ่มไลน์สาขานี้'),
                                Image(
                                  height: 150,
                                  width: 150,
                                  image: AssetImage('images/QR_Code_Line.jpg'),
                                ),
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
                title: Text(
                  isEnglish
                      ? 'Machine ${notify[index]['machine']} at branch ${notify[index]['branch_en']}'
                      : 'เครื่อง ${notify[index]['machine']} ที่สาขา ${notify[index]['branch_th']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
