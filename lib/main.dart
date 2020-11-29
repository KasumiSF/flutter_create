import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/ClothingNumber.dart';
import 'package:flutter_create/page/report/report_list_page.dart';
import 'package:flutter_create/page/report/test/MyHomePage.dart';
import 'package:flutter_create/page/topic/topic_create_page.dart';
import 'package:flutter_create/util/DbUtils.dart';
import 'package:flutter_create/util/PictureSizeChange.dart';
import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/util/Utils.dart';
import 'package:flutter_create/zcui/event/dialog/zce_ShowDialog.dart';
import 'util/ReadFile.dart';
import 'page/topic/topic_list_page.dart';
import 'page/report/report_index_page.dart';

import 'package:fluwx/fluwx.dart' as fluwx;
import 'dart:convert' as convert;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '服装款式',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
class IndexPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPage_view();
  }

}

class _IndexPage_view extends State<IndexPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    requestPermission();
    print(123);
    _initFluwx();


  }

  _initFluwx() async {
    await fluwx.register(
        appId: "wx96a28fba31ee0f22",
        doOnAndroid: true,
        doOnIOS: true,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");

    //初始化数据库
    await DbUtils.getInstance().openDb("默认");
    //初始化基础参数
    await Utils.init();

  }

  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title:Text("服装款式"),),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Container(height: 30,
                    child: Row(
                      children: <Widget>[
                        Container(width: 6,color: Colors.blue,margin: EdgeInsets.only(right: 15),),
                        Text("服装款式",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color(0xffeeeeee),
              margin: EdgeInsets.only(top: 10,bottom: 10),
            ),
            Container(
              padding: EdgeInsets.only(left:22 ),
              child: Row(
                children: <Widget>[
//                  GestureDetector(
//                    child: Container(width: 70,height: 70,
//                    child: Center(child: Text("账单管理",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
//                    decoration: new BoxDecoration(
//                      color: Color(0xff4AACF8),
//                      borderRadius: BorderRadius.all(Radius.circular(80)),
//                    boxShadow: <BoxShadow>[ //设置阴影
//                      new BoxShadow(
//                        color: Color(0xFF888888), //阴影颜色
//                        //blurRadius: 8.0,
//                        offset: Offset(0.0, 3.0),
//                        // color: Color.fromRGBO(16, 20, 188, 1.0),
//                        blurRadius: 7.0,
//                        spreadRadius: -3.0, //阴影大小
//                      ),],
//                    ),),
//                    onTap: (){
//                      Navigator.push(context, new MaterialPageRoute(
//                      builder: (BuildContext context) =>
//                          TopicListPage()));
//                    },
//                  ),
                  GestureDetector(
                    child: Container(width: 70,height: 70,
//                      margin: EdgeInsets.only(left: 25),
                      child: Center(child: Text("服装款式",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
                      decoration: new BoxDecoration(
                        color: Color(0xff4AACF8),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: <BoxShadow>[ //设置阴影
                      new BoxShadow(
                        color: Color(0xFF888888), //阴影颜色
                        //blurRadius: 8.0,
                        offset: Offset(0.0, 3.0),
                        // color: Color.fromRGBO(16, 20, 188, 1.0),
                        blurRadius: 7.0,
                        spreadRadius: -3.0, //阴影大小
                      ),],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ReportListPage()));
                    },
                  ),



                  GestureDetector(
                    child: Container(width: 70,height: 70,
                      margin: EdgeInsets.only(left: 25),
                      child: Center(child: Text("保存数据",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
                      decoration: new BoxDecoration(
                        color: Color(0xff4AACF8),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[ //设置阴影
                          new BoxShadow(
                            color: Color(0xFF888888), //阴影颜色
                            //blurRadius: 8.0,
                            offset: Offset(0.0, 3.0),
                            // color: Color.fromRGBO(16, 20, 188, 1.0),
                            blurRadius: 7.0,
                            spreadRadius: -3.0, //阴影大小
                          ),],
                      ),),
                    onTap: (){
                      _saveValue();
//                      Navigator.push(context, new MaterialPageRoute(
//                          builder: (BuildContext context) =>
//                              MyHomePage()));
                    },
                  ),

                  GestureDetector(
                    child: Container(width: 70,height: 70,
                      margin: EdgeInsets.only(left: 25),
                      child: Center(child: Text("读取数据",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
                      decoration: new BoxDecoration(
                        color: Color(0xff4AACF8),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[ //设置阴影
                          new BoxShadow(
                            color: Color(0xFF888888), //阴影颜色
                            //blurRadius: 8.0,
                            offset: Offset(0.0, 3.0),
                            // color: Color.fromRGBO(16, 20, 188, 1.0),
                            blurRadius: 7.0,
                            spreadRadius: -3.0, //阴影大小
                          ),],
                      ),),
                    onTap: () async {
//                      await DbUtils.dbUtils.deleteItem(ClothingNumber());
                      _readContent();
//                      Navigator.push(context, new MaterialPageRoute(
//                          builder: (BuildContext context) =>
//                              MyHomePage()));
                    },
                  ),
                  GestureDetector(
                    child: Container(width: 70,height: 70,
                      margin: EdgeInsets.only(left: 25),
                      child: Center(child: Text("数据转存",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
                      decoration: new BoxDecoration(
                        color: Color(0xff4AACF8),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[ //设置阴影
                          new BoxShadow(
                            color: Color(0xFF888888), //阴影颜色
                            //blurRadius: 8.0,
                            offset: Offset(0.0, 3.0),
                            // color: Color.fromRGBO(16, 20, 188, 1.0),
                            blurRadius: 7.0,
                            spreadRadius: -3.0, //阴影大小
                          ),],
                      ),),
                    onTap: () async {

                      //读取数据
                      List<ClothingNumber> listClothingNumber = [];
                      listClothingNumber =await DbUtils.dbUtils.queryItems(ClothingNumber());

                      if(listClothingNumber != null){
                        for (int i = 0 ; i< listClothingNumber.length ; i++) {
                          ClothingNumber cn =listClothingNumber[i];
                          Map map = cn.toJson2();


                          //判断转存的数据是否是本地类型的
                          RegExp regExp = new RegExp('('+Utils.Path+')');
                            bool isABC = regExp.hasMatch(map['PicPath']);
                            if(isABC){
                              continue;
                            }


                          print('转存ing...');
                          //保存的照片地址
                          String newPicPath = await ReadFile.getAndSetPicFile2(map['PPHH'].trim(),map['PicPath']);
                          map['PicPath'] = newPicPath;
//                          map['Pic'] = '01231233435345';

                          ClothingNumber clothingNumber = ClothingNumber.fromJson(map);
                          print(map);
                          await DbUtils.dbUtils.deleteItem(clothingNumber,key:"PPHH",value:map['PPHH']);
                          await DbUtils.dbUtils.insertItem(clothingNumber);

                        }
                      }
                      zce_ShowDialog().zfe_SuccessDialog_show(context, '转存成功！');

                    },
                  ),
                ],
              ),
            ),
//            GestureDetector(
//              child: Container(width: 70,height: 70,
//                margin: EdgeInsets.only(left: 25),
//                child: Center(child: Text("数据删除",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
//                decoration: new BoxDecoration(
//                  color: Color(0xff4AACF8),
//                  borderRadius: BorderRadius.all(Radius.circular(50)),
//                  boxShadow: <BoxShadow>[ //设置阴影
//                    new BoxShadow(
//                      color: Color(0xFF888888), //阴影颜色
//                      //blurRadius: 8.0,
//                      offset: Offset(0.0, 3.0),
//                      // color: Color.fromRGBO(16, 20, 188, 1.0),
//                      blurRadius: 7.0,
//                      spreadRadius: -3.0, //阴影大小
//                    ),],
//                ),),
//              onTap: () async {
//                //清空数据
//                      await DbUtils.dbUtils.deleteItem(ClothingNumber());
//                //旧数据转存
//                //读取数据
//
//              },
//            ),
          ],
        ),
      ),
    );
  }

  void _saveValue() async {
    try {

      List<ClothingNumber> listClothingNumber = [];
      listClothingNumber =await DbUtils.dbUtils.queryItems(ClothingNumber());

      if(listClothingNumber == null || listClothingNumber.length <1 ){
        zce_ShowDialog().zfe_SuccessDialog_No_show(context, '没有数据可以保存！');
        return;
      }

      File f = await ReadFile.getLocalFile();

      bool fExists = await f.exists();
      if(fExists){
        f.delete();
      }
      IOSink slink = f.openWrite(mode: FileMode.append);




      slink.write('[');
      if(listClothingNumber != null){
        for (int i = 0 ; i< listClothingNumber.length ; i++) {
          ClothingNumber cn =listClothingNumber[i];
          Map map = cn.toJson2();
          slink.write(convert.jsonEncode(map));

          if(i < listClothingNumber.length -1){
            slink.write(',');
          }
        }
      }

      slink.write(']');

      zce_ShowDialog().zfe_SuccessDialog_show(context, '保存成功！');
      // await fs.writeAsString('$value');

      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }



//  Future<String> init() async {
//
//
//    return FS+';'+data;
//  }

  void _readContent() async {
    File file = await ReadFile.getLocalFile();
    // 从文件中读取变量作为字符串，一次全部读完存在内存里面
    String contents = await file.readAsString();
    if(contents == null || contents.length == 0){
      return ;
    }

    List listMap = json.decode(contents);
    for(dynamic map in listMap){
      print(map);

      await DbUtils.dbUtils.insertItem(ClothingNumber.fromJson(map));
    }

    

    zce_ShowDialog().zfe_SuccessDialog_show(context, '读取成功！');

//    await SharedPreferenceUtil.setString("所有货号",contents.substring(startIndex));
  }

//  Future requestPermission() async {
//
//    // 申请权限
//
//    Map<Permission, PermissionStatus> permissions =
//
//    await PermissionHandler().requestPermissions([Permission.storage]);
//
//    // 申请结果
//
//    PermissionStatus permission =
//
//    await PermissionHandler().checkPermissionStatus(Permission.storage);
//
//    if (permission == PermissionStatus.granted) {
//
////      Fluttertoast.showToast(msg: "权限申请通过");
//
//    } else {
//
////      Fluttertoast.showToast(msg: "权限申请被拒绝");
//
//    }
//
//  }
}
