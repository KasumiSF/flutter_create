import 'dart:async';
import 'dart:convert';

import 'package:flutter_create/provide/baselist_provide.dart';
import 'package:flutter_create/data/net/report_api.dart';

class VoidListProvide extends BaseListProvide{

  VoidListProvide.initstate(int index) : super.initstate(1, 10, []);



  @override
  Future<Object> getDataList(_indexpage, _pageSize) async {
    Map map_param = {
      'channelId': 165,
    };
    map_param['pageNumber'] = _indexpage;
    map_param['pageSize'] = _pageSize;

    // TODO: implement getDataList
    ReportApi  reportApi = new ReportApi();
    var data = await reportApi.getReportList(map_param);
    if(data!=null){
      return ListData(code: true,listdata:
      data['data'] !=null ? json.decode(json.encode(data['data']))   as List : []);
    }else{
      return ListData(code: false,listdata: []);
    }
  }
}
