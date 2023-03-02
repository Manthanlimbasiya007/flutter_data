import 'package:flutter/material.dart';
import 'package:flutter_data/screen/counter/model/stdmodel.dart';

class Homeprovider extends ChangeNotifier
{
  List<stdModel> l1=[];

  void addData(stdModel s1)
  {
     l1.add(s1);
     notifyListeners();
  }
  void deleteData(int index)
  {
     l1.removeAt(index);
     notifyListeners();
  }
  void updateData(int index,stdModel s1)
  {
    l1[index] = s1;
    notifyListeners();
  }
}
