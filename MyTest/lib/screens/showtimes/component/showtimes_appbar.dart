import 'package:flutter/material.dart';

class ShowTimesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  final double toolBarHeight = 300;
  //final List<Widget> widgets;

  /// you can add more fields that meet your needs

  const ShowTimesAppBar({Key key, this.title, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolBarHeight,
      //toolbarHeight: 300,
      title: title,
      backgroundColor: backgroundColor,

        leading: Builder(builder: (context) =>
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),

            )),

      actions: [
        Column(
            children:<Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: null,
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
