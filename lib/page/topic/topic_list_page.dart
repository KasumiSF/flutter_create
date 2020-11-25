import 'package:flutter/material.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
import 'provide/topic_list_provide.dart';
import 'package:provide/provide.dart';
import 'topic_info_page.dart';

//class TopicListPage extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _view();
//  }
//}

class TopicListPage extends StatelessWidget {
  final providers = Providers()
    ..provide(Provider.function((context) =>  TopicListProvide.initstate()));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProviderNode(
        providers: providers,
        child:  Provide<TopicListProvide>(
          builder: (context,child,myProvide) =>
              Stack(
                children: <Widget>[
                  Scaffold(
                    appBar: zfv_Appbar_topback(
                      title: "选题库",
                      rightw: Container(child: Text("新建",style: TextStyle(fontSize: 16,color: Colors.white),),),
                      childheight: 50,
                      child: Container(height: 50,child:search_filter(myProvide),),
                    ),
                    body: Container(
                        color: Color(0xffF4F7F6),
                        child: new zcw_BaseList(
                            onRefresh:()=> myProvide.OnRefeshData(),
                            moredata: ()=> myProvide.GetMoreData(),
                            child:  CustomScrollView(
                                physics: ScrollPhysics(),
                                slivers: <Widget>[
                                  myProvide.isloading
                                      ? SliverToBoxAdapter(child:Center(child: Text("正在加载！",
                                      style: TextStyle(fontSize: 16)),))
                                      : !myProvide.loadingSuc
                                      ? SliverToBoxAdapter(child:Center(child: GestureDetector(
                                    child: Text("加载失败！点击重试",
                                      style: TextStyle(fontSize: 16),),
                                    onTap: (){
                                      myProvide.initdata();
                                    },),))
                                      : myProvide.datalist.length>1
                                      ? SliverList(
                                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                        return GestureDetector(child: question_card(myProvide.datalist[index]),onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => TopicInfoPage(topicId: myProvide.datalist[index]['id'],)));
                                        },);
                                      }, childCount: myProvide.datalist.length,))
                                      : SliverToBoxAdapter(child:
                                  Center(child: Text("暂无数据！",
                                      style: TextStyle(fontSize: 16)),
                                  ),)
                                ])
                        )

                    ),
                  ),
                  myProvide.show_param?Container(
                      child: new Opacity(
                          opacity: 0.8,
                          child: new Container(
                              decoration: new BoxDecoration(
                                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                  color: Color(0xffffffff)
                              )))
                  ):Container(),
                  myProvide.show_param?Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Container(
                      width: MediaQuery.of(context).size.width,
                      child: search_dialog(context,myProvide),
                    ),):Container()
                ],
              ),
        )
    );
  }

  Widget search_filter(TopicListProvide myProvide){
    double radius = 30; // 圆角
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 36,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Container(
                    child: Icon(Icons.search,color: Colors.blue,size: 20,),
                  )
                ],
              ),
              decoration: new BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(radius))
              ),
            ),flex: 1,
          ),
          new GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  Container(child: Text("筛选",style: TextStyle(fontSize: 16,color: Colors.white))),
                  Container(child: Icon(Icons.flash_on,color: Colors.white,),)
                ],
              ),
            ),
            onTap: (){
              myProvide.showParam(true);
            },
          )
        ],
      ),
    );
  }

  Widget question_card(data){

    String title = data['title'].toString();
    String atour = data['username'].toString();
    String time = data['createDate'].toString();
    String caifang = data['relateCount'].toString();
    String xiansuo = data['relateCount'].toString();
    String baodao = data['relateCount'].toString();

    double zc_20 = 20;
    double zc_15 = 15;
    double zc_10 = 10;
    double zc_5 = 5;
    Color zc_color_number = Colors.blue;


    TextStyle textStyle_label = TextStyle(
        fontSize: 15,
        color: Color(0xff4E526F),
        fontWeight: FontWeight.w500
    );

    TextStyle textStyle_title = TextStyle(
        fontSize: 18,
        color: Color(0xff4E526F),
        fontWeight: FontWeight.w500,

    );

    TextStyle textStyle_text = TextStyle(
        fontSize: 13,
        color:Color(0xff4E526F),
        fontWeight: FontWeight.w500
    );

    return new Container(
      height: 130,
      margin: EdgeInsets.only(top: zc_15),
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[ //设置阴影
          new BoxShadow(
            color: Color(0xFFBDBDBD), //阴影颜色
            //blurRadius: 8.0,
            offset: Offset(0.0, 3.0),
            // color: Color.fromRGBO(16, 20, 188, 1.0),
            blurRadius: 10.0,
            spreadRadius: -3.0, //阴影大小
          ),],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 88,
            padding: EdgeInsets.only(left: zc_15,top: zc_20),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 10,
                      height: 25,
                      color: zc_color_number,
                    ),
                    Expanded(flex: 1,child: Container(),)
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: zc_10),

                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(right: 15),
                          child: Text(title,style: textStyle_title,maxLines: 1,overflow: TextOverflow.ellipsis,),),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            children: <Widget>[
                              Container(child: Icon(Icons.account_circle,size: 20,color: Color(0xff4E526F),),),
                              Container(margin:EdgeInsets.only(left: 5),child:Text(atour,style: textStyle_text,),),
                              Container(margin:EdgeInsets.only(left: 25),child: Icon(Icons.timer_off,size: 20,color: Color(0xff4E526F),),),
                              Container(margin:EdgeInsets.only(left: 5),child:Text(time,style: textStyle_text,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          Container(height: 1,color: Color(0xffeeeeee),),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: zc_20,right: zc_20,top: zc_10,bottom: zc_10),
            child: Row(
              children: <Widget>[
                Container(
                  width:100,
                  child: Row(
                    children: <Widget>[
                      Container(child: Text('采访',style: textStyle_label,),padding: EdgeInsets.only(right: zc_5),),
                      Container(child:Text(caifang,style: TextStyle(color: zc_color_number,fontSize: 17,fontWeight: FontWeight.w500),)),
                    ],
                  ),),
                Expanded(child: Container(),flex: 1,),
                Container(
                  width:100,
                  child: Row(
                    children: <Widget>[
                      Container(child: Text('线索',style: textStyle_label,),padding: EdgeInsets.only(right: zc_5),),
                      Container(child:Text(xiansuo,style: TextStyle(color: zc_color_number,fontSize: 17,fontWeight: FontWeight.w500),)),
                    ],
                  ),),
                Expanded(child: Container(),flex: 1,),
                Container(
                  width:100,
                  child: Row(
                    children: <Widget>[
                      Container(child: Text('报道',style: textStyle_label,),padding: EdgeInsets.only(right: zc_5),),
                      Container(child:Text(baodao,style: TextStyle(color: zc_color_number,fontSize: 17,fontWeight: FontWeight.w500),)),
                    ],
                  ),),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget search_dialog(BuildContext context,TopicListProvide myProvide){
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          new GestureDetector(
            child: Container(
              child: Container(height: 40,width: 40,
                alignment: Alignment.topCenter,
                decoration: new BoxDecoration(
                    color: Color(0xff6B6B6B),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(child: Icon(Icons.close,color: Colors.white,)),
              ),
            ),
            onTap: (){
              myProvide.initparam();
              myProvide.showParam(false);
            },
          ),
          Expanded(flex: 1,child: Container(),),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
              child: Text("日期选择",style: TextStyle(color: Colors.white,fontSize: 15),),
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(2))
              ),
            ),
            onTap: () {
              // 调用函数打开
              showDatePicker(
                context: context,
                initialDate: new DateTime.now(),
                firstDate: new DateTime.now().subtract(new Duration(days: 30)), // 减 30 天
                lastDate: new DateTime.now().add(new Duration(days: 30)),       // 加 30 天
              ).then((DateTime val) {
                myProvide.changeDate(val.toString()); // 2018-07-12 00:00:00.000
              }).catchError((err) {
                print(err);
              });
            },
          ),
          Container(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
            color: Color(0xffeeeeee),
            child: Text(myProvide.selectDate==null?"暂未选择日期":myProvide.selectDate,style: TextStyle(fontSize: 16)),
          ),
          Expanded(flex: 1,child: Container(),),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
              child: Text("确认",style: TextStyle(color: Colors.white,fontSize: 15),),
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(2))
              ),
            ),
            onTap: (){
              myProvide.selectDataListby_param();
              myProvide.showParam(false);
            },
          ),
          Expanded(flex: 1,child: Container(),),
        ],
      ),
    );
  }

//  @override
//  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => true;

}