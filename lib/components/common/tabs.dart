import 'package:flutter/material.dart';
// import 'package:demo/api/airticles.dart';

class tabs extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<tabs> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle disabledButtonStyle = ElevatedButton.styleFrom(
      fixedSize: Size.fromHeight(50.0),
      // 可以根据需要设置其他样式属性
    );
    List<Map<String, String>> list = [
      {"name": "1haha111"},
      {"name": "2"},
      {"name": "3"},
      {"name": "3"},
      {"name": "3"},
      {"name": "3"},

    ];
    List<Map<String, String>> list1 = [
      {"name": "1"}
    ];

    // 在某个函数或方法中调用登录功能
    Future<void> performLogin() async {
      try {
        // 调用登录函数，传递所需的参数
        // var responseData = await login(
        //     {'username': 'your_username', 'password': 'your_password'});

        // 处理登录成功的情况
        // print('Login successful! Response Data: $responseData');

        // 在这里执行其他逻辑，例如页面导航或状态更新
      } catch (error) {
        // 处理登录失败的情况
        print('Login failed! Error: $error');

        // 在这里执行适当的错误处理逻辑
      }
    }

    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(

            tabs: [
              Text('今日'),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: ListView.builder(
                    itemCount: list.length,
                    // itemExtent: 100, // 指定每个列表项的高度
                    itemBuilder: (BuildContext context, int index) {
                      return  GestureDetector(

                      onTap: () {
                        // 处理点击事件，可以在这里执行你的操作
                        print('Row Clicked!');
                        Navigator.pushNamed(context,'videoplayer');
                      },
                        child:Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start, // 控制垂直对齐
                                children: [
                              Image.asset(
                                'assets/images/xiao.jpg',
                                width: 120,
                                height: 70,
                              ),

                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$index'),
                                  const SizedBox(height: 20),
                                   Text('${list[index]['name']}'),
                                ],
                              )
                            ]),
                          ),

                          Divider(
                            height: 5, // 设置分隔线高度
                            color:
                                Color(0xFF8A898B).withOpacity(0.5), // 设置分隔线颜色
                          ),
                        ],
                      ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50, // 设置按钮高度
                    child: ElevatedButton.icon(
                      onPressed: performLogin,
                      icon: Icon(Icons.add, size: 18),
                      label: Text("CONTAINED BUTTON"),
                    ),
                  ),
                ),
                const Icon(Icons.directions_transit),
                const Icon(Icons.directions_bike),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
