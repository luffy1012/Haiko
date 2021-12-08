import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHandler {
  static SharedPreferences pref;

  static addSP(Map val) async {
    //  pref = await SharedPreferences.getInstance();
    // print(val);

    List<Map> list = await getSp();
    list.add(val);
    // print("Value To be Added ====> $val");
    // print("After Addition ====> $list");
    pref.setString('booking', json.encode(list).toString());
    print("Value Stored\n");
    //print(pref.getString('booking'));
  }

  static Future<List<Map>> getSp() async {
    pref = await SharedPreferences.getInstance();
    List<Map> list = List();
    List<Map> listVal = List();
    String stringValue = pref.getString('booking');
    // print(stringValue);
    if (stringValue == null) {
      Map map = Map();
      map['tokenid'] = 111;
      map['date'] = DateTime(2021, 3, 10).toString();
      map['slot'] = '09:00 AM';
      list.add(map);
      //   print(list);
      listVal = list;
    } else {
      listVal = new List<Map>.from(json.decode(stringValue));
    }
    // print("LIST RETRIEVED =====> $listVal \n");
    return listVal;
  }
}
