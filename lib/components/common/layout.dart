import 'package:flutter/material.dart';
import '../../components/common/bottomNavItem.dart';



class Layout extends StatefulWidget{
    @override

    _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout>{

    // 选中底部导航栏下标
    int _actInx = 0;

    @override
    Widget build(BuildContext context){
      List<Widget> actions=[];
      if (_actInx ==  0) {
        actions = [
          IconButton(
            icon: Image.asset('assets/images/scan.png', width: 24, height: 24),
            onPressed: () {
              // 处理扫码按钮被点击的逻辑
              // 在这里添加你的扫码逻辑
              Navigator.pushNamed(context, 'scan');
              print('扫码按钮被点击');
            },
          ),
        ];
      } else if(_actInx ==  4){
        actions = [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, 'setting');
            },
          ),
        ];
      }
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue,
                elevation: 0.0, //导航栏阴影
                centerTitle: true,
                title: _actInx==4?null:Text(titles[_actInx],style: TextStyle(color: Colors.white)),
                actions: actions,
                leading: _actInx!=0?null:Builder(builder: (context) {
                    return IconButton(
                        icon: Icon(Icons.menu, color: Colors.white), //自定义图标
                        onPressed: () {
                            // 打开抽屉菜单
                            Scaffold.of(context).openDrawer();
                        },
                    );
                }),
            ),
            body: pages[_actInx],
            bottomNavigationBar: BottomNavigationBar(
                items: bottomNavBarItems,
                onTap: _changePage,
                currentIndex: _actInx,
                fixedColor: Colors.blue,
                iconSize: 25.0,
                selectedFontSize:14.0, //选中时的大小
                elevation: 0.0, // 取消阴影效果
                unselectedFontSize:12.0, //未选中时的大小
                type: BottomNavigationBarType.fixed, //底部显示方式
            ),
            drawer: _actInx!=0?null:Drawer(
                child: ListView(
                    padding: EdgeInsets.zero, //去掉顶部灰色部分
                    children: <Widget>[
                        DrawerHeader(
                            decoration: BoxDecoration(color: Colors.blue[300]),
                            child: UnconstrainedBox( //解除父级的大小限制
                                child: CircleAvatar(
                                    radius: 48,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage('assets/images/avatar.png')
                                ),
                            ),
                        ),
                        ListTile(
                            leading: Icon(Icons.person,color: Colors.blue),
                            title: Text("我的",style: TextStyle(fontSize: 16.0)),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){
                                Navigator.pop(context);
                                setState(() {_actInx = 4;});
                            },
                        ),
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.volume_up,color: Colors.blue),
                            title: Text("消息",style: TextStyle(fontSize: 16.0)),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){
                                Navigator.pop(context);
                                Navigator.pushNamed(context, 'notice');
                            },
                        ),
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.settings,color: Colors.blue),
                            title: Text("设置",style: TextStyle(fontSize: 16.0)),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){
                                Navigator.pop(context);
                                Navigator.pushNamed(context, 'setting');
                            },
                        ),
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.share,color: Colors.blue),
                            title: Text("分享",style: TextStyle(fontSize: 16.0)),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){

                            },
                        ),
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.open_in_new,color: Colors.blue),
                            title: Text("退出",style: TextStyle(fontSize: 16.0)),
                            trailing: Icon(Icons.chevron_right),
                            onTap: (){

                            },
                        ),
                    ],
                ),
            ),
            drawerEdgeDragWidth: 0.0, //禁止手势侧滑出Drawer
            // floatingActionButton: _actInx!=0?null:FloatingActionButton(
            //     child: Icon(Icons.airplanemode_active,size: 28.0,color: Colors.white),
            //     onPressed: (){},
            // ),
        );
    }
    void _changePage(int inx){
        setState(() {
            if(inx != this._actInx){
                _actInx = inx;
            }
        });
    }
}