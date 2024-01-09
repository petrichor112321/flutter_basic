import 'package:flutter/material.dart';
import '../main.dart';
// 引入各路由组件
import '../components/common/layout.dart';
import '../components/home.dart';
import '../components/login.dart';
import '../components/common/video.dart';
import '../components/common/scan.dart';
import '../components/register.dart'; //注册
import '../components/kefu.dart'; //客服
import '../components/notice.dart'; //消息
import '../components/classify.dart'; //分类
import '../components/center/my.dart'; //我的
import '../components/center/setting.dart'; //设置
import '../components/forget.dart'; //忘记密码

final routes = <String, WidgetBuilder> {
    '/': (context) => Layout(),
    'home': (context) => Home(),
    'login': (context) => Login(),
    'register': (context) => Register(),
    'kefu': (context) => Kefu(),
    'videoplayer': (context) => videoplayer(),
    'notice': (context) => Notice(),
    'classify': (context) => Classify(),
    'my': (context) => My(),
    'setting': (context) => Setting(),
    'forget': (context) => Forget(),
    'scan': (context) => ScanPage(),
};