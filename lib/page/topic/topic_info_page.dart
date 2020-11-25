import 'package:flutter/material.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
import 'topic_create_page.dart';
import 'package:flutter_create/data/net/topic_api.dart';

class TopicInfoPage extends StatefulWidget{
  int topicId;
  TopicInfoPage({
    this.topicId
  }):assert(topicId!=null);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ToicIsss();
  }
}

class ToicIsss extends State<TopicInfoPage>{
  Map datainfo = null;
  String showText = "正在加载";

  getData() async {
    Map map = {
      "topicId":widget.topicId
    };
    Map data = await TopicApi().getTopicDetail(map) as Map;
    if(data!=null){
      setState(() {
        datainfo = data['data'];
      });
    }else{
      setState(() {
        showText = '加载错误';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(321);
    getData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: zfv_Appbar_topback(
        title: "",
        rightw: GestureDetector(
          child: Container(child: Row(
            children: <Widget>[
              Icon(Icons.assignment,color: Colors.white),
              Container(width: 10,),
              Text("编辑",style: TextStyle(fontSize: 16,color: Colors.white),),
            ],
          )),
          onTap: (){
          },
        ),
      ),
      body: datainfo==null? Center(child: Text(showText),):content_view(),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                maintainState: false,
                builder: (BuildContext context) =>
                    TopicCreatePage()));
          },
          child: Container(
            height: 40,
              child: Column(
            children: <Widget>[
              Icon(Icons.near_me,color: Colors.white,size: 18,),
              Text("发任务",style: TextStyle(fontSize: 11,color: Colors.white),),
            ],
          )),
        ) ,
    );
  }

  Widget content_view (){
    TextStyle textStyle_text = TextStyle(
        fontSize: 13,
        color:Color(0xff4E526F),
        fontWeight: FontWeight.w500
    );
    TextStyle textStyle_title = TextStyle(
        fontSize: 20,
        color: Color(0xff4E526F),
        fontWeight: FontWeight.w500
    );
    return Container(
      color: Color(0xffEEF2F3),
      child: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: <Widget>[
            // content_top
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 15,right: 10,left: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(datainfo['title'],style: textStyle_title,),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        children: <Widget>[
                          Container(child: Icon(Icons.account_circle,size: 20,color: Color(0xff4E526F),),),
                          Container(margin:EdgeInsets.only(left: 5),child:Text(datainfo['username'],style: textStyle_text,),),
                          Container(margin:EdgeInsets.only(left: 25),child: Icon(Icons.timer_off,size: 20,color: Color(0xff4E526F),),),
                          Container(margin:EdgeInsets.only(left: 5),child:Text(datainfo['createDate'],style: textStyle_text,),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: content_body(),
            )
          ]),
    );
  }

  Widget content_body(){
    TextStyle textStyle_text = TextStyle(
        fontSize: 16,
        color: Color(0xff4E526F),
        fontWeight: FontWeight.w400
    );
    TextStyle textStyle_samlltext = TextStyle(
        fontSize: 16,
        color: Color(0xff4E526F),
        fontWeight: FontWeight.w500
    );

    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(top: 20,bottom: 15),
      child: Container(
        padding: EdgeInsets.only(left: 15,right: 15),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(children: <Widget>[
                Container(child: Icon(Icons.assignment,size: 20,color: Color(0xff4E526F),),),
                Container(margin:EdgeInsets.only(left: 5),child:Text("选题正文",style: textStyle_samlltext,),),
              ],),
            ),
            Container(
              alignment: Alignment.topLeft,
              child:    Text(datainfo['content'],style: textStyle_text,),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10,top: 15),
              child: Row(children: <Widget>[
                Container(child: Icon(Icons.message,size: 20,color: Color(0xff4E526F),),),
                Container(margin:EdgeInsets.only(left: 5),child:Text("备注",style: textStyle_samlltext,),),
              ],),
            ),
            Container(
              width: MediaQuery.of(context).size.width-30,
              padding: EdgeInsets.only(left: 10,right: 10,top: 13,bottom: 13),
              child:  Text(datainfo['remarks'],style: textStyle_text,),
              decoration: new BoxDecoration(
                color: Color(0xffECEFF0),
                borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10,top: 15),
              child: Row(children: <Widget>[
                Container(child: Icon(Icons.label_important,size: 20,color: Color(0xff4E526F),),),
                Container(margin:EdgeInsets.only(left: 5),child:Text("标签",style: textStyle_samlltext,),),
              ],),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10,top: 10),
              child: Row(
                children: <Widget>[
                  Container(

                    child:Text("人文",style:textStyle_text),
                    padding: EdgeInsets.only(top: 5,right: 15,bottom:5,left: 15),
                    decoration: new BoxDecoration(
                      color: Color(0xffECEFF0),
                      borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child:Text("突发",style:textStyle_text),
                    padding: EdgeInsets.only(top: 5,right: 15,bottom:5,left: 15),
                    decoration: new BoxDecoration(
                        color: Color(0xffECEFF0),
                        borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child:Text("社会责任",style:textStyle_text),
                    padding: EdgeInsets.only(top: 5,right: 15,bottom:5,left: 15),
                    decoration: new BoxDecoration(
                        color: Color(0xffECEFF0),
                        borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          boxShadow: <BoxShadow>[ //设置阴影
                      new BoxShadow(
                        color: Color(0xFFCFCFCF), //阴影颜色
                        //blurRadius: 8.0,
                        offset: Offset(0.0, 3.0),
                        // color: Color.fromRGBO(16, 20, 188, 1.0),
                        blurRadius: 7.0,
                        spreadRadius: -3.0, //阴影大小
                      ),],
      ),
    );
  }
}