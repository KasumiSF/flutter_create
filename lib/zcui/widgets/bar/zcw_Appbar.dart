import 'package:flutter/material.dart';

class zcw_Appbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final Widget bottom;
  final String title;
  final Widget leftw;
  final Widget rightw;
  final double height;
  final bool istop;
  final Color backgroundcolor;
  final TextStyle textStyle;
  final Color color;
  EdgeInsets padding = null;

  zcw_Appbar(
      {this.textStyle,
      @required this.istop,
      this.color,
      @required this.height,
      this.backgroundcolor,
      this.title,
      this.leftw,
      this.rightw,
      this.padding,
      this.child,
      this.bottom})
      : assert(istop != null),
        assert(istop == true && title != null),
        assert(height != null);

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return new Size.fromHeight(height);
  }

  static double textsize = 17;
  TextStyle font_title = new TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xff333333),
      fontSize: textsize,
      letterSpacing: 1.5);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: backgroundcolor,
      child: new SafeArea(
        top: istop,
        child: Container(
          height: height,
          child: myappbar(),
        ),
      ),
    );
  }

  Widget apptopx() {
    return Container(
      padding: padding != null ? padding : EdgeInsets.all(0),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
                alignment: Alignment.bottomLeft,
                child: leftw != null ? leftw : Container()),
            flex: 1,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: textStyle != null ? textStyle : font_title,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                )),
            flex: 1,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: rightw != null ? rightw : Container()),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget myappbar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: color != null ? color : null,
            child: leftw != null || title != null || rightw != null
                ? apptopx()
                : new Container(),
          ),
          flex: 1,
        ),
        Container(child: child),
        Container(child: bottom),
      ],
    );
  }
}

class zfv_Appbar_topback extends StatelessWidget
    implements PreferredSizeWidget {
  final double height = 40;
  final String title;
  final Widget rightw;
  final Widget leghtw;
  final double childheight;
  final Widget child;
  final EdgeInsets padding;
  final double titleleft;

  zfv_Appbar_topback(
      {@required this.title,
      this.rightw,
      this.leghtw,
      this.padding,
      this.childheight,
      this.child,
      this.titleleft})
      : assert(title != null);
  TextStyle font_title = new TextStyle(
      fontWeight: FontWeight.w600,
      color: Color(0xffffffff),
      fontSize: 18,
      letterSpacing: 1.5);

  BuildContext contextx;

  @override
  Widget build(BuildContext context) {
    contextx = context;
    // TODO: implement build
    return zcw_Appbar(
      istop: true,
      height: childheight != null ? height + childheight : height,
      title: title,
      textStyle: font_title,
      leftw: leghtw != null ? leghtw : _leftview(),
      rightw: rightw != null
          ? rightw
          : Container(
              width: 40,
            ),
      padding: padding != null ? padding : EdgeInsets.only(left: 10, right: 10),
      child: child != null ? child : Container(),
      backgroundcolor: Colors.blue,
    );
  }

  Widget _leftview() {
    return GestureDetector(
      child: Container(
          margin: EdgeInsets.only(right: titleleft == null ? 0 : titleleft),
          height: 40,
          width: 40,
          child: Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: Colors.white,
          )),
      onTap: () {
        Navigator.pop(contextx);
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return new Size.fromHeight(
      childheight != null ? 50 + childheight : height,
    );
  }
}
