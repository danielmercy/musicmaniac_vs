import 'package:flutter/material.dart';
import 'package:musicmaniac/widgets/signup.dart';
import './login.dart';
import 'package:musicmaniac/resources/colors.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.background,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 240,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/image2.jpg"),
                          fit: BoxFit.cover)),
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Color(0xFF1E063D).withOpacity(.8)),
                ),
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: MyTheme.secondary,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 240,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/fls.png'),
                              fit: BoxFit.fitWidth
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Lorem ipsim dit amor sit amorir lorem ipsim dit amor sit amorir",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlatButton(
                        child: Text(
                          "Already have an account? Login",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      )),
                  
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SignUp(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("There will be some checkbox here"),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
