import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/ClothingNumber.dart';
import 'package:flutter_create/page/report/report_add_page.dart';
import 'package:flutter_create/util/DbUtils.dart';
import 'package:flutter_create/util/Loading.dart';
import 'package:flutter_create/util/PictureSizeChange.dart';
import 'package:flutter_create/util/ReadFile.dart';
//import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
import 'package:flutter_create/zcui/event/dialog/zce_ShowDialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../zcui/event/zce_Toast.dart';
import 'provide/report_list_provide.dart';
import 'report_info_page.dart';

class ReportListPage extends StatefulWidget {
//  final int status;
//
//  ReportListPage({this.status, Key key})
//      : super(key: key); //:assert(status!=null)
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReportList_view();
  }
}

class ReportList_view extends State<ReportListPage> with AutomaticKeepAliveClientMixin {
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

  //是否隐藏筛选页面
  bool screen = false;

  //以下是搜索使用
  //主键
  String PPHH = "";
  //品牌
  String PinPai = "";
  //货号
  String HuoHao = "";
  //价格1
  String JG1 = "";
  //价格2
  String JG2 = "";
  //销售状态
  String state = "0";

  //输入框焦点
  FocusNode _commentFocus = FocusNode();


  init() async {
    List<ClothingNumber> listClothingNumber = [];
    listClothingNumber =await DbUtils.dbUtils.queryItems(ClothingNumber());
    setState(() {
      FSList = [];

    });

    if(listClothingNumber != null){
      for (int i = 0 ; i< listClothingNumber.length ; i++) {
        ClothingNumber cn =listClothingNumber[i];
        Map map = cn.toJson();
        Image image = await ReadFile.getPicFile(map['PicPath'] );
//        Image image = Image.file(File(map['PicPath'] ),
//          fit: BoxFit.contain,
//        );
//        Image image = Image.file(map['PicPath']);

        map['PicImage'] = image;
        setState(() {
          FSList.add(map);
        });

      }
    }

    setState(() {
      FSBool = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);

    return Stack(children: <Widget>[
      Scaffold(
          appBar: zfv_Appbar_topback(
            title: "款号",
//        "进货发货",
//        titleleft: 40,
//        padding: EdgeInsets.only(left: 10, right: 10),
            rightw: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.add_circle, color: Colors.white),
                  Container(
                    width: 5,
                  ),
                  Text(
                    "新增",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => ReportAddPage()));
              },
            ),
            childheight: 50,
            child: Container(
              height: 50,
              child: search_filter(),
            ),
          ),
          body: CustomScrollView(physics: ScrollPhysics(), slivers: <Widget>[
            FSBool
                ? SliverToBoxAdapter(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Loading(color: Colors.blue, size: 60.0,lineWidth:5),
                  ),
                        ),
                        Text("正在加载！", style: TextStyle(fontSize: 16)),
                      ],
                    ))
                : FSList.length > 0
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return GestureDetector(
                            child: slidable_card(
                              FSList[index],
                              index,
                            ),
                            onTap: () {

                              tanchuang(FSList[index]);

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
          ])),
      screen
          ? Container(
              child: new Opacity(
                  opacity: 0.8,
                  child: new Container(
                      decoration: new BoxDecoration(
                          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Color(0xffffffff)))))
          : Container(),
      screen
          ? Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: MediaQuery.of(context).size.width,
                child: search_dialog(),
              ),
            )
          : Container()
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

  //弹出大图
  tanchuang(Map image){
    //先通过地址拿到文件，再打开图片
//    image['PicPath'];
//    Uint8List outputAsUint8List = new Uint8List.fromList(image['Pic'].codeUnits);

    showDialog(context:context,
        child:Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            child: Photo(image: image['PicImage']),

            onTap: (){
              Navigator.pop(context);
            },
          ),
        ));
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
        key: new Key(data['PPHH']),
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
          GestureDetector(
            child: new Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Container(height: 56,width:56,
                    margin: EdgeInsets.only(left: 8),
                    child: Icon(Icons.refresh,color: Colors.blue,size: 32,),
                    decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: <BoxShadow>[ //设置阴影
                          new BoxShadow(
                            color: Color(0xFFBDBDBD), //阴影颜色
                            //blurRadius: 8.0,
                            offset: Offset(0.0, 3.0),
                            // color: Color.fromRGBO(16, 20, 188, 1.0),
                            blurRadius: 10.0,
                            spreadRadius: -3.0, //阴影大小
                          ),]
                    ),
                  ),
                  Container(height: 10,),
                  Container(
                    child: Text("修改",style: textStyle_label,),),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            onTap: () {

              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ReportInfoPage(
                              FS: FSList[index])));
            },
          ),

          GestureDetector(
            child: new Container(
              color: Colors.transparent,
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
                if (data["State"] == '1') {
                  data["State"] = '0';
                } else {
                  data["State"] = '1';
                }
              });
              await DbUtils.dbUtils.updateItem(ClothingNumber.fromJson(data),"PPHH",data["PPHH"]);
            },
          ),
          GestureDetector(
            child: new Container(
              color: Colors.transparent,
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
//              bool remove = await SharedPreferenceUtil.remove(data['title']);
              await DbUtils.dbUtils.deleteItem(ClothingNumber(),key:"PPHH",value: data['PPHH']);
              print("删除" + data['PPHH']);
              setState(() {
                FSList.remove(index);
//                FSListlength -=1;
                init();
              });
              //删除本地图片
              ReadFile.deleteFile(data['PicPath']);
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
              height: 150,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '货号：' + data['PPHH'],
                              style: textStyle_title,
                            ),
                          ),
