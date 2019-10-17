import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicmaniac/pages/home.dart';
import 'package:musicmaniac/pages/login.dart';
import 'package:musicmaniac/pages/splashscreen.dart';
import 'package:musicmaniac/providers/auth.provider.dart';
import 'package:musicmaniac/repositories/profile.repository.dart';
import 'package:musicmaniac/stores/user/user.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            builder: (context) => AuthProvider(),
          ),
          Provider<UserStore>(
            builder: (_) => UserStore(),
          )
        ],
        child: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Music Maniac Application',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: _handleCurrentScreen(auth),
            );
          },
        ));
  }

  Widget _handleCurrentScreen(AuthProvider auth) {
    print("Auth from main $auth");
    final ProfileService _profileService = ProfileService();
    return StreamBuilder<FirebaseUser>(
        stream: auth.onAuthStateChanged,
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            if (snapshot.hasData) {
              final user = _profileService.currentUser(snapshot.data.uid);
              print(" Data from main $user");
              return HomePage();
            }
            return new LoginPage();
          }
        });
  }
}
