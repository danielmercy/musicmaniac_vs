import 'package:flutter/material.dart';
import 'package:musicmaniac/models/user.model.dart';
import 'package:musicmaniac/pages/video_detail.dart';
import 'package:musicmaniac/resources/colors.dart';

class VideoCard extends StatelessWidget {
  final User user;

  const VideoCard({
    this.user,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Container(
        width: double.infinity,
        height: 240,
        child: Card(
          color: Color(0xFF1E0348),
          elevation: 5,
          child: Column(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) => VideoDetailsPage(
                          user: user,
                        )
                      )
                    )
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/image2.jpg",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(.5),
                      ),
                      Align(
                        alignment: Alignment(-.05, 0),
                        child: IconButton(
                          icon: Icon(
                            Icons.play_circle_filled,
                            size: 48,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context) => VideoDetailsPage(
                                  user: user,
                                )
                              )
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: Container(
                  color: MyTheme.primaryDeep,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                // backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  user.avatar,
                                ),
                                radius: 20,
                              ),
                            ),

                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${user.fullname}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16
                                    ),
                                  ),
                                  Text(
                                    "5 mins ago",
                                    style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: 1
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.comment,
                                color: Colors.amber,
                                size: 24
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Colors.amber,
                                size: 24
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}