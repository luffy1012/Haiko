import 'package:intl/intl.dart';

void main() {
  DateTime date = DateTime.now();
  final _monthFormatter = DateFormat('d MMM y');

  List<DateTime> dates = List<DateTime>();
  for (int i = 1; i <= 5; i++) {
    dates.add(DateTime.now().add(Duration(days: i)));
  }
  dates.forEach((element) {
    print(_monthFormatter.format(element));
  });
}

/*
import 'dart:convert';
enum demo{val1,val2,val3}
void main() {

  List<Map> demo=[{'index':1,'name':'pritam','bool':true},
                 {'index':2,'name':'Zoro','bool':false}];

  print(demo);
  String str=json.encode(demo);
  print("\n");
  Map val=Map();
  val['index']=3;
  val['name']="Parab";
  val['bool']=true;

  List<Map> demo2=new List<Map>.from(json.decode(str));
  demo2.add(val);
  print(demo2);
  print(json.encode(demo2));
}

 */
