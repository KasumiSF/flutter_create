import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../event/zce_Toast.dart';

typedef GetDataCallbackx = Future<bool> Function();

class zcw_BaseList extends StatefulWidget{
  final Widget child;
  final GetDataCallbackx onRefresh;
  final GetDataCallbackx moredata;
  zcw_BaseList(
  {
    this.child,
    this.onRefresh,
    this.moredata
  });



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _baselist_view();
  }
}

class _baselist_view extends State<zcw_BaseList>{
  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new EasyRefresh(
      key: _easyRefreshKey,
      refreshHeader: BezierCircleHeader(
        key: _headerKey,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      refreshFooter: BezierBounceFooter(
        key: _footerKey,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: widget.child,
      onRefresh: () async {
//        await new Future.delayed(const Duration(seconds: 1), () async {
//          await widget.onRefresh().then((datax){
//            if(!datax){
//              zce_Toast.toast(context, '网络错误!');
//            }
//          });
//          //await new Future.delayed(const Duration(seconds: 500), () {});
//        });
      },
      loadMore: () async {
//        await new Future.delayed(const Duration(seconds: 1), () async {
//          await widget.moredata().then((datax){
//            if(!datax){
//              zce_Toast.toast(context, '网络错误');
//            }
//          });
//          //await new Future.delayed(const Duration(seconds: 500), () {});
//          //_onRefresh_fun();
//        });
      },
    );
  }

}