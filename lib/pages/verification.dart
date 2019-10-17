import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Container(
                          width: 240,
                          height: 120,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20),
                        child: Text(
                          "Verify your number",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 0),
                        child: Text(
                          "Kindly provide the verification code we sent to your phone number.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 0),
                        child: Text(
                          "+234 81 112 345 34",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  maxLength: 1,
                                  maxLengthEnforced: true,
                                  enableInteractiveSelection: true,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      counterText: ''),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  maxLength: 1,
                                  maxLengthEnforced: true,
                                  enableInteractiveSelection: true,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      counterText: ''),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  maxLength: 1,
                                  maxLengthEnforced: true,
                                  enableInteractiveSelection: true,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      counterText: ''),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  maxLength: 1,
                                  maxLengthEnforced: true,
                                  enableInteractiveSelection: true,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      counterText: ''),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  maxLength: 1,
                                  maxLengthEnforced: true,
                                  enableInteractiveSelection: true,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      counterText: ''),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Center(
                            child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Didn't recieve the code?",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            FlatButton(
                              child: Text(
                                "Request new code",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {},
                            )
                          ],
                        )),
                      ),
                      Center(
                        child: FlatButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Back",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))
                            ],
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ]))));
  }
}
