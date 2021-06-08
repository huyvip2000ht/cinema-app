import 'package:flutter/material.dart';

class StoreAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  final double toolBarHeight = 300;

  const StoreAppBar({Key key, this.title, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
      toolbarHeight: toolBarHeight,
      title: title,
      backgroundColor: backgroundColor,
        leading: Builder(builder: (context) =>
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
        ),
      actions: [
        Column(
          children: <Widget>[
            IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications),
            ),
            Text("data")
          ]
        )
      ],
    );
  }
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}