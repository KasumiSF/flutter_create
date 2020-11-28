import 'dart:convert' as convert;


class JsonToString {
//  json转换为字符串
  void testJson2String(){
    var user = { "name": "John Smith", "email": "john@example.com"};
    String jsonString = convert.jsonEncode(user);
    String normalString2 = user.toString();
    print('打印对象: $user');
    print('打印toString: $normalString2');
    print('打印JSON: $jsonString');
    var nameList = ["小明","韩梅梅","李华"];
    String normalNameString = nameList.toString();
    String josnNameString = convert.jsonEncode(nameList);
    print(nameList);
    print(normalNameString);
    print(josnNameString);
  }

  /// 字符串转json
  void testString2Json(){
    var jsonTxt1 = '{ "name": "John Smith", "email": "john@example.com"}';
    Map<String, dynamic> user = convert.jsonDecode(jsonTxt1);
    var jsonTxt2 = '["小明","韩梅梅","李华"]';
    List nameList = convert.jsonDecode(jsonTxt2);
  }


}