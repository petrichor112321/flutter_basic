import 'package:flutter/material.dart';
import '../../components/home.dart';
import '../../components/classify.dart';
import '../../components/kefu.dart';
import '../../components/center/my.dart';

// 底部导航切换的菜单组件
final pages = <Widget>[Home(),Classify(),Kefu(),My()];

// 导航标题
final titles = ['首页','分类','客服','我的'];

// 底部菜单需要显示的组所有的子项
final List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.view_list), label: ('分类')),
    BottomNavigationBarItem(icon: Icon(Icons.phone_in_talk), label: ('客服')),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ('我的'))
];




