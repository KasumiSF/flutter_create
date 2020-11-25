import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/report_add_page.dart';
import 'package:flutter_create/util/Material.dart';
import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/zcui/widgets/upload/shared_preferences_upload_image.dart';
import '../../zcui/event/zce_Toast.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
/**
 * 查看大图页面
 * 以及价格页面？
 */

class ReportInfoPage extends StatefulWidget {
  String huohao;

  ReportInfoPage({@required this.huohao});

  @override
  State<StatefulWidget> createState() {
    return _ReportInfoPage(huohao: huohao);
  }
}

class _ReportInfoPage extends State<ReportInfoPage> {

  String huohao;
  _ReportInfoPage({@required this.huohao});
  //用于保存列表用的所有Widget
  List<Widget> listWidget = new List();

  //货号
  String HH = "";

  //价格1
  String JG1 = "";

  //价格2
  String JG2 = "";
  //销售状态
  String state = "0";



  @override
  void initState() {
    init();
  }


  init() async {
    HH = huohao;
//      SharedPreferenceUtil.setString(HH,"456");
    String FS = await SharedPreferenceUtil.getString(HH);
    if (FS != null) {
      List<String> FSList = FS.split(',');
      setState(() {
//          JG1.text = FS.toString();
        ReportAddPage_PicPath = FSList[0];
        JG1 = FSList[1];
        JG2 = FSList[2];
        if(FSList.length>3){
          state = FSList[3];
        }

      });
    }
  }

  @override
  Widget build(BuildContext context) {
//    ScreenUtil.init(context);

    /**
     * 1、按添加按钮增加一行输入框
     * 2、每一行数据是4个输入框分别表示：品牌、编号、单价、件数
     * 3、用一个list保存所有每一行的数据
     * 4、保存后，将品牌和编号分别保存成list，便于出售时，选择下拉框
     * 5、保存分为内存数据库和json文件两种形式
     *
     * 特殊：之后追加上传到云
     *    可以读取json文件，保存最新的数据到本地
     *    打开软件时，将数据保存到内存数据库
     *    打印出什么形式的账单？
     */

//    ListWidget(0);

    return Scaffold(
      appBar: zfv_Appbar_topback(
        title: "修改款号",
        titleleft: 40,
        padding: EdgeInsets.only(left: 10, right: 10),
        rightw: GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 5),
            child: Text(
              "保存",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          onTap: () async {
            //先判空
            if (HH.length == 0) {
              zce_Toast.toast(context, "必须输入货号");
            }

            print(ReportAddPage_PicPath + "," + JG1 + "," + JG2);
            //先查看已保存的货号，然后再在此基础上增加新的货号
            String FS = await SharedPreferenceUtil.getString("所有货号");
            if (FS != null) {
              //判断当前货号是否有重复的
              List<String> FSList = FS.split(',');


//              //判断
//              int type = 0;
//              for (String s in FSList) {
//                if (s == HH) {
//                  zce_Toast.toast(context, "该货号已保存，请勿重复添加");
//                  return;
//                }
//              }
              if(huohao != HH){
                //需要删除huohao里的
                print(huohao+'??'+HH);
                SharedPreferenceUtil.setString("所有货号", FS.toString() + "," + HH);

              }
            } else {
              SharedPreferenceUtil.setString("所有货号", HH);
            }
            //保存该货号的相关信息
            SharedPreferenceUtil.setString(
                HH, ReportAddPage_PicPath + "," + JG1 + "," + JG2+","+state);

            print(ReportAddPage_PicPath + "," + JG1 + "," + JG2+","+state);
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
                controller: TextEditingController(text: HH),
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
