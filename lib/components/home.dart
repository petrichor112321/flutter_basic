import 'package:flutter/material.dart';
import './common/service_item.dart';
import './common/mock_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final body = Stack(
      children: [
        Column(
          children: <Widget>[
            Column(children: [
              Container(
                // 如果不需要固定高度，可以省略 height 属性
                // height: 80.0,
                child: Container(
                  height: 200.0,
                  alignment: Alignment.center,
                  color: Color(0xFF2196F3),
                ), // 子组件
              ),
              SizedBox(height: 100),
              Text(
                '设备总览',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                  // 其他样式属性...
                ),
              ),
              Container(
                // 如果不需要固定高度，可以省略 height 属性
                // height: 80.0,
                margin: EdgeInsets.all(10),
                child: Container(
                  height: 200.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ), // 子组件
              ),
            ]),

          ],
        ),
        Positioned(
          top: 150.0, // Adjust the bottom margin as needed
          left: 0,
          right: 0,
          child: Container(
            height: 100.0,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
              children: serviceList
                  .map((it) => ServiceItem(data: it, key: null))
                  .toList(),
            ),
          ),
        )
      ],
    );
    return Scaffold(
      body: body,
      backgroundColor: Color(0xFFF3F3F3), // 设置整个页面的背景色

    );
  }
}
