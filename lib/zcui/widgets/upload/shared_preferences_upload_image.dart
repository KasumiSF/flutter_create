import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/report_add_page.dart';
import '../base/zcw_Image.dart';
import '../../event/zce_Toast.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class shared_preferences_upload_image extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _zcw_UploadImage_view();
  }
}

class _zcw_UploadImage_view extends State<shared_preferences_upload_image> {
  int number = 1;
  int widthpadding = 30;
  double mainAxisSpacing = 20;
  int crossAxisCount = 1;
  double crossAxisSpacing = 20;
  String schedule;

  String uploadpath = "http://10.1.1.101:8089/zim/uploadphoto";
  int imgkey = 1;
  List imagelist = new List();


  @override
  void initState() {
    if(ReportAddPage_PicPath != null && ReportAddPage_PicPath != ""){
      setState(() {
        imagelist = [{
          'key': imgkey,
          'status': 1,
          'schedule': 0,
          'imagepath':ReportAddPage_PicPath,
        }];
        imgkey = imgkey + 1;
      });

    }
  } //  void upload_file(File file) async {
//    Dio dio = new Dio();
//    FormData formData = new FormData.from({
//      "uploadFile": new UploadFileInfo(file,'')
//    });
//    try {
//      dio.options.connectTimeout = 5000; //5s
//      Response response;
//      int statusCode;
//      response = await dio.post(uploadpath, data: formData,
//        onSendProgress: (int sent, int total) {
//          double zhi = sent/total;
//          setState(() {
//            if(zhi==1.0){
//              schedule = "100%";
//            }else{
//              schedule = zhi.toString().substring(2,4)+"%";
//            }
//          });
//        },
//      );
//      statusCode = response.statusCode;
//      if(statusCode <0){
//        print('服务启动异常！');
//        return null;
//      }else{
//        Map result = {"imgurl":response.data['imgurl'].toString(),"videourl":response.data['videourl'].toString(),"playinfo":response.data['videoinfo']};
//        // 下载视频预览图
//      }
//    } catch (e) {
//      print(e);
//    }
//  }



  Future getImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
//    upload_file(image);
    if(image == null){
      return;
    }
    ReportAddPage_PicPath = image.path;
    setState(() {
      imagelist = [{
        'key': imgkey,
        'status': 1,
        'schedule': 0,
        'imagepath':        image.path,
      }];
      imgkey = imgkey + 1;
    });
  }






  double itemheight = 0;

  @override
  Widget build(BuildContext context) {



    setState(() {
      itemheight = ((MediaQuery.of(context).size.width -
              widthpadding -
              ((crossAxisCount - 1) * mainAxisSpacing)) /
          crossAxisCount);
    });
    // TODO: implement build
    return Container(
      height: 400,
//      ((imagelist.length+1)/crossAxisCount) >1
//      ? ((MediaQuery.of(context).size.width - widthpadding -((crossAxisCount-1)*mainAxisSpacing))/crossAxisCount)*2+crossAxisSpacing
//      : itemheight,
      color: Color(0xffF6F9FC),
      child: new GridView.custom(
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
        ),
        childrenDelegate: new SliverChildBuilderDelegate(
          (context, index) {
            return imagelist.length == index
                ? addnewImage()
                : showImage(imagelist[index], index);
          },
          childCount: imagelist.length + 1,
        ),
      ),
    );
  }

  Widget showImage(image, int index) {
//    print('11111111111111111111'+image['imagepath']);
    return Container(
      color: Color(0xffDEEFFF),
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xffECF5FD),
            margin: EdgeInsets.only(top: 5, right: 5, left: 0, bottom: 0),
            alignment: AlignmentDirectional.center,
            height: itemheight,
            width: double.infinity ,
            child: Stack(
              children: <Widget>[
                Container(
                    height: itemheight,
//                    width: itemheight,
                    child:
                    Image.file(
                      File(image['imagepath']),
                      fit: BoxFit.contain,
                    )
//                    zcw_Image(
//                      imgurl: image['imagepath'],
//                      boxfit: BoxFit.cover,
//                      )
                ),
//                new Opacity(
//                    opacity: 0.3,
//                    child: new Container(
//                        decoration: new BoxDecoration(
//                            // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
//                            color: Color(0xff000000)))),
//                Container(
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                        flex: 1,
//                        child: Container(),
//                      ),
//                      Container(
//                        margin: EdgeInsets.only(bottom: 6),
//                        child: Text(
//                          "13%",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                      ),
//                      Container(
//                        child: new LinearProgressIndicator(
//                          backgroundColor: Colors.white,
//                          value: 0.2,
//                          valueColor:
//                              new AlwaysStoppedAnimation<Color>(Colors.blue),
//                        ),
//                        height: 5,
//                        padding: EdgeInsets.only(left: 3, right: 3),
//                        decoration: new BoxDecoration(
//                            borderRadius: BorderRadius.all(Radius.circular(1))),
//                      ),
//                      Expanded(
//                        flex: 1,
//                        child: Container(),
//                      ),
//                    ],
//                  ),
//                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.topRight,
                  decoration: new BoxDecoration(
                    color: Color(0xff0F6DC4),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.cancel,
                      size: 15,
                      color: Color(0xffffffff),
                    ),
                  )),
              onTap: () {
                setState(() {
                  imagelist.removeAt(index);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget addnewImage() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        color: Color(0xffeeeeee),
        child: Icon(
          Icons.image,
          color: Color(0xff888888),
          size: 50,
        ),
      ),
      onTap: () {
        if (imagelist.length >= number) {
//          zce_Toast.toast(context, "抱歉！最多添加${number}张图片");
        } else {
          getImage();
//          setState(() {
//            imagelist.add('https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=1566810888,3489037532&fm=85&s=2380F706ACE6AC1B182E44D2020050BA');
//          });
        }
      },
    );
  }
}

enum imgStatus { success, fail, uploading }

class _image {
  int key;
  imgStatus status;
  String imagepath;
  double schedule;

  _image({this.key, this.status, this.imagepath, this.schedule});
}
