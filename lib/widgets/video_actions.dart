import 'package:flutter/material.dart';

class VideoActions extends StatefulWidget {
  final Color iconColor = Colors.amber;

  @override
  _VideoActionsState createState() => _VideoActionsState();
}

class _VideoActionsState extends State<VideoActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: widget.iconColor
                    ),
                    SizedBox(width: 5),
                    Text(
                      "2058",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider(
          height: 24,
          color: Colors.black,
        ),
        Expanded(
          child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.comment,
                      color: widget.iconColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "2058",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: widget.iconColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "2058",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}