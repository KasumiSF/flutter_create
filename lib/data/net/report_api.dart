import 'package:flutter_create/common/base/base_api.dart';

void main() {
  String str = '';
  List listphoto1 = [
    "https://p1.pstatp.com/list/190x124/pgc-image/RN9mRrE3ma5zdC",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN39zKY9IxLSJZ",
    "https://p9.pstatp.com/list/190x124/pgc-image/RN8cOcmAe6sarU",
    "https://p1.pstatp.com/list/190x124/pgc-image/841795451e5e4083af159655f3176623",
    "https://p1.pstatp.com/list/190x124/pgc-image/RK84euaDuAcJ7q",
    "https://p1.pstatp.com/list/190x124/pgc-image/RIR0EXJEoTO8gN",
    "https://p1.pstatp.com/list/190x124/pgc-image/RN8RxpI4Qz7whO",
    "https://p3.pstatp.com/list/190x124/pgc-image/f497ed5f55c542bd89580e4e1406dee1",
    "http://p3.pstatp.com/origin/pgc-image/6e4539a6fb254349b95d8d68f9321e51",
    "https://p3.pstatp.com/list/dfic-imagehandler/e641776d-dba0-42c9-ba23-94080794260f",
    "https://p1.pstatp.com/list/190x124/pgc-image/RM52RZdEa0klAm"
  ];
  List listphoto2 = [
    "https://p9.pstatp.com/list/190x124/pgc-image/RMZPdfI7hgQMU9",
    "https://p1.pstatp.com/list/190x124/pgc-image/dcfba2a818654d35bebf2667533f9e3a",
    "https://p3.pstatp.com/list/190x124/pgc-image/RKgLelX87Y9jPr",
    "https://p1.pstatp.com/list/190x124/pgc-image/RN7nDi857ZVMWK",
    "https://p1.pstatp.com/list/190x124/pgc-image/RMBFMSqAaSgWNh",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN8SxfuEYG5PzG",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln",
    "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi",
  ];
  List listphoto3 = [
    "https://p3.pstatp.com/list/190x124/pgc-image/51665edd045540008020d7723fcdad14",
    "https://p9.pstatp.com/list/190x124/pgc-image/df5ab055356e49acbe60f5ec480185aa",
    "https://p1.pstatp.com/list/190x124/pgc-image/RN6ZvXZAYG02VN",
    "https://p3.pstatp.com/list/190x124/pgc-image/RMyW2hq9YORZDn",
    "https://p1.pstatp.com/list/190x124/pgc-image/9ca80403c0244b8d9bee4b787c5cfe4f",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN9a1qF5i55xBQ",
    "https://p3.pstatp.com/list/190x124/pgc-image/95730f630a9d452dae10db0c9fdf57a2",
    "https://p9.pstatp.com/list/190x124/pgc-image/ad714d51e0c34cb7a715fae11f751514",
    "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB",
    "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b",
  ];
  List listphoto4 = [
    "https://p3.pstatp.com/list/190x124/pgc-image/RN6y0PNAFFMeET",
    "https://p1.pstatp.com/list/190x124/pgc-image/2e2510e8d3134628b9dab84154b09ac9",
    "https://p1.pstatp.com/list/190x124/pgc-image/RN9hixU8eHKq1n",
    "https://p3.pstatp.com/list/190x124/pgc-image/RLabBZSDSLfnEG",
    "https://p9.pstatp.com/list/190x124/pgc-image/RN1bl2nF8PVw5u",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN92mMD32Ihikr",
    "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV",
    "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi",
    "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB",
    "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b",
  ];

  for (int i = 1; i <= 10; i++) {
    int a = 20;
    str +=
        '{"title":"已完成这个是已完成测试内容${a + i}","time":"2019-08-09","url":"${listphoto4[i - 1]}"},';
  }
//  print(str);

  ReportApi().getReportList({"status": 1, "pageNo": 2});
}

