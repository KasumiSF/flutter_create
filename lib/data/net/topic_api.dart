import '../../common/base/base_api.dart';

void main(){
  TopicApi().getTopicDetail({"topicId":50});
}

class TopicApi {
  // getTopicList;
  static String getTopicList_str = '/topic/topic/getTopicList';
  static String getTopicDetail_str = '/topic/topic/getTopicDetail';

  // 文章列表接口
  Future<Map> getTopicList(Map map) async {
    BaseApi baseApi = new BaseApi();
    return await baseApi.BasePost(getTopicList_str, map) as Map ;
  }

  // 文章详情接口
  Future<Map> getTopicDetail(Map map) async {
    BaseApi baseApi = new BaseApi();
    return await baseApi.BasePost(getTopicDetail_str, map) as Map ;
  }


}