
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Utils {
  static String Path = "";

  static Future<void> init(){
    //初始化地址
    getPath();
  }

  static Future<void> getPath() async {
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    Path = dir.split('Android')[0]+'服装款式/';
    print(Path);
  }

}