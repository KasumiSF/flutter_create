import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../common/models/listData.dart';
export '../common/models/listData.dart';


class BaseListProvide extends ChangeNotifier{
  List list;
  int index;
  int pageSize;
  int _indexpage;
  bool isloading = true;
  bool loadingSuc = true;
  int get value => index;
  List get datalist => list;

  BaseListProvide(){}

 // GetListCallback getListCallback;

//  BaseListProvide(
//    this._index,
//    this.list,
//   // this.getListCallback
//  );

  BaseListProvide.initstate(
    this.index,
    this.pageSize,
    this.list,){
    initdata();
  }

//  BaseListProvide.initstatex(
//      this._index,
//      this._pageSize,
//      this.list){
//    OnRefeshData();
//  }

  initdata() async{
    isloading = true;
    loadingSuc = true;
    notifyListeners();
    print("");
    _indexpage = index;
    Timer timer = new Timer(new Duration(milliseconds:500), () async {
      ListData _listData =  await getDataList(_indexpage,pageSize);
      if(_listData.code){
        loadingSuc = true;
        _indexpage = _indexpage+1;
        list = _listData.listdata;
      }else{
        loadingSuc = false;
      }
      isloading = false;
      notifyListeners();
      // 只在倒计时结束时回调
    });
  }

  Future<Object> getDataList(_indexpage,_pageSize) async {
    print("请重写该方法");
    return await ListData(code: false,listdata: []);
  }

  Future<bool> OnRefeshData() async {
    _indexpage = index;
    print("上拉刷新=----------------------=");
    ListData _listData =  await getDataList(_indexpage,pageSize);
    if(_listData.code){
      _indexpage = _indexpage+1;
      list = _listData.listdata;
    }
    print(_listData.code);
    await notifyListeners();
    return _listData.code;
  }

  Future<bool> GetMoreData() async {
    print("下拉加载=----------------------=");
    print('GetMoreData:'+_indexpage.toString());
    ListData _listData =  await getDataList(_indexpage,pageSize);
    if(_listData.code&&_listData.listdata.length>0){
      _indexpage = _indexpage+1;
      list.addAll(_listData.listdata);
    }
    await notifyListeners();
    return _listData.code;
  }

  void RemoveItem(index){
    list.removeAt(index);
    notifyListeners();
  }
}