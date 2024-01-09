import 'package:flutter/material.dart';
import '../api/airticles.dart';
import 'dart:convert';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Classify extends StatefulWidget {
  @override
  _ClassifyState createState() => _ClassifyState();
}

class _ClassifyState extends State<Classify> {
  List<String> myList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 3',
    'Item 3',
    'Item 3',
    'Item 3'
  ];
  bool isPopVisible = false;
  bool refreshing = false;
  bool reachedBottom = false;
  EasyRefreshController easyRefreshController = new EasyRefreshController();

  void toggleOverlayVisibility() {
    setState(() {
      isPopVisible = !isPopVisible;
    });
  }
  ScrollController _scrollController = ScrollController();
  void updateList() {
    print('1212');

    // 在这里更新列表
    // fetchData();

    setState(() {
      myList = ['Updated Item 1', 'Updated Item 2', 'Updated Item 3'];
    });
  }

  Future<void> fetchData() async {
    print('1212');
    Map<String, dynamic> requestData = {
      'username': 'your_username',
      'password': 'your_password',
      // 添加其他请求参数...
    };
    // 模拟异步请求，实际中替换成你的 API 请求逻辑
    final response = await login(requestData);

    if (response.statusCode == 200) {
      // 解析响应数据
      // final List<dynamic> data = json.decode(response.body);
      // 返回处理后的数据，这里只是简单地取出 title 字段作为字符串列表
      // return data.map((item) => item['title'].toString()).toList();
    } else {
      // 如果请求失败，抛出异常
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final body = DefaultTabController(
      length: 7,
      // padding: EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //线性布局
        children: [
          Row(
            children: [
              //tabs顶部分类
              Container(
                width: MediaQuery.of(context).size.width - 50, // 设备宽度减去 50
                // alignment: Alignment.topLeft,
                child: const TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start, //去除默认间距
                  tabs: [
                    Tab(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      // 调整间距
                      child: Text('Tab 1'),
                    )),
                    Tab(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      // 调整间距
                      child: Text('Tab 2'),
                    )),
                    Tab(icon: Icon(Icons.directions_bike)),
                    Tab(icon: Icon(Icons.directions_bike)),
                    Tab(icon: Icon(Icons.directions_bike)),
                    Tab(icon: Icon(Icons.directions_bike)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
              ),
              //tabs右侧加号 下拉框
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  toggleOverlayVisibility();
                },
                child: Container(
                  decoration: BoxDecoration(),
                  child: Icon(Icons.add),
                ),
              )),
            ],
          ),
          //tabs底部页面
          Expanded(
            child: TabBarView(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(children: [
                        Expanded(
                          child: Container(

                            margin: EdgeInsets.only(left: 20,right: 20),
                          child:ListView.builder(
                            itemCount: myList.length,
                            // itemExtent: 100, // 指定每个列表项的高度
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  // 处理点击事件，可以在这里执行你的操作
                                  print('Row Clicked!');
                                  fetchData();
                                  Navigator.pushNamed(context, 'videoplayer');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                               child:Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start, // 控制垂直对齐
                                          children: [
                                            Image.asset(
                                              'assets/images/xiao.jpg',
                                              width: 120,
                                              height: 70,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('$index'),
                                                const SizedBox(height: 20),
                                                Text('${myList[index]}'),
                                              ],
                                            )
                                          ]),
                                    ),

                                  ],
                                ),
                                ),

                              );
                            },
                          ),
                          ),
                        ),
                      ]),
                    ),

                    // 遮罩层
                    Visibility(
                      visible: isPopVisible,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        // 其他你可能想要的样式或内容
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Visibility(
                        visible: isPopVisible,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: isPopVisible ? 180 : 0,
                          curve: Curves.easeInOut,
                          // 添加动画曲线
                          width: MediaQuery.of(context).size.width,
//边框
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0), // 左上角圆角
                              bottomRight: Radius.circular(16.0), // 右上角圆角
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                EasyRefresh(
                  controller: easyRefreshController,
                  header: ClassicalHeader(
                    refreshText: '下拉刷新',
                    refreshReadyText: '释放刷新',
                    refreshingText: '刷新中...',
                    refreshedText: '刷新完成',
                    refreshFailedText: 'Refresh failed',
                    noMoreText: 'No more data',
                    infoText: 'Last update: MM-dd HH:mm',
                    // Optional: Display last update time
                    showInfo:
                        true, // Optional: Whether to display last update time
                  ),
                  footer: reachedBottom? ClassicalFooter(
                    loadText: '上拉加载更多',
                    loadReadyText: 'Release to load more',
                    loadingText: 'Loading...',
                    loadedText: '加载完成',
                    loadFailedText: 'Load failed',
                    noMoreText: '没有更多了',
                    showInfo: true,
                  ):ClassicalFooter(
                    loadedText: '没有更多了',
                    showInfo: true,
                  ), // 如果没有更多数据，将 footer 设置为只显示 "No more data",
                  onRefresh: () async {
                    // 处理刷新逻辑
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      myList = [
                        'Updated Item 1',
                        'Updated Item 2',
                        'Updated Item 3'
                      ];
                      refreshing=true;
                    });
                  },

                  onLoad: () async {
                    // 模拟加载更多操作

                    // 添加滚动监听
                    _scrollController.addListener(() {
                      // print('触底了！');
                      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent&&!refreshing) {
                        // 触底逻辑
                        print('触底了！');
                        reachedBottom=true;
                        setState(() {
                          myList.addAll(['New Item 4', 'New Item 5']);
                        });
                      }
                    });

                  },
                  child: ListView.builder(
                    itemCount: myList.length,
                    controller: _scrollController,
                    // itemExtent: 100, // 指定每个列表项的高度
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          // 处理点击事件，可以在这里执行你的操作
                          print('Row Clicked!');
                          Navigator.pushNamed(context, 'videoplayer');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // 控制垂直对齐
                                  children: [
                                    Image.asset(
                                      'assets/images/xiao.jpg',
                                      width: 120,
                                      height: 70,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('$index'),
                                        const SizedBox(height: 20),
                                        Text('${myList[index]}'),
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

                Icon(Icons.directions_transit),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
                const Icon(Icons.directions_bike),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: body,
      backgroundColor: Color(0xFFF3F3F3), // 设置整个页面的背景色
    );
  }
}
