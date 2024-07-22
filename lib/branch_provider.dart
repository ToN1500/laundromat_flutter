import 'package:flutter/material.dart';

class BranchProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _branchs = [
    {
      'id': 1,
      'branch_name_th': 'สาขา แก้วหน้าม้า ต.ในเมือง อ.เมือง จ.ลำพูน',
      'branch_name_en':
          'Kaeo Na Ma Branch, Nai Mueang Subdistrict, Mueang District, Lamphun Province'
    },
    {
      'id': 2,
      'branch_name_th': 'สาขา ตากผ้า ต.ในเมือง อ.เมือง จ.เชียงใหม่',
      'branch_name_en':
          'Tak Pha Branch, Nai Mueang Subdistrict, Mueang District, Chiang Mai Province'
    },
  ];

  List<Map<String, dynamic>> get branchs => _branchs;
}
