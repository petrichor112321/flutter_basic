import 'package:flutter/material.dart';
import 'service_item.dart';

// 我的 列表菜单
const List<ServiceItemViewModel> serviceList = [
    ServiceItemViewModel(
        title: '总设备',
        num: '1',
        icon: Icon(
            Icons.adjust,
            size: 25,
            color: Colors.lightBlue,
        ),
    ),
    ServiceItemViewModel(
        title: '运行中',
        num: '2',
        icon: Icon(
            Icons.content_paste,
            size: 25,
            color: Colors.lightBlue,
        ),
    ),
    ServiceItemViewModel(
        title: '报警',
        num: '3',
        icon: Icon(
            Icons.card_giftcard,
            size: 25,
            color: Colors.lightBlue,
        ),
    ),
    ServiceItemViewModel(
        title: '离线',
        num: '5',
        icon: Icon(
            Icons.shopping_cart,
            size: 25,
            color: Colors.lightBlue,
        ),
    ),
];