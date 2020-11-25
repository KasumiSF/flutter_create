import 'package:flutter/material.dart';
import "view//zf_video_playbackx.dart";


class Videolist_page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home_videolist_page_view();
  }

}
class _Home_videolist_page_view extends State<Videolist_page> {
  int videoid = 0;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new CustomScrollView(
         physics: ScrollPhysics(),
            slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color:Color(0xFFFFFFFF),
              )
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: videoid == index+4 ? new zf_video_playbackx(): beforeplayback(index+4 ,
                          'http://i.ce.cn/newwap/ttt/201902/15/W020190215344403011938.jpg',
                          '神仙打架！诗词大会总决赛上演超难成语“飞花令”，总冠军又是她'
                      ),
                    ),
                    userinfo_title(
                        'http://i.ce.cn/newwap/ttt/201902/15/W020190215344403011938.jpg'
                    )
                  ],
                ),
              ) ;
              },
              childCount: 10,
            ),
            )
        ]
      ),
    );
  }
  Widget beforeplayback(int videoinfo_id,String image,title){
    return new Stack(
      children: <Widget>[
        new Container(
            height: (MediaQuery.of(context).size.width /3)*1.6,
            decoration: new BoxDecoration(
//                          border: new Border.all(width: 4, color: Color(0xFFD7D6D6)),
              color:Color(0xFFEEEEEE),
              borderRadius: BorderRadius.all(  Radius.circular(3.0)),
              image: new DecorationImage(
                image: new NetworkImage(image),
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            )
        ),
        new Align(
            child: new GestureDetector(
              child: new Container(
                margin: EdgeInsets.only(top: (((MediaQuery.of(context).size.width /3)*1.6)/2)-25,right: 10),
                height: 50,
                width: 50,
                child: Stack(
                  children: <Widget>[
                    new Opacity(
                      opacity: 0.6,
                      child: new Container(
                          height: 50,
                          width: 50,
                          decoration: new BoxDecoration(
                            //                          border: new Border.all(width: 4, color: Color(0xFFD7D6D6)),
                            color: Color(0xFF000000),
                            borderRadius: BorderRadius.all(  Radius.circular(50.0)),
                          )
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 12,top: 10),
                      height: 30,width: 30,
                      child: Icon(Icons.play_arrow,color: Colors.white,size: 30,)
                    )
                  ],
                ),
              ),
              behavior: HitTestBehavior.translucent,
              onTap: (){
                setState(() {
                  videoid = videoinfo_id;
                });
              },
            )
        ),
        new Align(
          alignment: FractionalOffset.bottomRight,
          child: new Container(
            margin: EdgeInsets.only(top: ((MediaQuery.of(context).size.width /3)*1.6)-30,right: 10),
            height: 22,
            width: 50,
            child: Stack(
              children: <Widget>[
                new Opacity(
                  opacity: 0.6,
                  child: new Container(
                      height: 22,
                      width: 50,
                      decoration: new BoxDecoration(
                        color: Color(0xFF000000),
                        borderRadius: BorderRadius.all(  Radius.circular(5.0)),
                      )
                  ),
                ),
                new Container(
                  height: 22,
                  width: 50,
                  child: Center(
                    child: Text("10:20",style: TextStyle(color: Color(0xFFFFFFFF)),),
                  ),
                )
              ],
            ),
          ),
        ),
        new Align(
          alignment: FractionalOffset.bottomLeft,
          child: new Container(
            margin: EdgeInsets.only(top: ((MediaQuery.of(context).size.width /3)*1.6)-30,left: 10),
            height: 22,
            width: 80,
            child: Stack(
              children: <Widget>[
                new Container(
                  height: 22,
                  width: 80,
                  child: Center(
                    child: Text("1290 播放",style: TextStyle(color: Color(0xFFFFFFFF)),),
                  ),
                )
              ],
            ),
          ),
        ),
        new Align(
          alignment: FractionalOffset.topLeft,
          child: new Container(
            margin: EdgeInsets.only(top: 10,left: 10),
            height: 22,
            child: Text(title,style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 16,fontWeight: FontWeight.w700),),
          ),
        ),
      ],
    );
  }
  Widget userinfo_title(String img){
    return   new Container(
        padding: EdgeInsets.only(bottom: 8,top:8,left: 15,right: 15),
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Container(
                height:38,
                width: 38,
                child: new ClipRRect(
                    borderRadius: new BorderRadius.all(
                        new Radius.circular(60.0)),
                    child: new SizedBox(
                      child: new  Image.network(img,fit: BoxFit.cover,),)
                ),
                decoration: new BoxDecoration(
//                          border: new Border.all(width: 4, color: Color(0xFFD7D6D6)),
                    color:Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(  Radius.circular(60.0))
                )
            ),flex: null,),
            new Expanded(child:
            new Container(
              padding: EdgeInsets.only(left: 10,top: 2,bottom: 2),
              height: 40,
              child: new Column(
                children: <Widget>[
                  new Expanded(
                    child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: new Row(
                          children: <Widget>[
                            new Container(
                              child: new Text("TNOK",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000)
                                ),),),
                            new Container(margin: EdgeInsets.only(left: 7),padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 3),child: new Text('L 12',style: TextStyle(fontSize: 9,color: Color(0xFFFFFFFF),),),
                              decoration: new BoxDecoration(color: Color(0xFF3DC0FF), borderRadius: BorderRadius.all(  Radius.circular(60.0))),)
                          ],
                        )
                    ),flex: null,),
                  new Expanded(child: new Container(),flex: 1,),
                  new Expanded(child: new Container(
                      child: Align(
                        alignment: FractionalOffset.bottomLeft,
                        child: new Text("我就是互刷的好出啥 ",
                          textAlign: TextAlign.left
                          ,style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4B4B4B)
                          ),),
                      )
                  ),flex: null,)
                ],
              ),
            ),flex: 1,),
            new Expanded(child: new Container(
                height:22,
                width: 40,
                child: new Center(
                    child: new Text("关注",style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),)
                ),
                decoration: new BoxDecoration(
//                          border: new Border.all(width: 4, color: Color(0xFFD7D6D6)),
                    color:Color(0xFFE74641),
                    borderRadius: BorderRadius.all(  Radius.circular(5.0))
                )
            ),flex: null,),
          ],
        )
    );
  }
  Widget Dividing_Crudeline(){
    return new Column(
      children: <Widget>[
        new Container(height: 6,color: Color(0xffEEEEEE),),
      ],
    );
  }

}