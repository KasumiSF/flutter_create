import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


/**
 * @Createby: 李金伟 , @Date: 2019-04-02
 * @todo More convenient to draw pictures with network judgment （更方便的绘制图片自带网络判断）
 * @param
 */

class zcw_Image extends StatelessWidget{
  final String imgurl;
  BorderRadius borderRadius;
  Border border;
  BoxFit boxfit;
  List<BoxShadow> boxShadowlist;
  zcw_Image({
    @required this.imgurl,
    this.borderRadius,
    this.border,
    this.boxfit,
    this.boxShadowlist
  }):assert(String != null);


  //@todo Determine if the imgurl is from the network
  bool get _isImgFromNet {
    return this.imgurl.startsWith('http') || this.imgurl.startsWith("https");
  }

  bool get _isImgFromAssets {
    return this.imgurl.startsWith('assets');
  }

  //@todo return imgeview by param
  @override
  Widget build(BuildContext context) {
    Widget _Imageview;
    if (imgurl!=null&&imgurl.length>0&&_isImgFromNet){
      _Imageview = CachedNetworkImage(
        imageUrl: imgurl,
        placeholder:(context, url) => _Imageview = Image.asset(
          'assets/images/tupian.png',
        ),
        fit: boxfit==null? BoxFit.fill :boxfit,
      );
    }else {
      if(_isImgFromAssets){
        _Imageview = Image.asset(
          imgurl,
          fit: boxfit==null? BoxFit.fill :boxfit,
        );
      }else{
        _Imageview = Image.file(
          File(imgurl),
          fit: boxfit==null? BoxFit.fill :boxfit,
        );
      }

    }
    // TODO: implement build
    return Container(
      child: new ClipRRect(
          borderRadius: borderRadius == null ? BorderRadius.all(Radius.circular(0)):borderRadius,
          child: _Imageview
      ),
      decoration: new BoxDecoration(
          borderRadius: borderRadius == null ? BorderRadius.all(Radius.circular(0)):borderRadius,
          border:  border == null ? null:border,
          boxShadow: boxShadowlist==null?<BoxShadow>[]:boxShadowlist
      ),
    );
  }
}

class imageupload{
  int status;
  String imagepath;
}