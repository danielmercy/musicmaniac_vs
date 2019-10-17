import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musicmaniac/repositories/mock.dart';
import 'package:musicmaniac/stores/user/user.dart';
import 'package:musicmaniac/widgets/drawer.dart';
import 'package:musicmaniac/widgets/video_card.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    final UserStore store = Provider.of<UserStore>(context);
    print("Current User from Store: ${store.currentUser}");
    return view(context, store, _scaffoldKey);
  }

  Widget view(BuildContext context, UserStore store, GlobalKey<ScaffoldState> _scaffoldKey) {
    // User currentUser = snapshot.data;
    var stack = Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 320,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/image2.jpg"),
                  fit: BoxFit.cover)),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFF000000).withOpacity(.8)),
        ),
        Center(
          child: SizedBox(
            width: double.infinity,
            height: 320,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 0,
                ),
                Container(
                  width: 180,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('assets/images/fls.png'),
                      fit: BoxFit.cover
                    )
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.blue,
                  backgroundImage: AssetImage("${users[4].avatar}"),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Observer(
                    builder: (context) => Text(
                      "${store.currentUser?.fullname ?? ""}",
                      // "Lorem ipsim dit amor sit amorir lorem ipsim dit amor sit amorir",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        )
      ],
    );
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF2F0367),
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: stack,
            ),
            expandedHeight: 290,
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              color: Color(0xFF00FFF0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 24,
                            // backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage("${users[index].avatar}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${users[index].rank}",
                              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepPurple),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, i) => SizedBox(
                  width: 5,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => VideoCard(user: users[index],),
                  childCount: users.length),
            ),
          )
        ],
      ),
    );
  }

  Widget loading() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
