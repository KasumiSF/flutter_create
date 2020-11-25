import 'package:flutter/material.dart';
import 'package:flutter_create/util/Material.dart';
import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/zcui/widgets/upload/shared_preferences_upload_image.dart';
import '../../zcui/event/zce_Toast.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';

String ReportAddPage_PicPath = "";
class ReportAddPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ReportAddPage();
  }
}

class _ReportAddPage extends State<ReportAddPage> {
  //用于保存列表用的所有Widget
  List<Widget> listWidget = new List();
  //货号
  String HH = "";
  //价格1
  String JG1 = "";
  //价格2
  String JG2 = "";

  @override
  void initState() {
    ReportAddPage_PicPath = null;
  } //照片地址




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: zfv_Appbar_topback(
        title: "新增款号",
        titleleft: 40,
        padding: EdgeInsets.only(left: 10, right: 10),
        rightw: GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left:20,right: 5),
                child: Text(
                  "保存",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              onTap: () async {
                //先判空
                if(HH.length == 0 ){
                  zce_Toast.toast(context, "必须输入货号");

                }

                print(ReportAddPage_PicPath+","+JG1+","+JG2);
                //先查看已保存的货号，然后再在此基础上增加新的货号
                String FS = await SharedPreferenceUtil.getString("所有货号");
                if(FS != null){
                  //判断当前货号是否有重复的
                  List<String> FSList = FS.split(',');
                  for(String s in FSList){
                    if(s == HH){
                      zce_Toast.toast(context, "该货号已保存，请勿重复添加");
                      return;
                    }
                  }
                  SharedPreferenceUtil.setString("所有货号", FS.toString()+","+HH);
                }else {
                  SharedPreferenceUtil.setString("所有货号", HH);
                }
                //保存该货号的相关信息
                SharedPreferenceUtil.setString(HH,ReportAddPage_PicPath+","+JG1+","+JG2+",0");
//                SharedPreferenceUtil.setString(HH,ReportAddPage_PicPath+","+JG1+","+JG2);


                print(ReportAddPage_PicPath+","+JG1+","+JG2+",0");
                zce_Toast.toast(context, "保存成功！");
                print(await SharedPreferenceUtil.getString("所有货号"));

                Navigator.maybePop(context);
              },
            ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.assignment,
                            color: Color(0xff8485A6),
                            size: 20,
                          ),
                          margin: EdgeInsets.only(right: 5),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "上传图片",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff8485A6),
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    height: 0.2,
                    color: Color(0xff8485A6),
                  ),
                  Container(
                    child: shared_preferences_upload_image(),
                  )
                ],
              ),
              Container(width: double.infinity, child: Text('输入货号')),
              TextField(
                controller: TextEditingController(text:HH),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) {

                  HH = text;
                },
              ),
              Container(width: double.infinity, child: Text('输入价格1(元)')),
              TextField(
                controller: TextEditingController(
                  text: JG1,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String v) {
                  JG1 = v;
                },
                onSubmitted: (String r) {
                  JG1 = r;
                },
              ),

              Container(width: double.infinity, child: Text('输入价格2(元)')),
              TextField(
                controller: TextEditingController(
                  text: JG2,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String v) {
                  JG2 = v;
                },
                onSubmitted: (String r) {
                  JG2 = r;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

//  List<Widget> ListWidget(int state) {
//    if (state == 0) {
//      listWidget.add(Container(
//        child: Row(
//          children: <Widget>[
//            Text("品牌"),
//            //添加新品牌
//            GestureDetector(
//                child: Icon(Icons.add_circle, color: Colors.blue),
//                onTap: (){
//                  ListWidget(0);
//                }
//            ),
//            Container(
//                color: SourceMaterials.color1,
//                width: ScreenUtil().setWidth(300),
//                child: TextField()),
//          ],
//        ),
//      ));
//      listWidget.add(Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Text("款号"),
//              //添加新款号
//              Icon(Icons.add_circle, color: Colors.blue),
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              Text("大小号"),
//              //添加大小码
//              Icon(Icons.add_circle, color: Colors.blue),
//            ],
//          ),
//          Text("单价"),
//          Text("件数"),
//        ],
//      ));
//      listWidget.add(
//        Row(
//          children: <Widget>[
//            Container(
//                color: SourceMaterials.color1,
//                width: ScreenUtil().setWidth(150),
//                child: TextField()),
//            Container(
//                color: SourceMaterials.color1,
//                width: ScreenUtil().setWidth(150),
//                child: TextField()),
//          ],
//        ),
//      );
//    }
//
//    return listWidget;
//  }

  add() {}
}
