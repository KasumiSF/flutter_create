//import 'package:flutter/material.dart';
//import 'package:flutter_create/page/report/report_add_page.dart';
//import 'package:flutter_create/zcui/widgets/zcw_index.dart';
//import 'report_list_page.dart';
//import 'xxx.dart';
//import 'videolist_page.dart';
//
///**
// * 第一版本：
// * 图片、版号、价格
// *
// * 1、新增页面
// * 2、查看大图页面
// */
//
//class ReportIndexPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _ReportIndexPage();
//  }
//}
//
//class _ReportIndexPage extends State<ReportIndexPage>
//    with SingleTickerProviderStateMixin {
//  TabController _tabController;
//  List<Tab> tabs = <Tab>[new Tab(text: '款号')];
//
////  List<Tab> tabs =  <Tab>[
////    new Tab(text: '进货'),
////    new Tab(text: '发货'),
////    new Tab(text: '补货'),
////    new Tab(text: '退货'),
////  ];
//
//  @override
//  void initState() {
//    super.initState();
//    _tabController = new TabController(vsync: this, length: tabs.length);
//    setState(() {});
//    _tabController.animateTo(0);
//  }
//
//  @override
//  void dispose() {
//    _tabController.dispose();
//    print("index_dispose");
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      appBar: zfv_Appbar_topback(
//        title: "款号",
////        "进货发货",
////        titleleft: 40,
////        padding: EdgeInsets.only(left: 10, right: 10),
//        rightw: GestureDetector(
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Icon(Icons.add_circle, color: Colors.white),
//              Container(
//                width: 5,
//              ),
//              Text(
//                "新增",
//                style: TextStyle(fontSize: 16, color: Colors.white),
//              )
//            ],
//          ),
//          onTap: () {
//            Navigator.push(
//                context,
//                new MaterialPageRoute(
//                    builder: (BuildContext context) => ReportAddPage()));
//          },
//        ),
//        childheight: 50,
//        child: Container(height: 50,child:search_filter(),),   ),
//      body:
////      new TabBarView(
////        controller: _tabController,
////        children: <Widget>[
//          new ReportListPage(
//            status: 1,
//          ),
////          new ReportListPage(status: 2,),
////          new ReportListPage(status: 3,),
////          new Videolist_page()
//          //new MessageSessionPage()
////        ],
////      ),
//    );
//  }
//
//  Widget buildTopBar() {
//    TextStyle labelStylexx = TextStyle(
//        color: Color(0xff4AACF8), fontSize: 18, fontWeight: FontWeight.w600);
//    TextStyle unlabelStylexx = TextStyle(
//        color: Color(0xff4AACF8), fontSize: 16, fontWeight: FontWeight.w500);
//    return Container(
//      height: 50,
//      child: new TabBar(
//        tabs: tabs,
//        isScrollable: false,
//        indicatorColor: Color(0xff2296F3),
//        indicatorWeight: 3,
//        indicatorSize: TabBarIndicatorSize.tab,
//        labelColor: Color(0xff2296F3),
//        labelStyle: labelStylexx,
//        unselectedLabelStyle: unlabelStylexx,
//        unselectedLabelColor: Color(0xff89A1B3),
//        controller: _tabController,
//      ),
//      decoration: new BoxDecoration(
//        color: Color(0xffffffff),
//        boxShadow: <BoxShadow>[
//          //设置阴影
//          new BoxShadow(
//            color: Color(0xFFBDBDBD), //阴影颜色
//            //blurRadius: 8.0,
//            offset: Offset(0.0, 3.0),
//            // color: Color.fromRGBO(16, 20, 188, 1.0),
//            blurRadius: 10.0,
//            spreadRadius: -3.0, //阴影大小
//          ),
//        ],
//      ),
//    );
//  }
//
//
//
//}
