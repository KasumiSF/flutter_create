import 'dart:async';

import 'package:flutter_create/provide/baselist_provide.dart';
import 'package:flutter_create/data/net/topic_api.dart';

class TopicListProvide extends BaseListProvide{
  String selectDate = null;
  bool show_param = false;

  TopicListProvide.initstate() : super.initstate(1, 10, []);


  // 更改选择日期
  changeDate(String date){
    print('接收到的！============'+date);
    this.selectDate=date;
    notifyListeners();
  }
  // 更改选择日期
  showParam(bool data){
    show_param = data;
    notifyListeners();
  }

  // 初始值
  initparam(){
    selectDate = null;
    notifyListeners();
  }

  // 筛选数据
  selectDataListby_param(){
    super.initdata();
  }

  // shua
  Future<bool> OnRefeshData() {
    initparam();
    return super.OnRefeshData();
  }

  @override
  Future<Object> getDataList(_indexpage, _pageSize) async {
    Map map_param = {};
    map_param['pageNo'] = _indexpage;
    map_param['pageSize'] = _pageSize;
    if(selectDate!=null){
      map_param['createDate'] = selectDate;
    }
    // TODO: implement getDataList
    TopicApi topicApi = new TopicApi();
    var data = await topicApi.getTopicList(map_param);
    if(data!=null){
      return ListData(code: true,listdata:
      data['data']['records'] !=null ? data['data']['records']  as List : []);
    }else{
      return ListData(code: false,listdata: []);
    }
  }


}