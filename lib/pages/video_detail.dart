import 'package:flutter/material.dart';
import 'package:musicmaniac/models/user.model.dart';
import 'package:musicmaniac/resources/colors.dart';
import 'package:musicmaniac/stores/user/user.dart';
import 'package:musicmaniac/widgets/button.dart';
import 'package:musicmaniac/widgets/drawer.dart';
import 'package:musicmaniac/widgets/video_actions.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class VideoDetailsPage extends StatefulWidget {
  final User user;
  double rating = 0;
  // final

  VideoDetailsPage({this.user});

  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final UserStore store = Provider.of<UserStore>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      backgroundColor: MyTheme.background,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  decoration: BoxDecoration(
                      color: MyTheme.primaryDeep,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(80))),
                  child: Center()),
              AppBar(
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
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 35,
                        // backgroundColor: Colors.blue,
                        backgroundImage: AssetImage("${widget.user.avatar}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          "${store.currentUser.fullnameReversed}",
                          style: TextStyle(
                            color: MyTheme.background,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          "${widget.user.rank}",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          "Lorem ipsim dit amor sit amorir lorem ipsim dit amor sit amorir",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Submission",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18)),
            ),
          ),
          Center(
            child: SizedBox(
              width: 240,
              height: 140,
              child: Stack(
                // fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/image2.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(.5)),
                  ),
                  Center(
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Colors.red,
                      size: 48,
                    ),
                  )
                ],
              ),
            ),
          ),
          SmoothStarRating(
              allowHalfRating: false,
              onRatingChanged: (v) {
                widget.rating = v;
                setState(() {});
              },
              starCount: 5,
              rating: widget.rating,
              size: 40.0,
              color: Colors.amber,
              borderColor: Colors.amber,
              spacing: 0.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonWidget(
              color: ButtonStyles.PRIMARY,
              mode: ButtonStyles.FLAT,
              text: 'Bet',
              width: 120,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              // height: ,
              decoration: BoxDecoration(
                  color: MyTheme.primary,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(child: VideoActions()),
            ),
          )
        ],
      ),
    );
  }
}
