import 'package:flutter/material.dart';
import 'package:flutter_create/page/report/ClothingNumber.dart';
import 'package:flutter_create/page/report/report_add_page.dart';
import 'package:flutter_create/util/DbUtils.dart';
import 'package:flutter_create/util/Material.dart';
//import 'package:flutter_create/util/SharedPreferenceUtil.dart';
import 'package:flutter_create/zcui/widgets/upload/shared_preferences_upload_image.dart';
import '../../zcui/event/zce_Toast.dart';
import 'package:flutter_create/zcui/widgets/zcw_index.dart';
/**
 * 查看大图页面
 * 以及价格页面？
 */

class ReportInfoPage extends StatefulWidget {
  Map FS;

  ReportInfoPage({@required this.FS});

  @override
  State<StatefulWidget> createState() {
    return _ReportInfoPage();
  }
}

class _ReportInfoPage extends State<ReportInfoPage> {


  //用于保存列表用的所有Widget
  List<Widget> listWidget = new List();

  //主键
  String PPHH = "";
  //品牌
  String PinPai = "";
  //货号
  String HuoHao = "";
  //价格1
  String JG1 = "";
  //价格2
  String JG2 = "";
  //销售状态
  String state = "0";



  @override
  void initState() {
    init();
  }


  init() async {
    PPHH = widget.FS['PPHH'];
//      SharedPreferenceUtil.setString(HuoHao,"456");
//    String FS = await SharedPreferenceUtil.getString(PPHH);
      List<ClothingNumber> listClothingNumber =await DbUtils.dbUtils.queryItems(ClothingNumber());
      setState(() {
//          JG1.text = FS.toString();
        PinPai = widget.FS['PinPai'];
        HuoHao = widget.FS['HuoHao'];
        ReportAddPage_PicPath = widget.FS['PicPath'];
        JG1 = widget.FS['JG1'];
        JG2 = widget.FS['JG2'];
//        if(FSList.length>5){
//          state = FSList[5];
//        }

      });

  }

