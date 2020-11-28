

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class ReadFile{
  /**
   * 此方法返回本地文件地址
   */
  static Future<File> getLocalFile() async {
    // 获取文档目录的路径
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    final file = new File('$dir/服装款号备份数据.txt');
    print(file);
    return file;
  }

  static Future<File> getLocalFile2(String name) async {
    // 获取文档目录的路径
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    final file = new File('$dir/$name.pic');
    print(file);
    return file;
  }

  static Future<Image> getPicFile(String name) async {
    // 获取文档目录的路径
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    final file = new File('$dir/$name.pic');

    //获取文件内容
    String content = await file.readAsString();
    var outputAsUint8List = new Uint8List.fromList(content.codeUnits);

    //转成图片
    Image image = Image.memory(outputAsUint8List,
      fit: BoxFit.contain,
    );
    return image;
  }

  //将文件保存，并返回保存地址
  static Future<String> getAndSetPicFile2(String name,String content) async {
    // 获取文档目录的路径
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    final file = new File('$dir/$name.pic');

    //判断是否存在这个文件，如果有则删除
    bool f2Exists = await file.exists();
    if(f2Exists){
      file.delete();
    }

    //向这个文件写入新的内容
    IOSink slink2 = file.openWrite(mode: FileMode.append);
    slink2.write(content);
    slink2.close();

    print(file);

    //返回文件地址
    return file.path;
  }

  static deleteFile(String PPHH) async {
    File f2 = await ReadFile.getLocalFile2(PPHH);
    bool f2Exists = await f2.exists();
    if(f2Exists){
      f2.delete();
    }
  }

}