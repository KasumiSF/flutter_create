import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/report_add_page.dart';
import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
import 'package:flutter_create/zcui/event/dialog/zce_ShowDialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../zcui/event/zce_Toast.dart';
import 'provide/report_list_provide.dart';
import 'report_info_page.dart';

class ReportListPage extends StatefulWidget {
  final int status;

  ReportListPage({this.status, Key key})
      : super(key: key); //:assert(status!=null)
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReportList_view();
  }
}

class ReportList_view extends State<ReportListPage>
    with AutomaticKeepAliveClientMixin {
  static ReportListProvide reportListProvide = new ReportListProvide();

//  var providers = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
//    providers = Providers()
//      ..provide(Provider.function(
//          (context) => ReportListProvide(status: widget.status)));
  }

  List FSList = [];
//  int FSListlength = 0;

  //正在读取数据标识符
  bool FSBool = true;

  init() async {

    String FS = await SharedPreferenceUtil.getString("所有货号");
    setState(() {
      FSList = [];
//      FSListlength = 0;
      FSBool = false;
    });

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
      print(list);
      for (String s in list) {
        String data = await SharedPreferenceUtil.getString(s);
        if (data != null && data.contains(',')) {
          List dataList = data.split(',');
          setState(() {
            if(dataList.length>3){
              FSList.add({
                "title": s,
                "money": dataList[1] ,
                "money2": dataList[2] ,
                "imagepath": dataList[0],
                "state":dataList[3]
              });
            }else {
              FSList.add({
                "title": s,
                "money": dataList[1] ,
                "money2": dataList[2] ,
                "imagepath": dataList[0],
                "state":'0'
              });
            }

          });
        }
      }
    }
    setState(() {
//      FSListlength = FSList.length;
    });
    print(FSList);
    //保存该货号的相关信息
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);

    return CustomScrollView(physics: ScrollPhysics(), slivers: <Widget>[
      FSBool
      ? SliverToBoxAdapter(
          child: Center(
          child: Text("正在加载！", style: TextStyle(fontSize: 16)),
        ))
      : FSList.length > 0
          ? SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return GestureDetector(
                  child: slidable_card(
                    FSList[index],
                    index,
                  ),
                  onTap: () {
                    //设置要展示的图片
                    ReportAddPage_PicPath = FSList[index]['imagepath'];
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ReportInfoPage(huohao: FSList[index]['title'])));
                  },
                );
              },
              childCount: FSList.length,
            ))
          : SliverToBoxAdapter(
              child: Center(
                child: Text("暂无数据！", style: TextStyle(fontSize: 16)),
              ),
            )
    ]);

