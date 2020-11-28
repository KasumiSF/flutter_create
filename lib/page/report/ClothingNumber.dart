import 'package:flutter_create/util/DbBaseBean.dart';

class ClothingNumber extends DbBaseBean {
  //主键
  String PPHH = "";

  //品牌
  String PinPai = "";

  //货号
  String HuoHao = "";

  //图片地址
  String PicPath = "";

  //图片
  String Pic = "";

  //价格1
  String JG1 = "";

  //价格2
  String JG2 = "";

  //状态
  String State = "";

  //创建时间
  String CreateTime = "";
  //修改时间
  String UpdateTime = "";

  String tableName = "ClothingStyle";

  ClothingNumber(
      {this.tableName,
        this.PPHH,
      this.PinPai,
      this.HuoHao,
      this.PicPath,
      this.JG1,
      this.JG2,
      this.State});

  ClothingNumber.fromJson(Map<String, dynamic> json) {
    PPHH = json['PPHH'];
    PinPai = json['PinPai'];
    HuoHao = json['HuoHao'];
    PicPath = json['PicPath'];
    JG1 = json['JG1'];
    JG2 = json['JG2'];
    State = json['State'];
  }

  ClothingNumber.fromSql(Map<String, dynamic> json) {
    PPHH = json['PPHH'];
    PinPai = json['PinPai'];
    HuoHao = json['HuoHao'];
    PicPath = json['PicPath'];
    JG1 = json['JG1'];
    JG2 = json['JG2'];
    State = json['State'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['PPHH'] = this.PPHH;
    data['PinPai'] = this.PinPai;
    data['HuoHao'] = this.HuoHao;
    data['PicPath'] = this.PicPath;
    data['JG1'] = this.JG1;
    data['JG2'] = this.JG2;
    data['State'] = this.State;
    return data;
  }

  @override
  DbBaseBean fromJson(Map<String, dynamic> map) {
    return ClothingNumber.fromJson(map);
  }



  @override
  String getTableName() {

    return "ClothingStyle";
  }
}
