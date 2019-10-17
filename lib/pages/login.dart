import 'package:flutter/material.dart';
import 'package:musicmaniac/widgets/signin.dart';
import 'package:musicmaniac/pages/register.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF6706CB), Color(0xFF1E0348)],
                  begin: FractionalOffset(0.3, 0.3),
                  end: FractionalOffset(1.0, 1.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                // leading: IconButton(
                //   icon: Icon(
                //     Icons.arrow_back,
                //     color: Colors.black87,
                //   ),
                //   onPressed: () => Navigator.pop(context),
                // ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 240,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/maniac.png'),
                        fit: BoxFit.fitWidth
                      )
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 240,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/fls.png'),
                        fit: BoxFit.fitWidth
                      )
                    ),
                  )
                ],
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: SignIn(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                              FlatButton(
                                child: Text(
                                  'New to Music Maniac? Sign Up',
                                  style: TextStyle(
                                      color: Colors.yellowAccent[400]),
                                ),
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationPage())),
                              )
                            ],
                          )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
