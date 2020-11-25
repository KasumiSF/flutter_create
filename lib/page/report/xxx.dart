import 'package:flutter/material.dart';
import 'report_info_page.dart';

class xxx extends StatefulWidget{
  final int status ;
  xxx({this.status});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return www();
  }
}

class www extends State<xxx> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("接收数据：${widget.status}");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      body: Center(child: GestureDetector(child: Text("这里是页面${widget.status}"),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(
              builder: (BuildContext context) =>
                  ReportInfoPage()));
        },
      ),),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}