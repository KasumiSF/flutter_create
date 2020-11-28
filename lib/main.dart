import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/ClothingNumber.dart';
import 'package:flutter_create/page/report/report_list_page.dart';
import 'package:flutter_create/page/report/test/MyHomePage.dart';
import 'package:flutter_create/page/topic/topic_create_page.dart';
import 'package:flutter_create/util/DbUtils.dart';
import 'package:flutter_create/util/PictureSizeChange.dart';
import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/zcui/event/dialog/zce_ShowDialog.dart';
import 'package:path_provider/path_provider.dart';
import 'page/topic/topic_list_page.dart';
import 'page/report/report_index_page.dart';
import 'page/report/xxx.dart';
import 'package:fluwx/fluwx.dart' as fluwx;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '服装款式',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
//                      _saveValue();
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
//                      _readContent();
//                      Navigator.push(context, new MaterialPageRoute(
//                          builder: (BuildContext context) =>
//                              MyHomePage()));
                    },
                  ),
                ],
              ),
            ),
//            GestureDetector(
//              child: Container(width: 70,height: 70,
//                margin: EdgeInsets.only(left: 25),
//                child: Center(child: Text("其他",style: TextStyle(color: Color(0xffffffff),fontSize: 15),)),
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
//              onTap: (){
//                Navigator.push(context, new MaterialPageRoute(
//                    builder: (BuildContext context) =>
//                        PictureSizeChange()));
//              },
//            ),
          ],
        ),
      ),
    );
  }

  void _saveValue() async {
    try {
      File f = await _getLocalFile();
      IOSink slink = f.openWrite(mode: FileMode.append);

      String content = await init();
      slink.write(content);
      // await fs.writeAsString('$value');

      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }

  /**
   * 此方法返回本地文件地址
   */
  Future<File> _getLocalFile() async {
    // 获取文档目录的路径
    Directory appDocDir = await getExternalStorageDirectory();
    String dir = appDocDir.path;
    final file = new File('$dir/服装款号备份数据.txt');
    print(file);
    return file;
  }

  Future<String> init() async {

    String FS = await SharedPreferenceUtil.getString("所有货号");
    //保存所有货号对应的数据
    String data = '';

    print(FS);
    List list = [];
    if (FS != null) {
      //判断当前货号是否有重复的
      setState(() {
        if (FS.contains(',')) {
          list = FS.split(',');
        }

        if (list.length == 0) {
          list.add(FS);
        }
      });

      for (String s in list) {
        data += await SharedPreferenceUtil.getString(s)+';';

      }
    }
    print(FS+';'+data);
    zce_ShowDialog().zfe_SuccessDialog_show(context, '保存成功！');
    return FS+';'+data;
  }

  void _readContent() async {
    File file = await _getLocalFile();
    // 从文件中读取变量作为字符串，一次全部读完存在内存里面
    String contents = await file.readAsString();
    if(contents == null || contents.length == 0){
      return ;
    }

    contents = contents.substring(0,contents.length-1);
    print(contents);
    if(contents.contains(';')){
      List list = contents.split(';');
      List HHList = [];

      //获取货号
      if(list[0].contains(',')){
        HHList = list[0].split(',');
      }else {
        HHList.add(list[0]);
      }
      print('货号：'+HHList.toString());
      print('数据：'+list.toString());
      await SharedPreferenceUtil.setString("所有货号",list[0]);
      //根据货号保存
      for(int i = 1; i<list.length ; i++){
        print(HHList[i-1]+'????'+list[i]);
        await SharedPreferenceUtil.setString(HHList[i-1],list[i]);
      }
    }
    print(contents);

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
