import 'package:flutter/material.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
import 'package:flutter_create/zcui/widgets/upload/zcw_upload_image.dart';


class TopicCreatePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToicIsssww();
  }

}

class ToicIsssww extends State<TopicCreatePage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(213);
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: zfv_Appbar_topback(
        title: "创建线索",
        titleleft: 50,
        rightw: Container(child: Row(
          children: <Widget>[
            Icon(Icons.print,color: Colors.white),
            Container(width: 10,),
            Text("其他",style: TextStyle(fontSize: 16,color: Colors.white),),
          ],
        )),
      ),
      body: content_view(),
    );
  }

  Widget content_view (){
    TextStyle textStyle_text = TextStyle(
        fontSize: 15,
        color:Color(0xffAFB0BB),
        fontWeight: FontWeight.w500
    );
    TextStyle textStyle_title = TextStyle(
        fontSize: 20,
        color: Color(0xff4E526F),
        fontWeight: FontWeight.w500
    );
    Color colorsx = Color(0xff8485A6);
    Color colorsx_t = Color(0xff646576);
    Color colorsx_d = Color(0xffCECED5);


    return Container(
      color: Color(0xffEDEFF0),
      child: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: <Widget>[
            // content_top
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.assignment,color: colorsx,size: 20,),
                                  margin: EdgeInsets.only(right: 15),
                                ),
                                Expanded(flex:1,child: Container(child: Text("请输入报道标题",style: textStyle_text,),)),
                                Container(
                                  child: Icon(Icons.arrow_forward_ios,size: 18,color: colorsx_d,),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 15,right: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            height: 0.5,
                            color: colorsx_d,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.account_balance_wallet,color: colorsx,size: 20,),
                                  margin: EdgeInsets.only(right: 15),
                                ),
                                Expanded(flex:1,child: Container(child: Text("请选择渠道",style: textStyle_text,),)),
                                Container(
                                  child: Icon(Icons.arrow_forward_ios,size: 18,color: colorsx_d,),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 15,right: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            height: 0.5,
                            color: colorsx_d,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.add_alert,color: colorsx,size: 20,),
                                  margin: EdgeInsets.only(right: 15),
                                ),
                                Expanded(flex:1,child: Container(child: Text("小组（必填）",style: textStyle_text,),)),
                                Container(
                                  child: Icon(Icons.arrow_forward_ios,size: 18,color: colorsx_d,),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 15,right: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            height: 0.5,
                            color: colorsx_d,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Icon(Icons.library_books,color: colorsx,size: 20,),
                                  margin: EdgeInsets.only(right: 15),
                                ),
                                Expanded(flex:1,child: Container(child: Text("请输入报道标题",style: textStyle_text,),)),
                                Container(
                                  child: Icon(Icons.arrow_forward_ios,size: 18,color: colorsx_d,),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(top: 15,right: 15),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            height: 5,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: <BoxShadow>[ //设置阴影
                    new BoxShadow(
                      color: Color(0xFFE4E3ED), //阴影颜色
                      //blurRadius: 8.0,
                      offset: Offset(0.0, 3.0),
                      // color: Color.fromRGBO(16, 20, 188, 1.0),
                      blurRadius: 5.0,
                      spreadRadius: -3.0, //阴影大小
                    ),],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: content_photo(),
            )
          ]),
    );
  }

  Widget content_photo(){
    Color colorsx = Color(0xff8485A6);
    TextStyle textStyle_title = TextStyle(
        fontSize: 17,
        color: Color(0xff8485A6),
        fontWeight: FontWeight.w500
    );
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 25),
      color: Color(0xffffffff),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(Icons.assignment,color: colorsx,size: 20,),
                  margin: EdgeInsets.only(right: 5),
                ),
                Expanded(flex:1,child: Container(child: Text("上传图片",style: textStyle_title,),)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15,bottom: 15),
            height: 0.2,color: colorsx,),
          Container(
            child: zcw_UploadImage(),
          )
        ],
      ),
    );
  }
  
  Widget content_body(){
  }
}