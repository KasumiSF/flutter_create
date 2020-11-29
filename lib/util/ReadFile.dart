import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_create/util/Utils.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class ReadFile {
  /**
   * 此方法返回本地文件地址
   */
  static Future<File> getLocalFile() async {
    // 获取文档目录的路径
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    final file = new File(Utils.Path+'服装款号备份数据.txt');
    print(file);
    return file;
  }

//  static Future<File> getLocalFile2(String name) async {
//    // 获取文档目录的路径
//    Directory appDocDir = await getExternalStorageDirectory();
//    String dir = appDocDir.path;
//    final file = new File(Utils.Path+'/$name.pic');
//    print(file);
//    return file;
//  }

  static Future<Image> getPicFile(String name) async {
    Image image = new Image.asset("assets/images/tupian.png");
    try {
      print(name);
      //转成图片
      image = Image.file(
        File(name),
        fit: BoxFit.contain,
      );
    } catch (e) {
      print(e);
    }

    return image;
  }

  //将文件保存，并返回保存地址
  static Future<String> getAndSetPicFile2(String name, String PicPath) async {
    // 获取文档目录的路径

//    List list = PicPath.split(".");
    //随机数生成类
    var rng = new Random();
    String dandom = rng.nextInt(10000).toString();
    Uint8List u8l = await File(PicPath).readAsBytes();
    //文件名拼接随机数
    name = name+'-'+dandom;
    String filePath = '';
    try{


      final result = await ImageGallerySaver.saveImage(u8l,
          name: '.' + name); //这个是核心的保存图片的插件
      print('======================================');
      print(PicPath);
      print('======================================');
      print(result);
      print('======================================');
      filePath = result['filePath'].toString();
      print('======================================');
      List lastString = filePath.split('.');
      filePath =
          Utils.Path + '.' + name + '.' + lastString[lastString.length - 1];
      print(filePath);
    }catch (e){
      print(e);
    }


    //返回文件地址
    return filePath;
  }

  static deleteFile(String oldPath) async {

    if(oldPath != ''){
      File file =
      new File(oldPath);
      print(file.path);
      bool f2Exists = await file.exists();
      if (f2Exists) {
        file.delete();
        print('删除成功');
      }
    }
  }
}
