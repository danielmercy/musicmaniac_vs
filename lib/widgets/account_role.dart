import 'package:flutter/material.dart';
import 'package:musicmaniac/resources/colors.dart';

class AccountRoleModel {
  bool selected = false;
  String title;
  String description;

  AccountRoleModel(this.selected, this.title, this.description);

  Map<String, dynamic> toMap() {
    return {'title': title.toLowerCase(), 'description': description, 'selected': selected};
  }
}

class AccountRoles extends StatefulWidget {
  final Function onPress;

  AccountRoles({@required this.onPress});

  @override
  _AccountRolesState createState() => _AccountRolesState();
}

class _AccountRolesState extends State<AccountRoles> {
  List<AccountRoleModel> roles = <AccountRoleModel>[];

  @override
  void initState() {
    super.initState();
    roles.add(
        AccountRoleModel(false, "Sponsor", "Lorem ipsim dit amor sit amorir"));
    roles
        .add(AccountRoleModel(false, "Fan", "Lorem ipsim dit amor sit amorir"));
    roles.add(
        AccountRoleModel(false, "Artist", "Lorem ipsim dit amor sit amorir"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: roles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index != 0
                ? EdgeInsets.only(right: 20, top: 8)
                : EdgeInsets.only(right: 20, left: 0, top: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  roles.forEach((item) => item.selected = false);
                  roles[index].selected = true;
                });
                widget.onPress(roles[index]);
              },
              child: AccountRoleItem(roles[index]),
            ),
          );
        },
      ),
    );
  }
}

class AccountRoleItem extends StatelessWidget {
  final AccountRoleModel _item;

  AccountRoleItem(this._item);

  // void toggleSelection() {
  //   setState(() {
  //     widget._selected = !widget._selected;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          width: 140,
          height: 120,
          decoration: BoxDecoration(
              color: MyTheme.primary,
              border: Border.all(
                color: _item.selected ? Colors.white : MyTheme.primary,
                width: 2,
                // style: widget._selected ? BorderStyle.solid : BorderStyle.none
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _item.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  _item.description ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
        if (_item.selected)
          Positioned(
              top: -8,
              right: -8,
              child: Image.asset(
                'assets/icons/check.png',
                width: 24,
                height: 25,
              ))
      ],
    );
  }
}
