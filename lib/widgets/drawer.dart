import 'package:flutter/material.dart';
import 'package:musicmaniac/pages/home.dart';
import 'package:musicmaniac/pages/profile.dart';
import 'package:musicmaniac/stores/user/user.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {

  AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserStore store = Provider.of<UserStore>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: Drawer(
        key: key,
        child: Container(
          color: Colors.yellow,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Timeline",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                dense: true,
                leading: Icon(Icons.timeline),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                title: Text("Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                dense: true,
                leading: Icon(Icons.account_circle),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
              ListTile(
                title: Text("Settings",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                dense: true,
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
              ListTile(
                title: Text("Log out",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                dense: true,
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context).pop();
                  store.logout();
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
