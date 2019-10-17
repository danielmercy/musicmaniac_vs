import 'package:flutter/material.dart';
import 'package:musicmaniac/resources/colors.dart';
import 'package:musicmaniac/widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyTheme.background,
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                decoration: BoxDecoration(
                    color: MyTheme.primaryDeep,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(80))),
                child: Center()),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () => _scaffoldKey.currentState.openDrawer(),
                      )
                    ],
                  ),
                ),
              )
          ],
        )
      ]
    )
  );}
}