//    return Container(
//      child: FSList.length > 0
//          ? SliverList(
//              delegate: SliverChildBuilderDelegate(
//              (BuildContext context, int index) {
//                return GestureDetector(
//                  child: slidable_card(FSList[index], index),
//                  onTap: () {
//                    Navigator.push(
//                        context,
//                        new MaterialPageRoute(
//                            builder: (BuildContext context) =>
//                                ReportInfoPage()));
//                  },
//                );
//              },
//              childCount: FSList.length,
//            ))
//          : Container(
//              child: Center(
//                child: Text("暂无数据！", style: TextStyle(fontSize: 16)),
//              ),
//            ),
//    );
  }

  SlidableController slidableController = new SlidableController();

  Widget slidable_card(
    data,
    int index,
  ) {
    TextStyle textStyle_label = TextStyle(
        fontSize: 16, color: Color(0xff4E526F), fontWeight: FontWeight.w400);

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: new Slidable(
        key: new Key(data['title']),
        delegate: new SlidableBehindDelegate(),
        actionExtentRatio: 0.22,
        controller: slidableController,
        child: new Container(
          color: Colors.white,
          child: info_card(data),
        ),
//        slideToDismissDelegate: new SlideToDismissDrawerDelegate(
//          dismissThresholds: <SlideActionType, double>{
//            SlideActionType.primary: 1.0
//          },
//        ),
        closeOnScroll: true,
        secondaryActions: <Widget>[
//          new Container(
//            child: Column(
//              children: <Widget>[
//                Expanded(
//                  child: Container(),
//                  flex: 1,
//                ),
//                Container(height: 56,width:56,
//                  margin: EdgeInsets.only(left: 8),
//                  child: Icon(Icons.refresh,color: Colors.blue,size: 32,),
//                  decoration: new BoxDecoration(
//                    color: Color(0xffffffff),
//                    borderRadius: BorderRadius.all(Radius.circular(50)),
//                      boxShadow: <BoxShadow>[ //设置阴影
//                        new BoxShadow(
//                          color: Color(0xFFBDBDBD), //阴影颜色
//                          //blurRadius: 8.0,
//                          offset: Offset(0.0, 3.0),
//                          // color: Color.fromRGBO(16, 20, 188, 1.0),
//                          blurRadius: 10.0,
//                          spreadRadius: -3.0, //阴影大小
//                        ),]
//                  ),
//                ),
//                Container(height: 10,),
//                Container(
//                  child: Text("更新",style: textStyle_label,),),
//                Expanded(
//                  child: Container(),
//                  flex: 1,
//                ),
//              ],
//            ),
//          ),

          GestureDetector(
            child: new Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Container(
                    height: 56,
                    width: 56,
                    margin: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.rotate_left,
                      color: Colors.blue,
                      size: 30,
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[
                          //设置阴影
                          new BoxShadow(
                            color: Color(0xFFBDBDBD), //阴影颜色
                            //blurRadius: 8.0,
                            offset: Offset(0.0, 3.0),
                            // color: Color.fromRGBO(16, 20, 188, 1.0),
                            blurRadius: 10.0,
                            spreadRadius: -3.0, //阴影大小
                          ),
                        ]),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "已售完",
                      style: textStyle_label,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            onTap: () async {
              setState(() {

                if(data["state"] =='1'){
                  data["state"] = '0';
                }else {
                  data["state"] = '1';
                }
              });

              SharedPreferenceUtil.setString(data['title'],data['imagepath']+","+data['money']+","+data['money2']+","+data["state"]);

            },
          ),
          GestureDetector(
            child: new Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Container(
                    height: 56,
                    width: 56,
                    margin: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.restore_from_trash,
                      color: Colors.blue,
                      size: 30,
                    ),
                    decoration: new BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[
                          //设置阴影
                          new BoxShadow(
                            color: Color(0xFFBDBDBD), //阴影颜色
                            //blurRadius: 8.0,
                            offset: Offset(0.0, 3.0),
                            // color: Color.fromRGBO(16, 20, 188, 1.0),
                            blurRadius: 10.0,
                            spreadRadius: -3.0, //阴影大小
                          ),
                        ]),
                  ),
                  Container(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "删除",
                      style: textStyle_label,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            onTap: () async {
//              myProvide.RemoveItem(index);

              //删除内容，再删除标题
              bool remove = await SharedPreferenceUtil.remove(data['title']);
              print("删除" + data['title'] + remove.toString());
              setState(() {
                FSList.remove(index);
//                FSListlength -=1;
              init();
              });

              String FS = await SharedPreferenceUtil.getString("所有货号");
              if(FS != null){
                //判断当前货号是否有重复的
                List<String> FSList = FS.split(',');
                String HH = '';
                for(String s in FSList){
                  if(s != data['title']){
                    HH += s+',';
                  }
                }
                HH = HH.substring(0,HH.length-1);
                SharedPreferenceUtil.setString("所有货号", HH);
              }

              zce_ShowDialog().zfe_SuccessDialog_show(context, '删除成功！');
            },
          ),
        ],
      ),
    );
  }

  Widget info_card(data) {
    Color zc_color_number = Colors.blue;
    TextStyle textStyle_title = TextStyle(
        fontSize: 18, color: Color(0xff4E526F), fontWeight: FontWeight.w500);
    TextStyle textStyle_text = TextStyle(
        fontSize: 13, color: Color(0xff4E526F), fontWeight: FontWeight.w500);
    return Container(
//      height: 200,
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 130,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 25,
                        color: zc_color_number,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '货号：' + data["title"],
                              style: textStyle_title,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(top: 8, bottom: 5),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 20,
                                    color: Color(0xff4E526F),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '价格：' + data["money"] + ' 元',
                                    style: textStyle_text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: Icon(
                                    Icons.attach_money,
                                    size: 20,
                                    color: Color(0xff4E526F),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    '价格：' + data["money2"] + ' 元',
                                    style: textStyle_text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: data["state"] == '1' ? Text(
                              "已售完",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.red, fontWeight: FontWeight.w500),
                            ) : Text(
                              "",
                              style: textStyle_text,
                            ) ,
                          )
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: 160,
            margin: EdgeInsets.only(left: 10),
            child: new ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              child: Image.file(
                File(data['imagepath']),
                fit: BoxFit.contain,
              ),
            ),
//            zcw_Image(
//                borderRadius: BorderRadius.all(Radius.circular(3)),
//                imgurl: data['url']),
          )
        ],
      ),
      decoration: new BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: <BoxShadow>[
          //设置阴影
          new BoxShadow(
            color: Color(0xFFBDBDBD), //阴影颜色
            //blurRadius: 8.0,
            offset: Offset(0.0, 3.0),
            // color: Color.fromRGBO(16, 20, 188, 1.0),
            blurRadius: 10.0,
            spreadRadius: -3.0, //阴影大小
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


  @override

  void deactivate() {

    var bool = ModalRoute.of(context).isCurrent;

    if (bool) {

      init();

    }

  }

}
