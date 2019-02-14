import 'package:flutter/material.dart';

import 'dart:math' as math;


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(icon: new Icon(Icons.keyboard_return), onPressed: (){
          Navigator.pop(context);
        }),
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child:
            //返回
//        new RaisedButton(
//          onPressed: () {
//            // Navigate back to first screen when tapped!
//            Navigator.pop(context);
//          },
//          child: new Text('Go back!'),
//        ),

          //listview用法
//      new ListView(
//        children: <Widget>[
//          new Text('测试服'),
//          new Text('正式服'),
//          new Text('c服')
//        ],
//      )
      new ListView.builder(
          itemBuilder: (context,index){
            var i= index++;
//          return new Text('dfad'+index.toString(),
//          style: TextStyle(color: Colors.blue,height: 3),
//          );

//            return new RaisedButton(
//                onPressed: (){
//                  debugPrint('onclick $i');
//                  },
//                child: new Text('$index'),
//                );
            return new itemView();
      },
        itemCount: 50,
      )
      ),
    );
  }
}

class itemView extends StatelessWidget{
  ///返回一个居中带图标和文本的Item
  _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return new Expanded(
      flex: 1,
      ///居中显示
      child: new Center(
        ///横向布局
        child: new Row(
          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,
          ///大小按照最大充满
          mainAxisSize : MainAxisSize.max,
          ///竖向也居中
          crossAxisAlignment : CrossAxisAlignment.center,
          children: <Widget>[
            ///一个图标，大小16.0，灰色
            new Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),
            ///间隔
            new Padding(padding: new EdgeInsets.only(left:5.0)),
            ///显示文本
            new Text(
              text,
              //设置字体样式：颜色灰色，字体大小14.0
              style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              //最长一行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Card(
        child: new FlatButton(
            onPressed: (){
              print('onclick ');

        },
//            child: new Text('大方了解到')),
            child: new Padding(
              padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ///文本描述
                  new Container(
                      child: new Text(
                        "这是一点描述",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        ///最长三行，超过 ... 显示
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                      alignment: Alignment.topLeft),
                  new Padding(padding: EdgeInsets.all(10.0)),

                  ///三个平均分配的横向图标文字
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _getBottomItem(Icons.star, "1000"),
                      _getBottomItem(Icons.link, "1000"),
                      _getBottomItem(Icons.subject, "1000"),
                    ],
                  ),
                ],
              ),
            )
        )
      ),
      );
  }

}

class CounterDisplay extends StatelessWidget{
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text('Count:$count');
  }

}

class CounterIncrementor extends StatelessWidget{
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
        onPressed: null,
        child: new Text('Increment'),);
  }
}

class CounterStateless extends StatefulWidget{

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    void _increment(){
//
//    }
//    return new Row(
//      children: <Widget>[
//        new CounterIncrementor(onPressed:_increment)
//      ],
//    );
//  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterStateless();
  }

}

class _CounterStateless extends State<CounterStateless> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CounterIncrementor(onPressed: _increment),
      new CounterDisplay(count:_counter),
    ]);
  }
}

//////////////////////////////有状态的控件//////////////////////////////////////////////
class Counter extends StatefulWidget{
  @override
  _CounterState createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State<Counter>{
  int _counter =0;

  void _increment(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(left: 100),
      child: new Row(
        children: <Widget>[
          new RaisedButton(
            color: Colors.blue,
            onPressed: _increment,
            child: new Text('Increment'),
          ),
          new Text('Count:$_counter',
              style: TextStyle(color: Colors.green)),
          new IconButton(
            color: Colors.red,
            onPressed: _increment,
            icon: new Icon(Icons.favorite),
          )
        ],
      ),
    );
  }

}
//////////////////////////////无状态的控件//////////////////////////////////////////////
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      onDoubleTap: (){
        print('onDoubleTap!');
      },
      onLongPress: (){
        print('onLongPress!');
      },
      child: new Container(
        height: 100.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.blue[500],
        ),
        child: new Center(
          child: new Text('Engage'),
        ),
      ),
    );
  }
}
//////////////////////////////自定义AppBar///////////////////////////////////////////////////
class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  // Widget子类中的字段往往都会定义为"final"

  final Widget title;

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    double topHeight = math.max(padding.top , EdgeInsets.zero.top); //计算状态栏的高度


    return new Container(
      height: 56.0+ topHeight, // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.only(top: topHeight),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        //列表项的类型是 <Widget>
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: _click, // null 会禁用 button
          ),
          // Expanded expands its child to fill the available space.
          new Expanded(
            child: title,
          ),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: _click,
          ),
        ],
      ),
    );
  }
}

  void _click(){
  print('This is onClick');
  debugPrint('哈哈');
  }
//////////////////////////////自定义Scaffold///////////////////////////////////////////////////
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的“一张纸”
//    return new Material(
//      // Column is 垂直方向的线性布局.
//      child: new Column(
//        children: <Widget>[
//          new MyAppBar(
//            title: new Text(
//              'Example title',
//              style: Theme.of(context).primaryTextTheme.title,
//            ),
//          ),
//          new Expanded(
//            child: new Center(
//              child: new Text('Hello, world!'),
//            ),
//          ),
//        ],
//      ),
//    );
    return new Scaffold(
      appBar: new AppBar(

        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null),
        title: new Text('title'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search),tooltip: 'search', onPressed: null)
        ],
      ),
      body: new Center(
        //无状态控件
//        child: new MyButton(),
      //有状态的控件
      child: new Counter(),
//        child: new CounterStateless(),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: 'add',
          child: new Icon(Icons.add),
          onPressed: (){
            debugPrint('哈哈哈');
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => SecondScreen()));
          }),
    );
  }

  void jumpTo(BuildContext context){
    Navigator.push(context, 
        new MaterialPageRoute(builder: (context) => MyAppBar()));
  }

}

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.fallback(),
    title: 'My app', // used by the OS task switcher
    home: new MyScaffold(),
  ));
}