List listdata1 = [
  {
    "page": 1,
    "records": [
      {
        "title": "草稿这个是草稿测试内容1",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN9mRrE3ma5zdC"
      },
      {
        "title": "草稿这个是草稿测试内容2",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN39zKY9IxLSJZ"
      },
      {
        "title": "草稿这个是草稿测试内容3",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RN8cOcmAe6sarU"
      },
      {
        "title": "草稿这个是草稿测试内容4",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/841795451e5e4083af159655f3176623"
      },
      {
        "title": "草稿这个是草稿测试内容5",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RK84euaDuAcJ7q"
      },
      {
        "title": "草稿这个是草稿测试内容6",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RIR0EXJEoTO8gN"
      },
      {
        "title": "草稿这个是草稿测试内容7",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN8RxpI4Qz7whO"
      },
      {
        "title": "草稿这个是草稿测试内容8",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/f497ed5f55c542bd89580e4e1406dee1"
      },
      {
        "title": "草稿这个是草稿测试内容9",
        "time": "2019-08-09",
        "url":
            "http://p3.pstatp.com/origin/pgc-image/6e4539a6fb254349b95d8d68f9321e51"
      },
      {
        "title": "草稿这个是草稿测试内容10",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/dfic-imagehandler/e641776d-dba0-42c9-ba23-94080794260f"
      },
    ]
  },
  {
    "page": 2,
    "records": [
      {
        "title": "草稿这个是草稿测试内容11",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN9mRrE3ma5zdC"
      },
      {
        "title": "草稿这个是草稿测试内容12",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN39zKY9IxLSJZ"
      },
      {
        "title": "草稿这个是草稿测试内容13",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RN8cOcmAe6sarU"
      },
      {
        "title": "草稿这个是草稿测试内容14",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/841795451e5e4083af159655f3176623"
      },
      {
        "title": "草稿这个是草稿测试内容15",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RK84euaDuAcJ7q"
      },
      {
        "title": "草稿这个是草稿测试内容16",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RIR0EXJEoTO8gN"
      },
      {
        "title": "草稿这个是草稿测试内容17",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN8RxpI4Qz7whO"
      },
      {
        "title": "草稿这个是草稿测试内容18",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/f497ed5f55c542bd89580e4e1406dee1"
      },
      {
        "title": "草稿这个是草稿测试内容19",
        "time": "2019-08-09",
        "url":
            "http://p3.pstatp.com/origin/pgc-image/6e4539a6fb254349b95d8d68f9321e51"
      },
      {
        "title": "草稿这个是草稿测试内容20",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/dfic-imagehandler/e641776d-dba0-42c9-ba23-94080794260f"
      },
    ]
  },
  {
    "page": 3,
    "records": [
      {
        "title": "草稿这个是草稿测试内容21",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN9mRrE3ma5zdC"
      },
      {
        "title": "草稿这个是草稿测试内容22",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN39zKY9IxLSJZ"
      },
      {
        "title": "草稿这个是草稿测试内容23",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RN8cOcmAe6sarU"
      },
      {
        "title": "草稿这个是草稿测试内容24",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/841795451e5e4083af159655f3176623"
      },
      {
        "title": "草稿这个是草稿测试内容25",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RK84euaDuAcJ7q"
      },
      {
        "title": "草稿这个是草稿测试内容26",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RIR0EXJEoTO8gN"
      },
      {
        "title": "草稿这个是草稿测试内容27",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN8RxpI4Qz7whO"
      },
      {
        "title": "草稿这个是草稿测试内容28",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/f497ed5f55c542bd89580e4e1406dee1"
      },
      {
        "title": "草稿这个是草稿测试内容29",
        "time": "2019-08-09",
        "url":
            "http://p3.pstatp.com/origin/pgc-image/6e4539a6fb254349b95d8d68f9321e51"
      },
      {
        "title": "草稿这个是草稿测试内容30",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/dfic-imagehandler/e641776d-dba0-42c9-ba23-94080794260f"
      },
    ]
  },
];
List listdata2 = [
  {
    "page": 1,
    "records": [
      {
        "title": "待审核这个是待审核测试内容1",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RMZPdfI7hgQMU9"
      },
      {
        "title": "待审核这个是待审核测试内容2",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/dcfba2a818654d35bebf2667533f9e3a"
      },
      {
        "title": "待审核这个是待审核测试内容3",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RKgLelX87Y9jPr"
      },
      {
        "title": "待审核这个是待审核测试内容4",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7nDi857ZVMWK"
      },
      {
        "title": "待审核这个是待审核测试内容5",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMBFMSqAaSgWNh"
      },
      {
        "title": "待审核这个是待审核测试内容6",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8SxfuEYG5PzG"
      },
      {
        "title": "待审核这个是待审核测试内容7",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln"
      },
      {
        "title": "待审核这个是待审核测试内容8",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln"
      },
      {
        "title": "待审核这个是待审核测试内容9",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV"
      },
      {
        "title": "待审核这个是待审核测试内容10",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi"
      },
    ]
  },
  {
    "page": 2,
    "records": [
      {
        "title": "待审核这个是待审核测试内容11",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RMZPdfI7hgQMU9"
      },
      {
        "title": "待审核这个是待审核测试内容12",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/dcfba2a818654d35bebf2667533f9e3a"
      },
      {
        "title": "待审核这个是待审核测试内容13",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RKgLelX87Y9jPr"
      },
      {
        "title": "待审核这个是待审核测试内容14",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7nDi857ZVMWK"
      },
      {
        "title": "待审核这个是待审核测试内容15",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMBFMSqAaSgWNh"
      },
      {
        "title": "待审核这个是待审核测试内容16",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8SxfuEYG5PzG"
      },
      {
        "title": "待审核这个是待审核测试内容17",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln"
      },
      {
        "title": "待审核这个是待审核测试内容18",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln"
      },
      {
        "title": "待审核这个是待审核测试内容19",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV"
      },
      {
        "title": "待审核这个是待审核测试内容20",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi"
      },
    ]
  },
  {
    "page": 3,
    "records": [
      {
        "title": "待审核这个是待审核测试内容21",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RMZPdfI7hgQMU9"
      },
      {
        "title": "待审核这个是待审核测试内容22",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/dcfba2a818654d35bebf2667533f9e3a"
      },
      {
        "title": "待审核这个是待审核测试内容23",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RKgLelX87Y9jPr"
      },
      {
        "title": "待审核这个是待审核测试内容24",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7nDi857ZVMWK"
      },
      {
        "title": "待审核这个是待审核测试内容25",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMBFMSqAaSgWNh"
      },
      {
        "title": "待审核这个是待审核测试内容26",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8SxfuEYG5PzG"
      },
      {
        "title": "待审核这个是待审核测试内容27",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln"
      },
      {
        "title": "待审核这个是待审核测试内容28",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN8tYlj2s2vLln"
      },
      {
        "title": "待审核这个是待审核测试内容29",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV"
      },
      {
        "title": "待审核这个是待审核测试内容30",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi"
      },
    ]
  },
];
List listdata3 = [
  {
    "page": 1,
    "records": [
      {
        "title": "已完成这个是已完成测试内容1",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/51665edd045540008020d7723fcdad14"
      },
      {
        "title": "已完成这个是已完成测试内容2",
        "time": "2019-08-09",
        "url":
            "https://p9.pstatp.com/list/190x124/pgc-image/df5ab055356e49acbe60f5ec480185aa"
      },
      {
        "title": "已完成这个是已完成测试内容3",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN6ZvXZAYG02VN"
      },
      {
        "title": "已完成这个是已完成测试内容4",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RMyW2hq9YORZDn"
      },
      {
        "title": "已完成这个是已完成测试内容5",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/9ca80403c0244b8d9bee4b787c5cfe4f"
      },
      {
        "title": "已完成这个是已完成测试内容6",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN9a1qF5i55xBQ"
      },
      {
        "title": "已完成这个是已完成测试内容7",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/95730f630a9d452dae10db0c9fdf57a2"
      },
      {
        "title": "已完成这个是已完成测试内容8",
        "time": "2019-08-09",
        "url":
            "https://p9.pstatp.com/list/190x124/pgc-image/ad714d51e0c34cb7a715fae11f751514"
      },
      {
        "title": "已完成这个是已完成测试内容9",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB"
      },
      {
        "title": "已完成这个是已完成测试内容10",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b"
      },
    ]
  },
  {
    "page": 2,
    "records": [
      {
        "title": "已完成这个是已完成测试内容11",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/51665edd045540008020d7723fcdad14"
      },
      {
        "title": "已完成这个是已完成测试内容12",
        "time": "2019-08-09",
        "url":
            "https://p9.pstatp.com/list/190x124/pgc-image/df5ab055356e49acbe60f5ec480185aa"
      },
      {
        "title": "已完成这个是已完成测试内容13",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN6ZvXZAYG02VN"
      },
      {
        "title": "已完成这个是已完成测试内容14",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RMyW2hq9YORZDn"
      },
      {
        "title": "已完成这个是已完成测试内容15",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/9ca80403c0244b8d9bee4b787c5cfe4f"
      },
      {
        "title": "已完成这个是已完成测试内容16",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN9a1qF5i55xBQ"
      },
      {
        "title": "已完成这个是已完成测试内容17",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/95730f630a9d452dae10db0c9fdf57a2"
      },
      {
        "title": "已完成这个是已完成测试内容18",
        "time": "2019-08-09",
        "url":
            "https://p9.pstatp.com/list/190x124/pgc-image/ad714d51e0c34cb7a715fae11f751514"
      },
      {
        "title": "已完成这个是已完成测试内容19",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB"
      },
      {
        "title": "已完成这个是已完成测试内容20",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b"
      },
    ]
  },
  {
    "page": 3,
    "records": [
      {
        "title": "已完成这个是已完成测试内容21",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/51665edd045540008020d7723fcdad14"
      },
      {
        "title": "已完成这个是已完成测试内容22",
        "time": "2019-08-09",
        "url":
            "https://p9.pstatp.com/list/190x124/pgc-image/df5ab055356e49acbe60f5ec480185aa"
      },
      {
        "title": "已完成这个是已完成测试内容23",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN6ZvXZAYG02VN"
      },
      {
        "title": "已完成这个是已完成测试内容24",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RMyW2hq9YORZDn"
      },
      {
        "title": "已完成这个是已完成测试内容25",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/9ca80403c0244b8d9bee4b787c5cfe4f"
      },
      {
        "title": "已完成这个是已完成测试内容26",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN9a1qF5i55xBQ"
      },
      {
        "title": "已完成这个是已完成测试内容27",
        "time": "2019-08-09",
        "url":
            "https://p3.pstatp.com/list/190x124/pgc-image/95730f630a9d452dae10db0c9fdf57a2"
      },
      {
        "title": "已完成这个是已完成测试内容28",
        "time": "2019-08-09",
        "url":
            "https://p9.pstatp.com/list/190x124/pgc-image/ad714d51e0c34cb7a715fae11f751514"
      },
      {
        "title": "已完成这个是已完成测试内容29",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB"
      },
      {
        "title": "已完成这个是已完成测试内容30",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b"
      },
    ]
  },
];
List listdata4 = [
  {
    "page": 1,
    "records": [
      {
        "title": "已完成这个是已完成测试内容1",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN6y0PNAFFMeET"
      },
      {
        "title": "已完成这个是已完成测试内容2",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/2e2510e8d3134628b9dab84154b09ac9"
      },
      {
        "title": "已完成这个是已完成测试内容3",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN9hixU8eHKq1n"
      },
      {
        "title": "已完成这个是已完成测试内容4",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RLabBZSDSLfnEG"
      },
      {
        "title": "已完成这个是已完成测试内容5",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RN1bl2nF8PVw5u"
      },
      {
        "title": "已完成这个是已完成测试内容6",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN92mMD32Ihikr"
      },
      {
        "title": "已完成这个是已完成测试内容7",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV"
      },
      {
        "title": "已完成这个是已完成测试内容8",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi"
      },
      {
        "title": "已完成这个是已完成测试内容9",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB"
      },
      {
        "title": "已完成这个是已完成测试内容10",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b"
      },
    ]
  },
  {
    "page": 2,
    "records": [
      {
        "title": "已完成这个是已完成测试内容11",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN6y0PNAFFMeET"
      },
      {
        "title": "已完成这个是已完成测试内容12",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/2e2510e8d3134628b9dab84154b09ac9"
      },
      {
        "title": "已完成这个是已完成测试内容13",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN9hixU8eHKq1n"
      },
      {
        "title": "已完成这个是已完成测试内容14",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RLabBZSDSLfnEG"
      },
      {
        "title": "已完成这个是已完成测试内容15",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RN1bl2nF8PVw5u"
      },
      {
        "title": "已完成这个是已完成测试内容16",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN92mMD32Ihikr"
      },
      {
        "title": "已完成这个是已完成测试内容17",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV"
      },
      {
        "title": "已完成这个是已完成测试内容18",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi"
      },
      {
        "title": "已完成这个是已完成测试内容19",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB"
      },
      {
        "title": "已完成这个是已完成测试内容20",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b"
      },
    ]
  },
  {
    "page": 3,
    "records": [
      {
        "title": "已完成这个是已完成测试内容21",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN6y0PNAFFMeET"
      },
      {
        "title": "已完成这个是已完成测试内容22",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/2e2510e8d3134628b9dab84154b09ac9"
      },
      {
        "title": "已完成这个是已完成测试内容23",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN9hixU8eHKq1n"
      },
      {
        "title": "已完成这个是已完成测试内容24",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RLabBZSDSLfnEG"
      },
      {
        "title": "已完成这个是已完成测试内容25",
        "time": "2019-08-09",
        "url": "https://p9.pstatp.com/list/190x124/pgc-image/RN1bl2nF8PVw5u"
      },
      {
        "title": "已完成这个是已完成测试内容26",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN92mMD32Ihikr"
      },
      {
        "title": "已完成这个是已完成测试内容27",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RN7ZzSsEtquYPV"
      },
      {
        "title": "已完成这个是已完成测试内容28",
        "time": "2019-08-09",
        "url": "https://p3.pstatp.com/list/190x124/pgc-image/RN7ZzcL664bRxi"
      },
      {
        "title": "已完成这个是已完成测试内容29",
        "time": "2019-08-09",
        "url": "https://p1.pstatp.com/list/190x124/pgc-image/RMk114gEjnNdFB"
      },
      {
        "title": "已完成这个是已完成测试内容30",
        "time": "2019-08-09",
        "url":
            "https://p1.pstatp.com/list/190x124/pgc-image/29b993c981e44f73b3eb581f0029877b"
      },
    ]
  },
];

class ReportApi {
  static String getVideoList_str =
      'http://bsapp.fm.easttone.com/foshan-basicservice-port/api/dingYue/list';

//
  Future<Map> getReportList(Map map) async {
    int status = map["status"];
    int pageNo = map["pageNo"];
//    int pageSize = map["pageSize"];
    List listdatax = getlist(status);
    Map returndata = listdatax.lastWhere((item) => item['page'] == pageNo);
    return returndata;
  }

  List getlist(int i) {
    List list = [];
    if (i == 1) {
      list = listdata1;
    } else if (i == 2) {
      list = listdata2;
    } else if (i == 3) {
      list = listdata3;
    } else if (i == 4) {
      list = listdata4;
    }
    return list;
  }

  // 视频列表
  Future<Map> getVoideList(Map map) async {
    BaseApi baseApi = new BaseApi();
    return await baseApi.BasePost_x(getVideoList_str, map) as Map;
  }
}
