import 'dart:async';
import 'dart:convert';

import 'package:flutter_create/provide/baselist_provide.dart';
import 'package:flutter_create/data/net/report_api.dart';

class ReportListProvide extends BaseListProvide{
  int status;

  ReportListProvide.initstate(int index) : super.initstate(1, 10, []);
  ReportListProvide({this.status}){
    this.index = 1;
    this.pageSize=10;
    this.list = [];
    super.initdata();
  }


  @override
  Future<Object> getDataList(_indexpage, _pageSize) async {
    Map map_param = {};
    map_param['pageNo'] = _indexpage;
    map_param['pageSize'] = _pageSize;
    if(status!=null){
      map_param['status'] = status;
    }
    // TODO: implement getDataList
    ReportApi  reportApi = new ReportApi();
    var data = await reportApi.getReportList(map_param);
    if(data!=null){
      return ListData(code: true,listdata:
      data['records'] !=null ? json.decode(json.encode(data['records']))   as List : []);
    }else{
      return ListData(code: false,listdata: []);
    }
  }
}
