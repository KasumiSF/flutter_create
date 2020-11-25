import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class Picture_binary {

  static Future getImage(String url) async {
    //flutter资源路径，需要提前配置好，保证可用，路径的最后要标注文件名与后缀，例如file.db
    String assetPath;
//获取
    ByteData byteData = await rootBundle.load(assetPath);
//存储文件路径，请保证可用
    String savePath;
//创建路径
//    new Directory(dirname(path)).create(recursive: true);
//请确保没有文件已经存在
//    File file = new File(path);
//写文件
//    file.writeAsBytes(byteData.buffer.asInt8List(0));
  }


  /// 获取图片
  static Future getImage2(String url) async {
    Dio dio = Dio();
    // 注意：这里使用bytes
    dio.options.responseType = ResponseType.bytes;
    // 如果headers有东西，则添加
    Map<String, dynamic> headers = Map();
    dio.options.headers = headers;
    try {
      Response response = await dio.post(url);
      String codeId = '';
      // 获取response的headers信息，如果业务不需要可以去掉
      final List<String> imageCode = response.headers["code-id"];
      if (imageCode != null && imageCode.length > 0) {
        codeId = imageCode[0];
      }
      final Uint8List bytes = consolidateHttpClientResponseBytes(response.data);
      print("获取图像成功");
      print(codeId);
      return ;
//      return ImageCodeModel(codeId, bytes);
    } catch (e) {
      print("网络错误：" + e.toString());
      return await null;
    }
  }

  static consolidateHttpClientResponseBytes(data) {
    // response.contentLength is not trustworthy when GZIP is involved
    // or other cases where an intermediate transformer has been applied
    // to the stream.
    final List<List<int>> chunks = <List<int>>[];
    int contentLength = 0;
    chunks.add(data);
    contentLength += data.length;
    final Uint8List bytes = Uint8List(contentLength);
    int offset = 0;
    for (List<int> chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return bytes;
  }
}