  @override
  Widget build(BuildContext context) {
//    ScreenUtil.init(context);

    /**
     * 1、按添加按钮增加一行输入框
     * 2、每一行数据是4个输入框分别表示：品牌、编号、单价、件数
     * 3、用一个list保存所有每一行的数据
     * 4、保存后，将品牌和编号分别保存成list，便于出售时，选择下拉框
     * 5、保存分为内存数据库和json文件两种形式
     *
     * 特殊：之后追加上传到云
     *    可以读取json文件，保存最新的数据到本地
     *    打开软件时，将数据保存到内存数据库
     *    打印出什么形式的账单？
     */

//    ListWidget(0);

    return Scaffold(
      appBar: zfv_Appbar_topback(
        title: "修改款号",
        titleleft: 40,
        padding: EdgeInsets.only(left: 10, right: 10),
        rightw: GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 5),
            child: Text(
              "保存",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          onTap: () async {
            //先判空
            if (HuoHao.length == 0) {
              zce_Toast.toast(context, "必须输入货号");
            }
            if(PinPai.length == 0 ){
              zce_Toast.toast(context, "必须输入品牌");
            }
            PPHH = PinPai+HuoHao;
//            print(ReportAddPage_PicPath + "," + JG1 + "," + JG2);
//            //先查看已保存的货号，然后再在此基础上增加新的货号
//            String FS = await SharedPreferenceUtil.getString("所有货号");
//            if (FS != null) {
//              //判断当前货号是否有重复的
//              List<String> FSList = FS.split(',');
//
//              /**判断现在跳转传入的和修改后的是否相同；
//              *    不相同则先判断，修改后是否已经存在，
//              *        如果存在则提示，并跳过修改
//              *        如果不存在，则删除原来的，添加新的
//              *    相同则不需要操作
//               */
//              String newFS = "";
//              for (String PPHHs in FSList) {
//                //判断现在跳转传入的和修改后的是否相同
//                if(widget.PPHH != PPHH){
//                  //如果不相同，则剔除原来的，只保留新的
//                  if(PPHHs != widget.PPHH){
//                    newFS += PPHHs+ ",";
//                  }
//                  if (PPHHs == PPHH) {
//                    zce_Toast.toast(context, "该货号已保存，请勿重复添加");
//                    return;
//                  }
//                }
//
//              }
//              if(widget.PPHH != PPHH){
//                //如果循环正常结束,说明修改后的货号,不重复
//                newFS += PPHH;
//              }
//
//            }
//            //保存该货号的相关信息
//            SharedPreferenceUtil.setString(
//                PPHH,PinPai+','+HuoHao+','+ReportAddPage_PicPath + "," + JG1 + "," + JG2+","+state);
//
//            print(PinPai+','+HuoHao+','+ReportAddPage_PicPath + "," + JG1 + "," + JG2+","+state);
//            zce_Toast.toast(context, "保存成功！");
//            print(await SharedPreferenceUtil.getString("所有货号"));
            addData(widget.FS['PPHH'],PPHH, PinPai, HuoHao, ReportAddPage_PicPath, JG1, JG2, state);
//            Navigator.maybePop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.assignment,
                            color: Color(0xff8485A6),
                            size: 20,
                          ),
                          margin: EdgeInsets.only(right: 5),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                "上传图片",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff8485A6),
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    height: 0.2,
                    color: Color(0xff8485A6),
                  ),
                  Container(
                    child: shared_preferences_upload_image(),
                  )
                ],
              ),
              Container(width: double.infinity, child: Text('输入品牌')),
              TextField(
                controller: TextEditingController(text:PinPai),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
//                keyboardType: TextInputType.number,
                onChanged: (text) {

                  PinPai = text;
                },
              ),
              Container(width: double.infinity, child: Text('输入货号')),
              TextField(
                controller: TextEditingController(text: HuoHao),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  HuoHao = text;
                },
              ),
              Container(width: double.infinity, child: Text('输入价格1(元)')),
              TextField(
                controller: TextEditingController(
                  text: JG1,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String v) {
                  JG1 = v;
                },
                onSubmitted: (String r) {
                  JG1 = r;
                },
              ),
              Container(width: double.infinity, child: Text('输入价格2(元)')),
              TextField(
                controller: TextEditingController(
                  text: JG2,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.transparent)),
                  //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                  contentPadding: EdgeInsets.all(10.0),
                  fillColor: Colors.white,
                  filled: true,
                  //            labelText: 'Hello',
                  // 以下属性可用来去除TextField的边框
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.number,
                onChanged: (String v) {
                  JG2 = v;
                },
                onSubmitted: (String r) {
                  JG2 = r;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> addData(oldPPHH, newPPHH, PinPai, HuoHao, PicPath, JG1, JG2, State) async {

    ClothingNumber clothingNumber = ClothingNumber(
        PPHH: newPPHH,
        PinPai: PinPai,
        HuoHao: HuoHao,
        PicPath: PicPath,
        JG1: JG1,
        JG2: JG2,
        State: State);

    /**先判断是否修改了货号,如果没有,则允许修改
     * 如果修改了货号,货号还存在,则不允许修改
     */
    if(oldPPHH != newPPHH){
      //修改了货号
      List<ClothingNumber> list = await DbUtils.dbUtils.queryItems(ClothingNumber(),key:"PPHH",value: newPPHH);
      //修改货号后,冲突,拒绝修改
      if(list != null && list.length>0){
        zce_Toast.toast(context, "该货号已保存，请勿重复添加");
        return;

        //修改货号后不冲突,允许修改,并删除旧的
      }else {

        await DbUtils.dbUtils.insertItem(clothingNumber);
        await DbUtils.dbUtils.deleteItem(ClothingNumber(),key:"PPHH",value: oldPPHH);
      }
    }

    //没有修改货号,则可以覆盖以前的
    await DbUtils.dbUtils.updateItem(clothingNumber,"PPHH",newPPHH);


    zce_Toast.toast(context, "修改成功!");
    print("===============插入成功================");
    //关闭数据库
//    await DbUtils.dbUtils.closeDb();

    Navigator.maybePop(context);
  }

//  List<Widget> ListWidget(int state) {
//    if (state == 0) {
//      listWidget.add(Container(
//        child: Row(
//          children: <Widget>[
//            Text("品牌"),
//            //添加新品牌
//            GestureDetector(
//                child: Icon(Icons.add_circle, color: Colors.blue),
//                onTap: (){
//                  ListWidget(0);
//                }
//            ),
//            Container(
//                color: SourceMaterials.color1,
//                width: ScreenUtil().setWidth(300),
//                child: TextField()),
//          ],
//        ),
//      ));
//      listWidget.add(Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Text("款号"),
//              //添加新款号
//              Icon(Icons.add_circle, color: Colors.blue),
//            ],
//          ),
//          Row(
//            children: <Widget>[
//              Text("大小号"),
//              //添加大小码
//              Icon(Icons.add_circle, color: Colors.blue),
//            ],
//          ),
//          Text("单价"),
//          Text("件数"),
//        ],
//      ));
//      listWidget.add(
//        Row(
//          children: <Widget>[
//            Container(
//                color: SourceMaterials.color1,
//                width: ScreenUtil().setWidth(150),
//                child: TextField()),
//            Container(
//                color: SourceMaterials.color1,
//                width: ScreenUtil().setWidth(150),
//                child: TextField()),
//          ],
//        ),
//      );
//    }
//
//    return listWidget;
//  }

  add() {}
}