//                          Expanded(
//                            flex: 1,
//                            child: Container(),
//                          ),
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
                                    '价格：' + data['JG1'] + ' 元',
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
                                    '价格：' + data['JG2'] + ' 元',
                                    style: textStyle_text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: data['State'] == '1'
                                ? Text(
                                    "已售完",
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    "",
                                    style: textStyle_text,
                                  ),
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
              child: data['PicImage'],
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

  //筛选栏
  Widget search_filter() {
    double radius = 30; // 圆角
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 36,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      focusNode: _commentFocus,
                      controller: TextEditingController.fromValue(TextEditingValue(
                        text: PPHH,
//                          selection: TextSelection.fromPosition(TextPosition(
//                              affinity: TextAffinity.downstream,
//                              offset: HH.length))
                      )),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.transparent)),
                        //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                        contentPadding: EdgeInsets.only(left:10,bottom: 10),
                        fillColor: Colors.transparent,
                        filled: true,
                        //            labelText: 'Hello',
                        // 以下属性可用来去除TextField的边框
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (String v) {
                        PPHH = v;
//                        setState(() {
//                          HHLength = v.length;
//                        });
                      },
                      onSubmitted: (String r) {
                        PPHH = r;
//                        setState(() {
//                          HHLength = r.length;
//                        });
                      },
                      //按回车时调用
                      onEditingComplete: (){
                        _commentFocus.unfocus();
                        search(PPHH);
                      },
                    ),
                    flex: 1,
                  ),
                  PPHH.length > 0 ?GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.cancel,
                        color: Colors.black38,
                        size: 20,
                      ),
//                        color: Colors.red,
                    ),
                    onTap: (){
                      setState(() {
                        PPHH = '';
//                        HHLength = 0;
                        init();
                      });
                    },
                  ): Container(),
                  GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 20,
                      ),
//                        color: Colors.red,
                    ),
                    onTap: (){
                      //进行名称查询
                      _commentFocus.unfocus();
                      search(PPHH);
                    },
                  )
                ],
              ),
              decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(radius))),
            ),
            flex: 1,
          ),
          new GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Container(
                      child: Text("筛选",
                          style: TextStyle(fontSize: 16, color: Colors.white))),
                  Container(
                    child: Icon(
                      Icons.flash_on,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            onTap: () {
              //进行名称查询
              _commentFocus.unfocus();
              search(PPHH);

              //暂时不弹出具体的筛选页面
//              setState(() {
//                screen = !screen;
//              });
            },
          )
        ],
      ),
    );
  }

  //货号正则筛选功能
  Future<void> search(String screens) async {




    List<ClothingNumber> listClothingNumber =await DbUtils.dbUtils.queryItems(ClothingNumber());
    setState(() {
      FSList = [];
      FSBool = true;
    });
    List<Map> list = [];
    for (ClothingNumber cn in listClothingNumber) {
      Map map = cn.toJson();
      setState(() {
        list.add(map);
      });

    }
    RegExp regExp = new RegExp('('+screens+')');
//    List HHlist = [];
    for(Map hhs in list){
      bool isABC = regExp.hasMatch(hhs['PPHH']);
      if(isABC){
        Image image = await ReadFile.getPicFile(hhs['PicPath'] );
//        Image image = Image.file(File(hhs['PicPath'] ),
//          fit: BoxFit.contain,
//        );
        hhs['PicImage'] = image;
        FSList.add(hhs);
      }
    }

    setState(() {
      FSBool = false;
    });


  }

  //筛选弹窗
  Widget search_dialog() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          new GestureDetector(
            child: Container(
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.topCenter,
                decoration: new BoxDecoration(
                    color: Color(0xff6B6B6B),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                    child: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
              ),
            ),
            onTap: () {
              setState(() {
                screen = !screen;
              });
//              myProvide.initparam();
//              myProvide.showParam(false);
            },
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                "日期选择",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
            ),
            onTap: () {
              // 调用函数打开
//              showDatePicker(
//                context: context,
//                initialDate: new DateTime.now(),
//                firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
//                lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
//              ).then((DateTime val) {
////                myProvide.changeDate(val.toString()); // 2018-07-12 00:00:00.000
//              }).catchError((err) {
//                print(err);
//              });
            },
          ),
          Container(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            color: Color(0xffeeeeee),
//            child: Text(myProvide.selectDate==null?"暂未选择日期":myProvide.selectDate,style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              child: Text(
                "确认",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
            ),
            onTap: () {
//              myProvide.selectDataListby_param();
//              myProvide.showParam(false);
            },
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
