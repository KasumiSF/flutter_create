import 'dart:async';

import 'package:flutter/material.dart';

class zfv_SuccessDialog extends Dialog {
  String text;
  bool State = true;

  zfv_SuccessDialog({Key key, @required this.text, this.State})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 150.0,
          height: 150.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                    width: 60,
                    height: 50,
                    child: State == null || State  ? new Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 50,
                    )
                        :new Icon(
                      Icons.not_interested,
                      color: Colors.red,
                      size: 50,
                    )),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: new Text(
                      text,
                      style: new TextStyle(fontSize: 15.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class zce_ShowDialog {
  Map<String, String> zfe_SuccessDialog_show(
      BuildContext context, String text) {
    var a = showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return zfv_SuccessDialog(
            text: text,
          );
        });
    Timer timer = new Timer(new Duration(milliseconds: 600), () {
      Navigator.of(context).pop(null);
      // 只在倒计时结束时回调
    });
  }

  Map<String, String> zfe_SuccessDialog_No_show(
      BuildContext context, String text) {
    var a = showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return zfv_SuccessDialog(
            text: text,
              State: false,
          );
        });
    Timer timer = new Timer(new Duration(milliseconds: 600), () {
      Navigator.of(context).pop(null);
      // 只在倒计时结束时回调
    });
  }
}
